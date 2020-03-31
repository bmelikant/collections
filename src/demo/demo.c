// standard headers
#include <stdio.h>

// project headers
#include <list.h>

typedef struct TEST {
	int a;
	_list_header_t node;
} _test_t;

int main(int argc, char *argv[]) {
	printf("offset of node: %li\n", offsetof(_test_t, node));
}