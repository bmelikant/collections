#ifndef _INTRUSIVE_LIST_LIBRARY_LIST_H
#define _INTRUSIVE_LIST_LIBRARY_LIST_H

/**
 * This intrusive list implementation can be compiled for a freestanding environment
 * the resulting archive file can be linked into an existing OS project as long as the
 * following requirements are met:
 * 
 * - A working malloc() implementation must be present (to include free() and realloc())
 * - string.h string operations are expected (strncmp, memcmp, memcpy, strlen, etc)
 */

#include <stdlib.h>
#include <string.h>

#define offsetof(type,element)	((size_t)&(((type *)0)->element))

typedef struct LIST_HEADER _list_header_t;
struct LIST_HEADER {
	_list_header_t *next;
	_list_header_t *prev;
};

#endif