#ifndef _INTRUSIVE_LIST_DEBUG_H
#define _INTRUSIVE_LIST_DEBUG_H

// list debugging routines available only in non-freestanding environments
#if !defined(FREESTANDING) && defined(DEBUG_BUILD)
#include <stdio.h>
#define __debug(msg, ...) fprintf(stdout, "[debug] (%s:%d) " msg "\n", __FILE__, __LINE__, ##__VA_ARGS__)
#define __info(msg, ...) fprintf(stdout, "[info] (%s:%d) " msg, __FILE__, __LINE__, ##__VA_ARGS__)
#define __warn(msg, ...) fprintf(stderr, "[warn] (%s:%d) " msg "\n", __FILE__, __LINE__, ##__VA_ARGS__)
#else
#define __debug(msg, ...)
#define __info(msg, ...)
#define __warn(msg, ...)
#endif

#endif