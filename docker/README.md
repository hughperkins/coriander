# dockerfile

This is unlikely to work on your system, since your gpu driver probalby wont be visible inside the container?

Ymmv though, and personally I'm using this to make sure that things at least build ok.  (I often miss things when
hacking around the CMakeLists.txt file etc...)

## Testing

### Pre-requisites

- have installed docker

### Non-nvidia platforms

- You can build.  But you wont be able to run.  Since no OpenCL driver...

To build:
```
git clone --recursive https://github.com/hughperkins/cuda-on-cl
cd cuda-on-cl/docker
docker build ./ -t cocl
```

Update: bhack informed me of a project to let one run docker containers on beignet https://github.com/chihchun/opencl-docker

### NVIDIA platforms

#### Pre-requisites

- have installed nvidia-docker, nvidia driver etc, so that the following works ok:
```
nvidia-docker run -t nvidia/cuda:8.0-cudnn5-devel nvidia-smi
```

#### Procedure

Build:
```
git clone --recursive https://github.com/hughperkins/cuda-on-cl
cd cuda-on-cl/docker
docker build ./ -t coclnvidia --file Dockerfile-nvidia
```
Run:
```
nvidia-docker run -it coclnvidia
```
Test a `cocl` compilation:
```
cd /tmp
mkdir foo
cd foo
cp /cuda-on-cl/test/cuda_sample.cu .
cocl cuda_sample.cu
./cuda_sample
```
