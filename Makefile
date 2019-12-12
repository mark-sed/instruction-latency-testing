# Makefile for making all assembler sourcfiles
# @Author Marek Sedlacek

SRCS = $(wildcard tests/*.asm)

PROGS = $(patsubst %.asm,%,$(SRCS))

all: $(PROGS)

%: %.asm
	nasm -f elf64 -F dwarf -o $@.o $<
	ld -e __main -o $@.out $@.o
	rm $@.o
	
spec: 
	nasm -f elf64 -F dwarf -o $(name).o $(name).asm
	ld -e __main -o $(name).out $(name).o
	rm $(name).o
