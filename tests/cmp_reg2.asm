global __main
%include "conf.inc"

__main:
	xor REG2, REG2
	times AMOUNT cmp REG2, 0
	mov eax, 1
	mov	ebx, 0
	int	0x80
