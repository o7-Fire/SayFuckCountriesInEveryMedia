# This Makefile assumes the top folder has been built
TOP = ..
CC ?= gcc

COGUTILS_DIR  := $(TOP)/cog-utils
CORE_DIR      := $(TOP)/core
INCLUDE_DIR   := $(TOP)/include
GENCODECS_DIR := $(TOP)/gencodecs

BOTS := bot \
        $(XSRC)

CFLAGS  = -I$(INCLUDE_DIR) -I$(COGUTILS_DIR) -I$(CORE_DIR) \
          -I$(CORE_DIR)/third-party -I$(GENCODECS_DIR)     \
          -O0 -g -pthread -Wall $(XFLAGS)
LDFLAGS = -ldiscord -L$(TOP)/lib -lcurl

all: $(BOTS)

voice:
	$(MAKE) XFLAGS=-DCCORD_VOICE XSRC=voice all

.SUFFIXES:
.DEFAULT:
	$(CC) $(CFLAGS) -o $@ $@.c $(LDFLAGS)

echo:
	@ echo -e 'CC: $(CC)\n'
	@ echo -e 'BOTS: $(BOTS)\n'

clean:
	@ $(RM) $(BOTS) voice

.PHONY: all echo clean
