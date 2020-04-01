# Readme - Collections
This is a collection of... collections. This project contains implementations of a few
common data collections for use in my operating system project. The implementation
of these collections is not optimized, and is likely incomplete in multiple areas.

This project can be built either as a freestanding library (see below for freestanding requirements),
or as a hosted library. Invoking `make` in the project root directory will build the hosted
library and the library demo code. `make library-freestanding` will create the freestanding library.
You can override the make variable CC to set the target compiler (see Customizing the Build for details)

## Freestanding library - minimum platform requirements
The freestanding implementation of this library requires a few basic standards-compliant functions from
the C runtime library to be present:

### <stdlib.h>
* malloc
* realloc
* free

### <string.h>
* strlen
* strncpy
* strncmp
* memset

## Hosted library - additional requirements
The hosted library can be built with the same minimum requirements as the freestanding
library; however, there is an additional compilation option for the hosted library.
If -DDEBUG_BUILD is included in the CFLAGS, debugging data will be printed from the
library at runtime. This feature requires access to a working fprintf function and
valid stdout, stderr devices present in the executable.