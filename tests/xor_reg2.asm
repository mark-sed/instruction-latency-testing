global __main
%include "conf.inc"

__main:
	times AMOUNT xor REG2, REG2
	mov eax, 1
	mov ebx, 0
	int	0x80
