#pragma once

#ifdef COCL_SPAM
#define COCL_PRINT(expr) \
   expr
#else
   #define COCL_PRINT(expr)
#endif
