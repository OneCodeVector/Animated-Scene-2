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
	
	.file	"main.c"
	.text
	.p2align 4,,15
	.globl	compar
	.type	compar, @function
compar:
.LFB42:
	.cfi_startproc
	movss	(%rdi), %xmm0
	movl	$1, %eax
	movss	(%rsi), %xmm1
	ucomiss	%xmm1, %xmm0
	ja	.L1
	xorl	%eax, %eax
	ucomiss	%xmm0, %xmm1
	seta	%al
	negl	%eax
.L1:
	rep ret
	.cfi_endproc
.LFE42:
	.size	compar, .-compar
	.p2align 4,,15
	.globl	u2f
	.type	u2f, @function
u2f:
.LFB23:
	.cfi_startproc
	movl	%edi, -4(%rsp)
	movss	-4(%rsp), %xmm0
	ret
	.cfi_endproc
.LFE23:
	.size	u2f, .-u2f
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Test Case 1:\n"
.LC4:
	.string	"The total before sorting: "
.LC5:
	.string	" The total after sorting: "
.LC6:
	.string	"\nTest Case 2:\n"
.LC8:
	.string	""
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB43:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC2(%rip), %rdi
	subq	$320, %rsp
	.cfi_def_cfa_offset 336
	leaq	16(%rsp), %rbx
	movq	%fs:40, %rax
	movq	%rax, 312(%rsp)
	xorl	%eax, %eax
	call	puts@PLT
	movss	.LC0(%rip), %xmm0
	leaq	4(%rbx), %rax
	movss	%xmm0, 16(%rsp)
	leaq	96(%rbx), %rdx
	movss	.LC3(%rip), %xmm1
	.p2align 4,,10
	.p2align 3
.L7:
	movss	%xmm1, (%rax)
	addq	$4, %rax
	addss	%xmm1, %xmm0
	cmpq	%rax, %rdx
	jne	.L7
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movss	%xmm0, 12(%rsp)
	call	__printf_chk@PLT
	movss	12(%rsp), %xmm0
	call	f_printbits@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	compar(%rip), %rcx
	movl	$4, %edx
	movq	%rbx, %rdi
	movl	$24, %esi
	call	qsort@PLT
	movq	%rbx, %rdi
	movl	$24, %esi
	leaq	112(%rsp), %rbx
	call	sum_float@PLT
	call	f_printbits@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rsi
	xorl	%ecx, %ecx
	movl	$2, %r9d
	pxor	%xmm0, %xmm0
	movl	$613566757, %edi
	movsd	.LC7(%rip), %xmm2
	movl	$-1431655765, %r8d
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L10:
	movl	%ecx, %eax
	xorl	%r9d, %r9d
	mull	%r8d
	shrl	%edx
	leal	(%rdx,%rdx,2), %eax
	cmpl	%eax, %ecx
	sete	%r9b
	addq	$4, %rsi
	addl	$1, %r9d
.L8:
	movl	%ecx, %eax
	pxor	%xmm1, %xmm1
	mull	%edi
	movl	%ecx, %eax
	subl	%edx, %eax
	shrl	%eax
	addl	%eax, %edx
	shrl	$2, %edx
	leal	0(,%rdx,8), %eax
	subl	%edx, %eax
	cmpl	%eax, %ecx
	sete	%al
	addl	$1, %ecx
	movzbl	%al, %eax
	addl	%r9d, %eax
	cmpl	$50, %ecx
	cvtsi2sd	%eax, %xmm1
	mulsd	%xmm2, %xmm1
	cvtsd2ss	%xmm1, %xmm1
	movss	%xmm1, (%rsi)
	addss	%xmm1, %xmm0
	jne	.L10
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movss	%xmm0, 12(%rsp)
	call	__printf_chk@PLT
	movss	12(%rsp), %xmm0
	call	f_printbits@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	compar(%rip), %rcx
	movl	$4, %edx
	movl	$50, %esi
	movq	%rbx, %rdi
	call	qsort@PLT
	movl	$50, %esi
	movq	%rbx, %rdi
	call	sum_float@PLT
	call	f_printbits@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movq	312(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L15
	addq	$320, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE43:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1342181375
	.align 4
.LC3:
	.long	1192165376
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC7:
	.long	2576980378
	.long	1069128089
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
	
    .globl matrix_prod
# rdi - *A, rsi - *B, rdx - *C, rcx - n
matrix_prod: # void matrix_prod(void *A, void *B, void *C, int n);
    xorq %r8, %r8 # r8 - i counter
    xorq %rax, %rax # rax - return
    push %rdi
    push %rsi
    push %rdx

oloop:
    cmpq %r8, %rcx # 0 to N-1
    jle end_oloop
    xorq %r9, %r9 # r9 - j counter

iloop:
    cmpq %r9, %rcx # 0 to N-1
    jle end_iloop

    push %rcx
    push %r8
    push %r9

    movq 40(%rsp), %rdi # *A -> 1st arg 
    movq 32(%rsp), %rsi # *B -> 2nd arg
    movq 16(%rsp), %rdx # n -> 3rd arg
    movq 8(%rsp), %rcx # i -> 4th arg
    movq (%rsp), %r8 # j -> 5th arg

    call dot_prod # long dot_prod(void *A, void *B, int n, int i, int j);

    movq %rax, %rdi # result -> 1st arg
    movq $17, %rsi # 17 -> 2nd arg

    call mod # unsigned char mod(long x, unsigned char m);

    pop %r9
    pop %r8

    movq %r8, %rdi # i -> rdi
    imulq (%rsp), %rdi # n * i -> rdi
    addq %r9, %rdi # (n*i) + j
    movq 8(%rsp), %rsi # *C -> rsi
    movq %rax, (%rsi, %rdi) # result -> C[?]

    pop %rcx
    incq %r9
    jmp iloop

end_iloop:
    incq %r8
    jmp oloop

end_oloop:
    pop %rdx
    pop %rsi
    pop %rdi
	ret


	.globl mod
mod:                     # unsigned char mod(long x, unsigned char m);
	movq %rdi, %rax
	movq %rdi, %rdx
	sarq $63, %rdx       # 128-bit signed dividend in rdx:rax

	movzbq %sil, %rsi    # 64-bit unsigned divisor in rsi

	idiv %rsi            # quotient in rax, remainder in rdx

	cmpq $0, %rdx
	jge endif
	addq %rsi, %rdx      # translate negative remainder to be unsigned
endif:
	movq %rdx, %rax

	ret

	.file	"main.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"The product of %u and %u is %u.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$2000, %esi
	movl	$30000, %edi
	call	times@PLT
	leaq	.LC0(%rip), %rsi
	movl	%eax, %r8d
	movl	$2000, %ecx
	movl	$30000, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
	
//edi = a, esi = b, eax = return
//if b is min, then swap a and b
//if a is odd, then shift b and return += b
//if a is even, then shift b
//end a = 0
	.globl times
times:
	cmpl %esi, %edi
	jle mulit
	movl %edi, %eax
	movl %esi, %edi
	movl %eax, %esi
	
mulit:
	movl $0, %eax

loop:	
	cmpq $0, %rdi
	je endloop
	test $1, %rdi 
	je aeven
	jmp aodd

aeven:
	shl %rsi
	shr %rdi
	jmp loop

aodd:
	add %rsi, %rax
	shl %rsi
	shr %rdi
	jmp loop

endloop:
	ret
	
# edi - x
	.globl sqrt
sqrt:
	movl $0, %eax # eax - result
	movl $1, %ecx # ecx - Bitmask
	shl $15, %ecx # 1000 0000 0000 0000
loop:
	cmpl $0, %ecx # Bitmask - 0
	je endl
	movl $0, %edx  # result^2
	xor %ecx, %eax  # eax is bitmasked 
	xor %eax, %edx # eax -> edx
	imul %rdx, %rdx
	cmp %rdi, %rdx  
	jle shift
	xor %ecx, %eax # kth bit change to 0
shift:
	shr %ecx # shift right
	jmp loop
endl:
	ret
