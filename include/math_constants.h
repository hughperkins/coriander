#pragma once

#include <limits>

#define CUDART_MAX_NORMAL_F std::numeric_limits<float>::max()
#define CUDART_INF_F std::numeric_limits<float>::infinity()
#define CUDART_NAN_F std::numeric_limits<float>::quiet_NaN()

#define CUDART_MAX_NORMAL std::numeric_limits<double>::max()
#define CUDART_INF std::numeric_limits<double>::infinity()
#define CUDART_NAN std::numeric_limits<double>::quiet_NaN()

using std::isfinite;
using std::isnan;
using std::isinf;
