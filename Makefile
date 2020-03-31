
CFLAGS?=-O2 -g
CPPFLAGS?=
LDFLAGS?=
LIBS?=

LIB_DESTDIR?=./lib
LIB_DESTFILE?=liblist.a
LIBFREE_DESTFILE?=liblistf.a

LIB_DESTINATION?=$(LIB_DESTDIR)/$(LIB_DESTFILE)
LIBFREE_DESTINATION?=$(LIB_DESTDIR)/$(LIBFREE_DESTFILE)

CFLAGS:=$(CFLAGS) -Iinclude

# target-specific variables
list-demo: LDFLAGS:=$(LDFLAGS) -L$(LIB_DESTDIR) -llist
library-freestanding: CFLAGS:=$(CFLAGS) -ffreestanding -Wall -Wextra -DFREESTANDING

DEMO_OBJS=\
	src/demo/demo.o \

LIBRARY_OBJS=\
	src/list/list.o \

LIBRARY_FREE_OBJS=$(LIBRARY_OBJS:.o=.free.o)

.PHONY: all list-demo library library-freestanding clean
.SUFFIXES: .c .o .free.o

all: list-demo
clean: clean-demo clean-library

list-demo: library $(DEMO_OBJS)
	$(CC) -o $@ $(DEMO_OBJS) $(LDFLAGS)

library: $(LIB_DESTINATION)
library-freestanding: $(LIBFREE_DESTINATION)

clean-demo:
	rm -f list-demo
	rm -f $(DEMO_OBJS)

clean-library:
	rm -f $(LIBRARY_OBJS)
	rm -f $(LIBRARY_FREE_OBJS)
	rm -rf $(LIB_DESTDIR)

$(LIB_DESTINATION): $(LIBRARY_OBJS)
	$(shell mkdir -p $(LIB_DESTDIR))
	$(AR) rcs $@ $(LIBRARY_OBJS)

$(LIBFREE_DESTINATION): $(LIBRARY_FREE_OBJS)
	$(shell mkdir -p $(LIB_DESTDIR))
	$(AR) rcs $@ $(LIBRARY_FREE_OBJS)

%.o: %.c
	$(CC) -c $< -o $@ -std=gnu11 $(CFLAGS) $(CPPFLAGS)

%.free.o: %.c
	$(CC) -c $< -o $@ -std=gnu11 $(CFLAGS) $(CPPFLAGS)