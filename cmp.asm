global __main

__main: 
	times 10_000_000 cmp rax, 0
	mov eax, 1
	mov	ebx, 0
	int	0x80
