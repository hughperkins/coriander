// Copyright Hugh Perkins 2017

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "DebugDumper.h"

#include <iostream>

#include "EasyCL/EasyCL.h"

#include "cocl/hostside_opencl_funcs.h"
#include "cocl/cocl_memory.h"

using namespace std;

namespace cocl {

DebugDumper::DebugDumper(LaunchConfiguration *launchConfiguration) :
        launchConfiguration(launchConfiguration) {
}

void DebugDumper::dump() {
    // we assume that dump config is enabled, and the dump config has been loaded ,successfully
    YAML::Node kernelConfig = dumpConfig[launchConfiguration->uniqueKernelName];
    if(kernelConfig) {
        cout << "Dumping for " << launchConfiguration->uniqueKernelName << " in dump config" << endl;
        // cout << dumpConfig[launchConfiguration->uniqueKernelName] << endl;
        // YAML::Node kernelConfig = 
        int argIdx = 0;
        for(auto it=kernelConfig.begin(); it != kernelConfig.end(); it++) {
            YAML::Node argConfig = *it;
            // cout << "kernelConfig: " << argConfig << endl;

            int count = argConfig["count"].as<int>();
            uint64_t offsetBytes = 0;
            cl_mem clmem;
            std::string argTypeName = argConfig["type"].as<std::string>();

            if(argConfig["virtualaddress"]) {
                if(argConfig["offsetarg"] || argConfig["offsetbytes"] || argConfig["clmem"]) {
                    std::cout << "buffer " << argIdx << ": cannot specify both virtualaddress, and any of offsetarg or offsetbytes or clmem" << endl;
                    continue;
                }
                unsigned long virtualAddress = argConfig["virtualaddress"].as<int>();
                Memory *memory = findMemory((char *)virtualAddress);
                offsetBytes = memory->getOffset((char *)virtualAddress);
                clmem = memory->clmem;
                cout << "  Dumping buffer " << argIdx << " virtualaddress=" << virtualAddress << " " << " offset in buffer " << offsetBytes << " " << argTypeName << "s:" << endl;
            } else {
                if(argConfig["offsetarg"] && argConfig["offsetbytes"]) {
                    cout << "buffer " << argIdx << ": cannot specify both offsetArg and offsetBytes. Choose one :-)  => skipping arg " << argIdx << endl;
                    continue;
                }
                int clmemIndex = argConfig["clmem"].as<int>();
                if(clmemIndex >= launchConfiguration->clmems.size() || clmemIndex < 0) {
                    cout << "buffer " << argIdx << ": clmemIndex out of bounds => skipping arg" << endl;
                    continue;
                }
                clmem = launchConfiguration->clmems[clmemIndex];
                // cout << "offsetarg: " << offsetArg << endl;
                if(argConfig["offsetarg"]) {
                    int offsetArg = argConfig["offsetarg"].as<int>();
                    if(offsetArg < 0 || offsetArg >= launchConfiguration->args.size()) {
                        cout << "buffer " << argIdx << ": offsetArg out of bounds => skipping arg" << endl;
                        continue;
                    }
                    offsetBytes = llvm::cast<Int64Arg>(launchConfiguration->args[offsetArg].get())->v;
                } else {
                    offsetBytes = argConfig["offsetbytes"].as<int>();
                }
                cout << "  Dumping buffer " << argIdx << " clmem" << clmemIndex << " offset=" << offsetBytes << " " << argTypeName << "s:" << endl;
            }
            // cout << "offsetBytes " << offsetBytes << endl;

            // cout << "argTypeName: [" << argTypeName << "]" << endl;
            if(argTypeName == "float" || argTypeName == "int32") {
                float *hostBuffer = new float[count];
                // cout << "clmem " << clmem << endl;
                if(clmem == 0) {
                    cout << "    [Null]" << endl;
                } else {
                    cl_int err = clEnqueueReadBuffer(launchConfiguration->queue->queue, clmem, CL_TRUE, offsetBytes,
                                                     count * sizeof(float), hostBuffer, 0, NULL, NULL);
                    easycl::EasyCL::checkError(err);
                    ostringstream buf;
                    // buf << "    ";
                    for(int i = 0; i < count; i++) {
                        if(argTypeName == "float") {
                            buf << hostBuffer[i] << " ";
                        } else if(argTypeName == "int32") {
                            buf << *(int *)&hostBuffer[i] << " ";
                        }
                        if(buf.tellp() > 70) {
                            cout << "    " << buf.str() << endl;
                            buf.str("");
                        }
                    }
                    if(buf.tellp() > 0) {
                        cout << "    " << buf.str() << endl;
                    }
                }
            } else {
                cout << "type name [" + argTypeName + "] not recognized" << endl;
            }
            if(argConfig["stopafter"] && argConfig["stopafter"].as<bool>()) {
                cout << "dump config requested stop after this arg, so stopping now" << endl;
                exit(0);
            }
            argIdx++;
        }
    }
}

void DebugDumper::maybeDump() {
    // we are going to assume we're already inside a mutex, and therefore
    // guaranteed to be running single-threaded
    if(!checkedDumpEnabled) {
        if(getenv("COCL_DUMP_CONFIG") != 0) {
            string dumpConfigFile = getenv("COCL_DUMP_CONFIG");
            cout << "Attemptign to load dump config from [" << dumpConfigFile << "]" << endl;
            dumpEnabled = true;
            dumpConfig = YAML::LoadFile(dumpConfigFile);
        }
        checkedDumpEnabled = true;
    }
    if(dumpEnabled) {
        dump();
    }
}

} // namespace cocl
