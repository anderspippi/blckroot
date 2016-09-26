# Installation directories following GNU conventions
prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
sbindir = $(exec_prefix)/sbin
datarootdir = $(prefix)/share
datadir = $(datarootdir)
includedir = $(prefix)/include
mandir = $(datarootdir)/man

BIN=bin
OBJ=obj
SRC=src

OBJ_MODS=obj/modules
SRC_MODS=src/modules

CC = gcc
CFLAGS = -Wextra -Wall

.PHONY: all install uninstall clean

EXES = mirrorcrypt

all: $(EXES)

mirrorcrypt: $(OBJ_MODS)/mirrorfile.o $(OBJ)/main.o | $(BIN)
	$(CC) $(CFLAGS) -o $(BIN)/$@ $^

$(OBJ)/%.o: $(SRC)/%.c | $(OBJ)
	$(CC) $(CFLAGS) -o $@ -c $<
	
$(OBJ_MODS)/%.o: $(SRC_MODS)/%.c | $(OBJ_MODS)
	$(CC) $(CFLAGS) -o $@ -c $<

$(OBJ_MODS): $(OBJ)
	mkdir -p $(OBJ_MODS)
	
$(OBJ_EX): $(OBJ)
	mkdir -p $(OBJ_EX)

$(BIN):
	mkdir -p $(BIN)

$(OBJ):
	mkdir -p $(OBJ)

clean:
	rm -rf $(BIN)
	rm -rf $(OBJ)
