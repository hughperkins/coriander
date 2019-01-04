#pragma once

#include "cocl/cocl_dnn_core.h"
#include "cocl/cocl_dnn_pooling.h"
#include "cocl/cocl_dnn_act.h"
#include "cocl/cocl_dnn_conv.h"

typedef std::size_t cudnnStatus_t;
typedef cocl::dnn::Dnn *cudnnHandle_t;
typedef std::size_t cudnnDataType_t;
typedef std::size_t cudnnTensorFormat_t;
typedef std::size_t cudnnBatchNormMode_t;
typedef std::size_t cudnnConvolutionBwdDataPreference_t;
typedef std::size_t cudnnConvolutionBwdFilterPreference_t;
typedef int cudnnPointerMode_t;


#define CUDNN_MAJOR 7
#define CUDNN_MINOR 0
#define CUDNN_PATCHLEVEL 5

#define CUDNN_VERSION    (CUDNN_MAJOR * 1000 + CUDNN_MINOR * 100 + CUDNN_PATCHLEVEL)
#define PPU_VER   8000

/* RNN API */
typedef enum
  {
    CUDNN_RNN_RELU = 0, /* Stock RNN with ReLu activation */
    CUDNN_RNN_TANH = 1, /* Stock RNN with tanh activation */
    CUDNN_LSTM = 2,     /* LSTM with no peephole connections */
    CUDNN_GRU = 3       /* Using h' = tanh(r * Uh(t-1) + Wx) and h = (1 - z) * h' + z * h(
t-1); */
  } cudnnRNNMode_t;

typedef enum
  {
   CUDNN_UNIDIRECTIONAL = 0,
   CUDNN_BIDIRECTIONAL = 1      /* Using output concatination at each step. Do we also wan
t to support output sum? */
  } cudnnDirectionMode_t;

typedef enum
  {
   CUDNN_LINEAR_INPUT = 0,
   CUDNN_SKIP_INPUT = 1
  } cudnnRNNInputMode_t;

  typedef struct cudnnLRNStruct*            cudnnLRNDescriptor_t;
  typedef struct cudnnDropoutStruct *       cudnnDropoutDescriptor_t;
  struct cudnnRNNStruct;
  typedef struct cudnnRNNStruct*            cudnnRNNDescriptor_t;

  typedef enum
    {
      CUDNN_RNN_ALGO_STANDARD = 0,
      CUDNN_RNN_ALGO_PERSIST_STATIC = 1,
      CUDNN_RNN_ALGO_PERSIST_DYNAMIC = 2
    } cudnnRNNAlgo_t;

  #ifndef CUDNNWINAPI
  #ifdef _WIN32
  #define CUDNNWINAPI __stdcall
  #else
  #define CUDNNWINAPI
  #endif
  #endif

