# dockerfile

Dockerfiles for Beignet and NVIDIA systems.

## Testing

### Pre-requisites

- have installed docker

### Beignet platform

#### Pre-requisites

- have ubuntu with an Intel HD GPU device

#### Procedure:
```
git clone --recursive https://github.com/hughperkins/cuda-on-cl
cd cuda-on-cl/docker
docker build ./ --file Dockerfile-beignet -t coclbeignet
sudo docker run --device /dev/dri:/dev/dri -it coclbeignet
```

(Based on https://github.com/chihchun/opencl-docker, following heads-up from bhack)

<img src="https://github.com/hughperkins/cuda-on-cl/raw/master/doc/img/dockerfile_beignet_cudasample.png?raw=true" width="600" />

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

### Other platforms

- You'll need to find a way of using docker with your gpu driver.
- Then copy and hack one of the existing dockerfiles to work with your device/driver.

You might find some options at: https://github.com/chihchun/opencl-docker

Update: bhack informed me of a project to let one run docker containers on beignet https://github.com/chihchun/opencl-docker

## Generic options

In all cases, you can choose which branch to build, using `--build-arg GIT_BRANCH=mybranchnamehere`, like:
```
docker build ./ -t cocl --build-arg GIT_BRANCH=runtime-compile
```
