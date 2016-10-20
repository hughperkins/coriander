#pragma once

#ifdef COCL_SPAM
#define COCL_PRINT(stuff) \
   stuff;
#else
   #define COCL_PRINT(stuff)
#endif
