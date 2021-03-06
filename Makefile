# Utilities
INSTALL = install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644

# Flags
CFLAGS = -O2 -c -Wall -fpic
LDFLAGS = -shared

# Directories
LUA_INC_DIR=/usr/include/lua5.1
LUA_LIB_DIR=/usr/lib

INSTALL_DIR_LUA=/usr/share/lua/5.1
INSTALL_DIR_BIN=/usr/lib/lua/5.1

# Files
LUA_LIB = lua5.1
LIB = core.so

all:
	$(CC) $(CFLAGS) -Iinclude -I$(LUA_INC_DIR) src/*.c
	$(CC) $(LDFLAGS) -o $(LIB) *.o -L$(LUA_LIB_DIR) -l$(LUA_LIB) -levent

install: all
	mkdir -p $(DESTDIR)$(INSTALL_DIR_LUA)
	$(INSTALL_DATA) lua/luaevent.lua $(DESTDIR)$(INSTALL_DIR_LUA)/luaevent.lua
	mkdir -p $(DESTDIR)$(INSTALL_DIR_BIN)/luaevent/
	$(INSTALL_PROGRAM) $(LIB) $(DESTDIR)$(INSTALL_DIR_BIN)/luaevent/$(LIB)

clean:
	rm *.so
	rm *.o

