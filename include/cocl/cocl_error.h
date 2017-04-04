#pragma once

#include <cstddef>

extern "C" {
    const char *cudaGetErrorString (size_t error);
    size_t cudaGetLastError();
    void checkCudaErrors(size_t errorcode);
}

// #define cudaErrorNotReady 2222

#define CUDA_SUCCESS 0  // this should probably be zero, by convention

// the actual numbers for the others dont really matter, as long as we build all source code with same values
// we start from 10000 so the numbers probably dont clash with the original NVIDIA numbers, so if someone accidentally
// tries to link against code that uses the original numbers, it'll probalby go wrong more obviously than if the
// the numbers are same but different...
// (Note that there's no obvoius way to get the original numbers, without looking at the original toolkit files.
// Whereas the names of the symbols are scattered liberally throughout the code of the projects we
// are trying to build)
enum cudaerrors {
    CUDA_ERROR_INVALID_IMAGE = 10000,
    CUDA_ERROR_INVALID_DEVICE,
    CUDA_ERROR_INVALID_CONTEXT,
    CUDA_ERROR_INVALID_HANDLE,
    CUDA_ERROR_NOT_FOUND,
    CUDA_ERROR_NOT_READY,
    CUDA_ERROR_NOT_PERMITTED,
    CUDA_ERROR_NOT_SUPPORTED,
    CUDA_ERROR_NOT_INITIALIZED,
    CUDA_ERROR_DEINITIALIZED,
    CUDA_ERROR_OUT_OF_MEMORY,
    CUDA_ERROR_PEER_ACCESS_UNSUPPORTED,
    CUDA_ERROR_PEER_ACCESS_ALREADY_ENABLED,
    CUDA_ERROR_ECC_UNCORRECTABLE,
    CUDA_ERROR_NO_BINARY_FOR_GPU,
    CUDA_ERROR_CONTEXT_ALREADY_IN_USE,
    CUDA_ERROR_UNKNOWN,
    CUDA_ERROR_INVALID_VALUE,
    CUDA_ERROR_NO_DEVICE,

    cudaErrorInvalidTextureBinding,
    cudaErrorInvalidTexture,
    cudaErrorInvalidDevicePointer,
    cudaErrorInvalidHostPointer,
    cudaErrorUnmapBufferObjectFailed,
    cudaErrorMapBufferObjectFailed,
    cudaErrorInvalidSymbol,
    cudaErrorInvalidPitchValue,
    cudaErrorInvalidValue,
    cudaErrorInvalidDevice,
    cudaErrorInvalidConfiguration,
    cudaErrorInvalidDeviceFunction,
    cudaErrorLaunchOutOfResources,
    cudaErrorLaunchTimeout,
    cudaErrorPriorLaunchFailure,
    cudaErrorLaunchFailure,
    cudaErrorInitializationError,
    cudaErrorMemoryAllocation,
    cudaErrorMissingConfiguration,
    cudaErrorStartupFailure,
    cudaErrorECCUncorrectable,
    cudaErrorNoDevice,
    cudaErrorSetOnActiveProcess,
    cudaErrorInsufficientDriver,
    cudaErrorInvalidResourceHandle,
    cudaErrorMemoryValueTooLarge,
    cudaErrorNotYetImplemented,
    cudaErrorUnknown,
    cudaErrorCudartUnloading,
    cudaErrorInvalidFilterSetting,
    cudaErrorMixedDeviceExecution,
    cudaErrorInvalidNormSetting,
    cudaErrorSynchronizationError,
    cudaErrorTextureNotBound,
    cudaErrorTextureFetchFailed,
    cudaErrorAddressOfConstant,
    cudaErrorInvalidMemcpyDirection,
    cudaErrorInvalidChannelDescriptor,
    cudaErrorApiFailureBase  // not sure what this is, but it's used in a comparison, in thrust: if(ev < ::cudaErrorApiFailureBase)  <= might need special handling somehow
};

#define cudaErrorNotReady CUDA_ERROR_NOT_READY
