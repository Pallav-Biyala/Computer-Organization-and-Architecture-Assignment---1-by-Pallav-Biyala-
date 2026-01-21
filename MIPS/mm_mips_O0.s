	.file	1 "Matrix_multiplication.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.module	arch=mips32r2
	.abicalls
	.text
	.align	2
	.globl	create_matrix
	.set	nomips16
	.set	nomicromips
	.ent	create_matrix
	.type	create_matrix, @function
create_matrix:
	.frame	$fp,48,$31		# vars= 8, regs= 3/0, args= 16, gp= 8
	.mask	0xc0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	sw	$16,36($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	sw	$4,48($fp)
	lw	$2,48($fp)
	sll	$2,$2,2
	move	$4,$2
	lw	$2,%call16(malloc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	sw	$0,24($fp)
	.option	pic0
	b	$L2
	nop

	.option	pic2
$L3:
	lw	$2,48($fp)
	sll	$4,$2,2
	lw	$2,24($fp)
	sll	$2,$2,2
	lw	$3,28($fp)
	addu	$16,$3,$2
	lw	$2,%call16(malloc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,0($16)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L2:
	lw	$3,24($fp)
	lw	$2,48($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L3
	nop

	lw	$2,28($fp)
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	lw	$16,36($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	create_matrix
	.size	create_matrix, .-create_matrix
	.align	2
	.globl	free_memory
	.set	nomips16
	.set	nomicromips
	.ent	free_memory
	.type	free_memory, @function
free_memory:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	sw	$4,40($fp)
	sw	$5,44($fp)
	sw	$0,28($fp)
	.option	pic0
	b	$L6
	nop

	.option	pic2
$L7:
	lw	$2,28($fp)
	sll	$2,$2,2
	lw	$3,40($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$4,$2
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L6:
	lw	$3,28($fp)
	lw	$2,44($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L7
	nop

	lw	$4,40($fp)
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	nop
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	free_memory
	.size	free_memory, .-free_memory
	.globl	__floatdidf
	.rdata
	.align	2
$LC1:
	.ascii	"Matrix Multiplication of two N*N matrix took %.6f second"
	.ascii	"s where N = %d\012\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,136,$31		# vars= 96, regs= 2/0, args= 24, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-136
	sw	$31,132($sp)
	sw	$fp,128($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	24
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)
	sw	$2,124($fp)
	li	$2,1024			# 0x400
	sw	$2,64($fp)
	lw	$4,64($fp)
	.option	pic0
	jal	create_matrix
	nop

	.option	pic2
	lw	$28,24($fp)
	sw	$2,68($fp)
	sw	$0,36($fp)
	.option	pic0
	b	$L9
	nop

	.option	pic2
$L12:
	sw	$0,40($fp)
	.option	pic0
	b	$L10
	nop

	.option	pic2
$L11:
	lw	$2,36($fp)
	sll	$4,$2,1
	lw	$2,36($fp)
	sll	$2,$2,2
	lw	$3,68($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,40($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,40($fp)
	addu	$3,$4,$3
	sw	$3,0($2)
	lw	$2,40($fp)
	addiu	$2,$2,1
	sw	$2,40($fp)
$L10:
	lw	$3,40($fp)
	lw	$2,64($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L11
	nop

	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,36($fp)
$L9:
	lw	$3,36($fp)
	lw	$2,64($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L12
	nop

	lw	$4,64($fp)
	.option	pic0
	jal	create_matrix
	nop

	.option	pic2
	lw	$28,24($fp)
	sw	$2,72($fp)
	sw	$0,44($fp)
	.option	pic0
	b	$L13
	nop

	.option	pic2
$L16:
	sw	$0,48($fp)
	.option	pic0
	b	$L14
	nop

	.option	pic2
$L15:
	lw	$3,48($fp)
	move	$2,$3
	sll	$2,$2,1
	addu	$3,$2,$3
	lw	$2,44($fp)
	sll	$2,$2,1
	subu	$3,$3,$2
	lw	$2,44($fp)
	sll	$2,$2,2
	lw	$4,72($fp)
	addu	$2,$4,$2
	lw	$4,0($2)
	lw	$2,48($fp)
	sll	$2,$2,2
	addu	$2,$4,$2
	addiu	$3,$3,5
	sw	$3,0($2)
	lw	$2,48($fp)
	addiu	$2,$2,1
	sw	$2,48($fp)
$L14:
	lw	$3,48($fp)
	lw	$2,64($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L15
	nop

	lw	$2,44($fp)
	addiu	$2,$2,1
	sw	$2,44($fp)
$L13:
	lw	$3,44($fp)
	lw	$2,64($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L16
	nop

	lw	$4,64($fp)
	.option	pic0
	jal	create_matrix
	nop

	.option	pic2
	lw	$28,24($fp)
	sw	$2,76($fp)
	addiu	$2,$fp,88
	move	$5,$2
	move	$4,$0
	lw	$2,%call16(__clock_gettime64)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__clock_gettime64
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sw	$0,52($fp)
	.option	pic0
	b	$L17
	nop

	.option	pic2
$L22:
	sw	$0,56($fp)
	.option	pic0
	b	$L18
	nop

	.option	pic2
$L21:
	lw	$2,52($fp)
	sll	$2,$2,2
	lw	$3,76($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,56($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	sw	$0,0($2)
	sw	$0,60($fp)
	.option	pic0
	b	$L19
	nop

	.option	pic2
$L20:
	lw	$2,52($fp)
	sll	$2,$2,2
	lw	$3,76($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,56($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$4,0($2)
	lw	$2,52($fp)
	sll	$2,$2,2
	lw	$3,68($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,60($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,60($fp)
	sll	$2,$2,2
	lw	$5,72($fp)
	addu	$2,$5,$2
	lw	$5,0($2)
	lw	$2,56($fp)
	sll	$2,$2,2
	addu	$2,$5,$2
	lw	$2,0($2)
	mul	$3,$3,$2
	lw	$2,52($fp)
	sll	$2,$2,2
	lw	$5,76($fp)
	addu	$2,$5,$2
	lw	$5,0($2)
	lw	$2,56($fp)
	sll	$2,$2,2
	addu	$2,$5,$2
	addu	$3,$4,$3
	sw	$3,0($2)
	lw	$2,60($fp)
	addiu	$2,$2,1
	sw	$2,60($fp)
$L19:
	lw	$3,60($fp)
	lw	$2,64($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L20
	nop

	lw	$2,56($fp)
	addiu	$2,$2,1
	sw	$2,56($fp)
$L18:
	lw	$3,56($fp)
	lw	$2,64($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L21
	nop

	lw	$2,52($fp)
	addiu	$2,$2,1
	sw	$2,52($fp)
$L17:
	lw	$3,52($fp)
	lw	$2,64($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L22
	nop

	addiu	$2,$fp,104
	move	$5,$2
	move	$4,$0
	lw	$2,%call16(__clock_gettime64)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__clock_gettime64
1:	jalr	$25
	nop

	lw	$28,24($fp)
	lw	$5,108($fp)
	lw	$4,104($fp)
	lw	$7,92($fp)
	lw	$6,88($fp)
	subu	$3,$5,$7
	sltu	$8,$5,$3
	subu	$2,$4,$6
	subu	$4,$2,$8
	move	$2,$4
	move	$5,$3
	move	$4,$2
	lw	$2,%call16(__floatdidf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__floatdidf
1:	jalr	$25
	nop

	lw	$28,24($fp)
	mov.d	$f4,$f0
	lw	$3,116($fp)
	lw	$2,100($fp)
	subu	$2,$3,$2
	mtc1	$2,$f0
	cvt.d.w	$f2,$f0
	lui	$2,%hi($LC0)
	ldc1	$f0,%lo($LC0)($2)
	div.d	$f0,$f2,$f0
	add.d	$f0,$f4,$f0
	sdc1	$f0,80($fp)
	lw	$2,64($fp)
	sw	$2,16($sp)
	lw	$7,84($fp)
	lw	$6,80($fp)
	lui	$2,%hi($LC1)
	addiu	$4,$2,%lo($LC1)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,24($fp)
	lw	$5,64($fp)
	lw	$4,68($fp)
	.option	pic0
	jal	free_memory
	nop

	.option	pic2
	lw	$28,24($fp)
	lw	$5,64($fp)
	lw	$4,72($fp)
	.option	pic0
	jal	free_memory
	nop

	.option	pic2
	lw	$28,24($fp)
	lw	$5,64($fp)
	lw	$4,76($fp)
	.option	pic0
	jal	free_memory
	nop

	.option	pic2
	lw	$28,24($fp)
	move	$2,$0
	move	$4,$2
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$3,124($fp)
	lw	$2,0($2)
	beq	$3,$2,$L24
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L24:
	move	$2,$4
	move	$sp,$fp
	lw	$31,132($sp)
	lw	$fp,128($sp)
	addiu	$sp,$sp,136
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.rdata
	.align	3
$LC0:
	.word	1104006501
	.word	0
	.ident	"GCC: (Ubuntu 12.4.0-2ubuntu1~24.04) 12.4.0"
	.section	.note.GNU-stack,"",@progbits
