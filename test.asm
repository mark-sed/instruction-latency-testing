global __main

__main: 
	times 10_000_000 test rax, -1
	mov eax, 1
	mov	ebx, 0
	int	0x80
