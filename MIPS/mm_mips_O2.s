	.file	1 "Matrix_Multiplication.c"
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
	.frame	$sp,48,$31		# vars= 0, regs= 5/0, args= 16, gp= 8
	.mask	0x800f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-48
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$17,32($sp)
	sll	$17,$4,2
	sw	$19,40($sp)
	sw	$16,28($sp)
	move	$16,$4
	.cprestore	16
	move	$4,$17
	sw	$31,44($sp)
	lw	$25,%call16(malloc)($28)
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	sw	$18,36($sp)

	lw	$28,16($sp)
	blez	$16,$L1
	move	$19,$2

	addu	$18,$17,$2
	move	$16,$2
$L3:
	lw	$25,%call16(malloc)($28)
	addiu	$16,$16,4
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	move	$4,$17

	lw	$28,16($sp)
	bne	$16,$18,$L3
	sw	$2,-4($16)

$L1:
	lw	$31,44($sp)
	move	$2,$19
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	jr	$31
	addiu	$sp,$sp,48

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
	.frame	$sp,40,$31		# vars= 0, regs= 4/0, args= 16, gp= 8
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-40
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$18,32($sp)
	move	$18,$4
	sw	$31,36($sp)
	sw	$17,28($sp)
	sw	$16,24($sp)
	blez	$5,$L8
	.cprestore	16

	sll	$5,$5,2
	move	$16,$4
	addu	$17,$5,$4
$L9:
	lw	$25,%call16(free)($28)
	addiu	$16,$16,4
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	lw	$4,-4($16)

	bne	$16,$17,$L9
	lw	$28,16($sp)

$L8:
	lw	$31,36($sp)
	move	$4,$18
	lw	$17,28($sp)
	lw	$18,32($sp)
	lw	$16,24($sp)
	lw	$25,%call16(free)($28)
	.reloc	1f,R_MIPS_JALR,free
1:	jr	$25
	addiu	$sp,$sp,40

	.set	macro
	.set	reorder
	.end	free_memory
	.size	free_memory, .-free_memory
	.globl	__floatdidf
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
$LC1:
	.ascii	"Matrix Multiplication of two N*N matrix took %.6f second"
	.ascii	"s where N = %d\012\000"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,96,$31		# vars= 40, regs= 6/0, args= 24, gp= 8
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-96
	addiu	$28,$28,%lo(__gnu_local_gp)
	li	$4,1024			# 0x400
	sw	$18,80($sp)
	lw	$18,%got(__stack_chk_guard)($28)
	sw	$20,88($sp)
	sw	$17,76($sp)
	sw	$31,92($sp)
	sw	$19,84($sp)
	sw	$16,72($sp)
	.cprestore	24
	lw	$2,0($18)
	sw	$2,68($sp)
	.option	pic0
	jal	create_matrix
	nop

	.option	pic2
	li	$4,1024			# 0x400
	li	$6,3072			# 0xc00
	move	$17,$2
	move	$20,$2
	move	$5,$2
$L13:
	lw	$3,0($5)
	addiu	$2,$4,-1024
$L14:
	sw	$2,0($3)
	addiu	$2,$2,1
	bne	$2,$4,$L14
	addiu	$3,$3,4

	addiu	$4,$2,2
	bne	$4,$6,$L13
	addiu	$5,$5,4

	.option	pic0
	jal	create_matrix
	.option	pic2
	li	$4,1024			# 0x400

	li	$4,3077			# 0xc05
	li	$6,1029			# 0x405
	move	$19,$2
	move	$5,$2
$L16:
	lw	$3,0($5)
	addiu	$2,$4,-3072
$L17:
	sw	$2,0($3)
	addiu	$2,$2,3
	bne	$2,$4,$L17
	addiu	$3,$3,4

	addiu	$4,$2,-2
	bne	$4,$6,$L16
	addiu	$5,$5,4

	.option	pic0
	jal	create_matrix
	.option	pic2
	li	$4,1024			# 0x400

	addiu	$5,$sp,32
	lw	$28,24($sp)
	move	$4,$0
	lw	$25,%call16(__clock_gettime64)($28)
	.reloc	1f,R_MIPS_JALR,__clock_gettime64
1:	jalr	$25
	move	$16,$2

	addiu	$13,$16,4096
	lw	$28,24($sp)
	li	$11,4096			# 0x1000
	move	$12,$16
$L19:
	lw	$10,0($20)
	move	$8,$0
	lw	$7,0($12)
	addiu	$9,$10,4096
$L21:
	move	$5,$0
	sw	$0,0($7)
	move	$2,$10
	move	$4,$19
$L20:
	lw	$3,0($4)
	addiu	$2,$2,4
	lw	$6,-4($2)
	addiu	$4,$4,4
	addu	$3,$3,$8
	lw	$3,0($3)
	mul	$14,$3,$6
	addu	$5,$14,$5
	bne	$9,$2,$L20
	sw	$5,0($7)

	addiu	$8,$8,4
	bne	$8,$11,$L21
	addiu	$7,$7,4

	addiu	$12,$12,4
	bne	$12,$13,$L19
	addiu	$20,$20,4

	lw	$25,%call16(__clock_gettime64)($28)
	addiu	$5,$sp,48
	.reloc	1f,R_MIPS_JALR,__clock_gettime64
1:	jalr	$25
	move	$4,$0

	lw	$2,52($sp)
	lw	$5,36($sp)
	lw	$28,24($sp)
	lw	$3,32($sp)
	lw	$4,48($sp)
	subu	$5,$2,$5
	lw	$25,%call16(__floatdidf)($28)
	sltu	$2,$2,$5
	subu	$4,$4,$3
	.reloc	1f,R_MIPS_JALR,__floatdidf
1:	jalr	$25
	subu	$4,$4,$2

	lui	$5,%hi($LC1)
	lw	$3,44($sp)
	li	$4,2			# 0x2
	lw	$2,60($sp)
	addiu	$5,$5,%lo($LC1)
	lw	$28,24($sp)
	subu	$2,$2,$3
	li	$3,1024			# 0x400
	mtc1	$2,$f2
	lui	$2,%hi($LC0)
	lw	$25,%call16(__printf_chk)($28)
	sw	$3,16($sp)
	ldc1	$f4,%lo($LC0)($2)
	cvt.d.w	$f2,$f2
	div.d	$f2,$f2,$f4
	add.d	$f0,$f0,$f2
	mfc1	$7,$f0
	.reloc	1f,R_MIPS_JALR,__printf_chk
1:	jalr	$25
	mfhc1	$6,$f0

	li	$5,1024			# 0x400
	.option	pic0
	jal	free_memory
	.option	pic2
	move	$4,$17

	li	$5,1024			# 0x400
	.option	pic0
	jal	free_memory
	.option	pic2
	move	$4,$19

	li	$5,1024			# 0x400
	.option	pic0
	jal	free_memory
	.option	pic2
	move	$4,$16

	lw	$3,68($sp)
	lw	$2,0($18)
	bne	$3,$2,$L29
	lw	$28,24($sp)

	lw	$31,92($sp)
	move	$2,$0
	lw	$20,88($sp)
	lw	$19,84($sp)
	lw	$18,80($sp)
	lw	$17,76($sp)
	lw	$16,72($sp)
	jr	$31
	addiu	$sp,$sp,96

$L29:
	lw	$25,%call16(__stack_chk_fail)($28)
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
$LC0:
	.word	1104006501
	.word	0
	.ident	"GCC: (Ubuntu 12.4.0-2ubuntu1~24.04) 12.4.0"
	.section	.note.GNU-stack,"",@progbits
