global __main
%include "conf.inc"

__main: 
    xor REG, REG
	times AMOUNT inc REG
	mov eax, 1
	mov	ebx, 0
	int	0x80
