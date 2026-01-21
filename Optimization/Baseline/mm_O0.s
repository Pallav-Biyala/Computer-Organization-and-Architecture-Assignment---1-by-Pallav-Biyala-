	.file	"Matrix_multiplication.c"
	.text
	.globl	create_matrix
	.type	create_matrix, @function
create_matrix:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movl	-36(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L2
.L3:
	movl	-36(%rbp), %eax
	cltq
	salq	$2, %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-24(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, (%rbx)
	addl	$1, -28(%rbp)
.L2:
	movl	-28(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L3
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	create_matrix, .-create_matrix
	.globl	free_memory
	.type	free_memory, @function
free_memory:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L6
.L7:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -4(%rbp)
.L6:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L7
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	free_memory, .-free_memory
	.section	.rodata
	.align 8
.LC1:
	.string	"Matrix Multiplication of two N*N matrix took %.6f seconds where N = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$1024, -84(%rbp)
	movl	-84(%rbp), %eax
	movl	%eax, %edi
	call	create_matrix
	movq	%rax, -80(%rbp)
	movl	$0, -112(%rbp)
	jmp	.L9
.L12:
	movl	$0, -108(%rbp)
	jmp	.L10
.L11:
	movl	-112(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	-112(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-108(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	-108(%rbp), %edx
	addl	%ecx, %edx
	movl	%edx, (%rax)
	addl	$1, -108(%rbp)
.L10:
	movl	-108(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L11
	addl	$1, -112(%rbp)
.L9:
	movl	-112(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L12
	movl	-84(%rbp), %eax
	movl	%eax, %edi
	call	create_matrix
	movq	%rax, -72(%rbp)
	movl	$0, -104(%rbp)
	jmp	.L13
.L16:
	movl	$0, -100(%rbp)
	jmp	.L14
.L15:
	movl	-100(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%eax, %edx
	movl	-104(%rbp), %eax
	addl	%eax, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	-104(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-100(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	leal	5(%rcx), %edx
	movl	%edx, (%rax)
	addl	$1, -100(%rbp)
.L14:
	movl	-100(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L15
	addl	$1, -104(%rbp)
.L13:
	movl	-104(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L16
	movl	-84(%rbp), %eax
	movl	%eax, %edi
	call	create_matrix
	movq	%rax, -64(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -96(%rbp)
	jmp	.L17
.L22:
	movl	$0, -92(%rbp)
	jmp	.L18
.L21:
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-92(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	$0, (%rax)
	movl	$0, -88(%rbp)
	jmp	.L19
.L20:
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-92(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %ecx
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rsi
	movq	-72(%rbp), %rax
	addq	%rsi, %rax
	movq	(%rax), %rax
	movl	-92(%rbp), %esi
	movslq	%esi, %rsi
	salq	$2, %rsi
	addq	%rsi, %rax
	movl	(%rax), %eax
	imull	%eax, %edx
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rsi
	movq	-64(%rbp), %rax
	addq	%rsi, %rax
	movq	(%rax), %rax
	movl	-92(%rbp), %esi
	movslq	%esi, %rsi
	salq	$2, %rsi
	addq	%rsi, %rax
	addl	%ecx, %edx
	movl	%edx, (%rax)
	addl	$1, -88(%rbp)
.L19:
	movl	-88(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L20
	addl	$1, -92(%rbp)
.L18:
	movl	-92(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L21
	addl	$1, -96(%rbp)
.L17:
	movl	-96(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L22
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	subq	%rax, %rdx
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm1
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	subq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	movsd	.LC0(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movl	-84(%rbp), %edx
	movq	-56(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %xmm0
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	-84(%rbp), %edx
	movq	-80(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	free_memory
	movl	-84(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	free_memory
	movl	-84(%rbp), %edx
	movq	-64(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	free_memory
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
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
