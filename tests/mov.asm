global __main
%include "conf.inc"

__main:
	times AMOUNT mov REG, 0
	mov eax, 1
	mov ebx, 0
	int	0x80
