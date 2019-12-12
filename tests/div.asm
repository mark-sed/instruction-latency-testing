global __main
%include "conf.inc"

__main: 
    mov rax, -1
    xor rdx, rdx 
    mov rcx, 8
	times AMOUNT div rcx
	mov eax, 1
	mov	ebx, 0
	int	0x80
