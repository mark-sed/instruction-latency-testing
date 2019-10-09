global __main

__main: 
	times 10_000_000 inc rax
	mov eax, 1
	mov	ebx, 0
	int	0x80
