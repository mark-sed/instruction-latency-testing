global __main
%include "conf.inc"

__main:
    xor REG, REG
	times AMOUNT add REG2, 1
	mov eax, 1
	mov	ebx, 0
	int	0x80
