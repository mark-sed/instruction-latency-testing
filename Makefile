# Makefile for making all assembler sourcfiles
# @Author Marek Sedlacek

SRCS = $(wildcard tests/*.asm)

PROGS = $(patsubst %.asm,%,$(SRCS))

all: $(PROGS)

%: %.asm
	nasm -g -f elf64 -F dwarf -o $@.o $<
	ld -e __main -o $@.out $@.o
	rm $@.o
