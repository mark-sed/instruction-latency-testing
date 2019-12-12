global __main
%include "conf.inc"

__main: 
    mov REG, -1
	times AMOUNT shr REG, 3
	mov eax, 1
	mov	ebx, 0
	int	0x80
