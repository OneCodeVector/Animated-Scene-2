	# rdi - A, rsi - B, edx - n, ecx - i, r8d - j
	.globl dot_prod
dot_prod:
	xorl %eax, %eax # eax - return
	movq $0, %r9  # r9 - counter
	movq %rcx, %r10 # r10 - A position
	imulq %rdx, %r10
	movq %r8, %r11 # r11 - B position
	push %rbx # rbx - A*B values

loop:
	cmpq %r9, %rdx # n - counter 
	jle endl
	movq (%r10, %rdi), %rbx # A pos
	imulq (%r11, %rsi), %rbx # A pos * B pos
	addq %rbx, %rax
	addq %rdx, %r11 # move B pos by n
	incq %r10 # move A pos by 1
	incq %r9
	jmp loop

endl:
	pop %rbx
	ret
