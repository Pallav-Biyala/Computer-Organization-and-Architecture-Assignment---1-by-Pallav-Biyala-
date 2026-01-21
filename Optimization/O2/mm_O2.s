	.file	"Matrix_multiplication.c"
	.text
	.p2align 4
	.globl	create_matrix
	.type	create_matrix, @function
create_matrix:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movslq	%edi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	0(,%r12,8), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rbp, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	malloc@PLT
	movq	%rax, %r13
	testl	%r12d, %r12d
	jle	.L1
	salq	$2, %r12
	movq	%rax, %rbx
	addq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%r12, %rdi
	addq	$8, %rbx
	call	malloc@PLT
	movq	%rax, -8(%rbx)
	cmpq	%rbp, %rbx
	jne	.L3
.L1:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	movq	%r13, %rax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	create_matrix, .-create_matrix
	.p2align 4
	.globl	free_memory
	.type	free_memory, @function
free_memory:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	testl	%esi, %esi
	jle	.L8
	movslq	%esi, %rsi
	movq	%rdi, %rbx
	leaq	(%rdi,%rsi,8), %rbp
	.p2align 4,,10
	.p2align 3
.L9:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%rbp, %rbx
	jne	.L9
.L8:
	popq	%rbx
	.cfi_def_cfa_offset 24
	movq	%r12, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.cfi_endproc
.LFE40:
	.size	free_memory, .-free_memory
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"Matrix Multiplication of two N*N matrix took %.6f seconds where N = %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$1024, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	call	create_matrix
	movdqa	.LC1(%rip), %xmm3
	movdqa	.LC0(%rip), %xmm6
	xorl	%edx, %edx
	movq	%rax, %rbx
.L13:
	leal	(%rdx,%rdx), %eax
	movdqa	%xmm6, %xmm1
	movd	%eax, %xmm2
	movq	(%rbx,%rdx,8), %rax
	pshufd	$0, %xmm2, %xmm2
	leaq	4096(%rax), %rcx
.L14:
	movdqa	%xmm1, %xmm0
	addq	$16, %rax
	paddd	%xmm3, %xmm1
	paddd	%xmm2, %xmm0
	movups	%xmm0, -16(%rax)
	cmpq	%rcx, %rax
	jne	.L14
	addq	$1, %rdx
	cmpq	$1024, %rdx
	jne	.L13
	movl	$1024, %edi
	call	create_matrix
	movdqa	.LC2(%rip), %xmm5
	movdqa	.LC0(%rip), %xmm6
	xorl	%edx, %edx
	movdqa	.LC1(%rip), %xmm3
	movq	%rax, %r12
.L16:
	leal	(%rdx,%rdx), %eax
	movdqa	%xmm6, %xmm1
	movd	%eax, %xmm4
	movq	(%r12,%rdx,8), %rax
	pshufd	$0, %xmm4, %xmm4
	leaq	4096(%rax), %rcx
.L17:
	movdqa	%xmm1, %xmm2
	addq	$16, %rax
	paddd	%xmm3, %xmm1
	movdqa	%xmm2, %xmm0
	pslld	$1, %xmm0
	paddd	%xmm2, %xmm0
	psubd	%xmm4, %xmm0
	paddd	%xmm5, %xmm0
	movups	%xmm0, -16(%rax)
	cmpq	%rcx, %rax
	jne	.L17
	addq	$1, %rdx
	cmpq	$1024, %rdx
	jne	.L16
	movl	$1024, %edi
	call	create_matrix
	movq	%rsp, %rsi
	xorl	%edi, %edi
	movq	%rax, %rbp
	call	clock_gettime@PLT
	xorl	%r9d, %r9d
.L19:
	movq	(%rbx,%r9), %r8
	movq	0(%rbp,%r9), %rdi
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L21:
	movl	$0, (%rdi)
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L20:
	movq	(%r12,%rax,8), %rdx
	movl	(%rdx,%rsi), %edx
	imull	(%r8,%rax,4), %edx
	addq	$1, %rax
	addl	%edx, %ecx
	movl	%ecx, (%rdi)
	cmpq	$1024, %rax
	jne	.L20
	addq	$4, %rsi
	addq	$4, %rdi
	cmpq	$4096, %rsi
	jne	.L21
	addq	$8, %r9
	cmpq	$8192, %r9
	jne	.L19
	xorl	%edi, %edi
	leaq	16(%rsp), %rsi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	pxor	%xmm0, %xmm0
	subq	8(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	pxor	%xmm1, %xmm1
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC3(%rip), %xmm0
	movl	$1024, %edx
	leaq	.LC4(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	movl	$1024, %esi
	movq	%rbx, %rdi
	call	free_memory
	movl	$1024, %esi
	movq	%r12, %rdi
	call	free_memory
	movl	$1024, %esi
	movq	%rbp, %rdi
	call	free_memory
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L29
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L29:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC1:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC2:
	.long	5
	.long	5
	.long	5
	.long	5
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
