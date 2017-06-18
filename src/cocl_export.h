#pragma once

#if defined(_WIN32) 
# if defined(cocl_EXPORTS)
#  define cocl_EXPORT __declspec(dllexport)
# else
#  define cocl_EXPORT __declspec(dllimport)
# endif 
#else 
# define cocl_EXPORT
#endif
