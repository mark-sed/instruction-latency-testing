global __main
%include "conf.inc"

__main: 
	xor REG, REG
	times AMOUNT test REG, -1
	mov eax, 1
	mov	ebx, 0
	int	0x80
