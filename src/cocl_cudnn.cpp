#include "cudnn.h"

#include <iostream>
#include <string>
#include <stdexcept>
using namespace std;

namespace cocl {
namespace dnn {

const char *cudnnGetErrorString(size_t error) {
    throw runtime_error("not impelmented cudnnGetErrorString");
}

} // namespace dnn
} // namespace cocl
