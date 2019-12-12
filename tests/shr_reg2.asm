global __main
%include "conf.inc"

__main: 
    mov REG2, -1
	times AMOUNT shr REG2, 3
	mov eax, 1
	mov	ebx, 0
	int	0x80
