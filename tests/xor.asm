global __main
%include "conf.inc"

__main:
	times AMOUNT xor REG, REG
	mov eax, 1
	mov ebx, 0
	int	0x80
