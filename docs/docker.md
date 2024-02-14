# dockerfile

Dockerfiles for Beignet, generic AMD (mesa), and NVIDIA 1404 systems.

~~Note that the nvidia dockerfile uses Ubuntu 14.04 for now.~~

## Testing

### Pre-requisites

- have installed docker

### Build
Clone Repo and Build container:
```
git clone --recursive https://github.com/hughperkins/Coriander
docker compose build
```

### Beignet platform

#### Pre-requisites

- have ubuntu with an Intel HD GPU device

#### Procedure:
```
docker compose run beignet
```

(Based on https://github.com/chihchun/opencl-docker, following heads-up from bhack)

<img src="https://github.com/hughperkins/Coriander/raw/master/doc/img/dockerfile_beignet_cudasample.png?raw=true" width="600" />

### AMD platforms

#### Pre-requisites

- have amd CPU or GPU. Containers using mesa for now.

#### Procedure:
```
docker compose run amd
```

### NVIDIA platforms

#### Pre-requisites

- have installed nvidia-docker, nvidia driver etc, so that the following works ok:
```
nvidia-docker run -t nvidia/cuda:8.0-cudnn5-devel nvidia-smi
```

#### Procedure

```
Run:
```
docker compose run nvidia-1404
```
Test a `cocl` compilation:
```
cd /tmp
mkdir foo
cd foo
cp /Coriander/test/cuda_sample.cu .
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
