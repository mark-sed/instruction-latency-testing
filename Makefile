define compile_asm64
	nasm -g -f elf64 -F dwarf -o $(1).o $(1).asm
	ld -e __main -o $(1) $(1).o
	rm $(1).o
endef

all_files=add inc test cmp

.PHONY: $(all_files)

ndef:
	$(info "Call with instruction name")

all: add inc test cmp

add:
	$(call compile_asm64, add)
	
inc:
	$(call compile_asm64, inc)

test:
	$(call compile_asm64, test)
	
cmp:
	$(call compile_asm64, cmp)
	
clean:
	for i in $(all_files) ; do \
		rm $$i; \
	done

