global __main
%include "conf.inc"

__main:
	xor rax, rax 
	times AMOUNT cmp rax, 0
	mov eax, 1
	mov	ebx, 0
	int	0x80
