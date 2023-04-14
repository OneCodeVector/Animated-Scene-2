	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%4d"
	.text
	.p2align 4,,15
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB24:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movslq	%esi, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	.LC0(%rip), %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %r12
	movl	$4, %r14d
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
.L2:
	leaq	4(%r12), %rbp
	movq	%r12, %rbx
.L3:
	movsbl	(%rbx), %edx
	xorl	%eax, %eax
	movq	%r13, %rsi
	movl	$1, %edi
	addq	$1, %rbx
	call	__printf_chk@PLT
	cmpq	%rbp, %rbx
	jne	.L3
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	addq	%r15, %r12
	call	_IO_putc@PLT
	subl	$1, %r14d
	jne	.L2
	movq	stdout(%rip), %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	movl	$10, %edi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_IO_putc@PLT
	.cfi_endproc
.LFE24:
	.size	print_matrix, .-print_matrix
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	C(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	B(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
.L9:
	xorl	%ebx, %ebx
.L10:
	leaq	A(%rip), %rdi
	movl	%ebx, %r8d
	movl	$4, %edx
	movl	%ebp, %ecx
	movq	%r13, %rsi
	call	dot_prod@PLT
	leaq	(%r14,%rbx), %rdx
	addq	$1, %rbx
	cmpq	$4, %rbx
	movb	%al, (%rdx,%r12)
	jne	.L10
	addl	$1, %ebp
	addq	$4, %r12
	cmpl	$4, %ebp
	jne	.L9
	leaq	A(%rip), %rdi
	movl	$4, %esi
	call	print_matrix
	leaq	B(%rip), %rdi
	movl	$4, %esi
	call	print_matrix
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	leaq	C(%rip), %rdi
	movl	$4, %esi
	jmp	print_matrix
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.comm	C,16,16
	.globl	B
	.data
	.align 16
	.type	B, @object
	.size	B, 16
B:
	.byte	2
	.byte	-1
	.byte	2
	.byte	-2
	.byte	2
	.byte	-5
	.byte	-4
	.byte	2
	.byte	-1
	.byte	-1
	.byte	5
	.byte	0
	.byte	-1
	.byte	2
	.byte	-2
	.byte	-1
	.globl	A
	.align 16
	.type	A, @object
	.size	A, 16
A:
	.byte	3
	.byte	0
	.byte	1
	.byte	4
	.byte	-5
	.byte	1
	.byte	-1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	-2
	.byte	0
	.byte	7
	.byte	3
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
