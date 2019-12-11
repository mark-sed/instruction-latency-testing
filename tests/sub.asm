global __main

__main:
	xor rax, rax
	times 10_000_000 sub rax, 1
	mov eax, 1
	mov	ebx, 0
	int	0x80
