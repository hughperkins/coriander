# Maintainer info

This is information for cuda-on-cl devs/maintainers.

## Super secret environment variables

These are here because they're not terribly useful, except to dev/maintainers, and would likely be confusing to boot.  Nevertheless they might be useful to cuda-on-cl devs/maintainers.

| Environment variable | Description |
|----------------------|-------------|
| COCL_DEVICES_ALL=1   | device index is across all devices, both OpenCL CPUs and OpenCL GPUS. Since cuda-on-cl likely won't run much/at-all on OpenCL CPUs, this option is pretty useless to end-users, however it might be useful eg for travis builds https://travis-ci.org/hughperkins/cuda-on-cl |
