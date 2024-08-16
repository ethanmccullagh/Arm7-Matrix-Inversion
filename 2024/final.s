	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"final_optimization.c"
	.text
	.global	matrix
	.data
	.align	4
	.type	matrix, %object
	.size	matrix, 128
matrix:
	.word	7
	.word	7
	.word	8
	.word	3
	.space	16
	.word	9
	.word	6
	.word	1
	.word	1
	.space	16
	.word	10
	.word	3
	.word	5
	.word	0
	.space	16
	.word	5
	.word	8
	.word	6
	.word	4
	.space	16
	.comm	result,128,4
	.comm	scalar,4,4
	.comm	recipricol,4,4
	.global	i
	.bss
	.align	2
	.type	i, %object
	.size	i, 4
i:
	.space	4
	.global	j
	.align	2
	.type	j, %object
	.size	j, 4
j:
	.space	4
	.global	k
	.align	2
	.type	k, %object
	.size	k, 4
k:
	.space	4
	.comm	vec,16,8
	.comm	piv,16,8
	.comm	flo,16,8
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Runtime: %d seconds\012\000"
	.text
	.align	2
	.global	main
	.arch armv7-a
	.syntax unified
	.arm
	.fpu neon
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	bl	clock
	str	r0, [fp, #-8]
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	mov	r2, #0
	str	r2, [r3]
	b	.L2
.L7:
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	mov	r2, #0
	str	r2, [r3]
	b	.L3
.L6:
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r2, [r3]
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L4
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r1, [r3]
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	add	r2, r3, #4
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	lsl	r1, r1, #3
	add	r2, r1, r2
	mov	r1, #1
	str	r1, [r3, r2, lsl #2]
	b	.L5
.L4:
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r1, [r3]
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	add	r2, r3, #4
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	lsl	r1, r1, #3
	add	r2, r1, r2
	mov	r1, #0
	str	r1, [r3, r2, lsl #2]
.L5:
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	add	r2, r3, #1
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	str	r2, [r3]
.L3:
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L6
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	add	r2, r3, #1
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	str	r2, [r3]
.L2:
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L7
	bl	printMatrix
	bl	augment
	bl	printMatrix
	bl	belowDiagonal
	bl	printMatrix
	bl	setOnes
	bl	printMatrix
	bl	aboveDiagonal
	bl	printMatrix
	bl	normalize
	bl	clock
	mov	r2, r0
	ldr	r3, [fp, #-8]
	sub	r3, r2, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d17, s15
	vldr.64	d18, .L9
	vdiv.f64	d16, d17, d18
	vstr.64	d16, [fp, #-20]
	ldrd	r2, [fp, #-20]
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L10:
	.align	3
.L9:
	.word	0
	.word	1093567616
	.size	main, .-main
	.align	2
	.global	augment
	.syntax unified
	.arm
	.fpu neon
	.type	augment, %function
augment:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #52
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	mov	r2, #0
	str	r2, [r3]
	b	.L12
.L17:
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	mov	r2, #0
	str	r2, [r3]
	b	.L13
.L16:
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	lsl	r2, r3, #5
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	add	r2, r2, r3
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	lsl	r3, r3, #2
	add	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	vld1.32	{d16-d17}, [r3]
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vld1.64	{d16-d17}, [r3:64]
	vstr	d16, [fp, #-44]
	vstr	d17, [fp, #-36]
	vldr	d16, [fp, #-44]
	vldr	d17, [fp, #-36]
	vshl.i32	q8, q8, #8
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	lsl	r2, r3, #5
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	add	r2, r2, r3
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	lsl	r3, r3, #2
	add	r2, r2, r3
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vld1.64	{d16-d17}, [r3:64]
	str	r2, [fp, #-8]
	vstr	d16, [fp, #-28]
	vstr	d17, [fp, #-20]
	ldr	r3, [fp, #-8]
	vldr	d16, [fp, #-28]
	vldr	d17, [fp, #-20]
	vst1.32	{d16-d17}, [r3]
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	add	r2, r3, #4
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	str	r2, [r3]
.L13:
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	cmp	r3, #7
	ble	.L16
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	add	r2, r3, #1
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	str	r2, [r3]
.L12:
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L17
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	augment, .-augment
	.section	.rodata
	.align	2
.LC1:
	.ascii	"----------RESULT---------\000"
	.align	2
.LC2:
	.ascii	"%10.2f\000"
	.text
	.align	2
	.global	normalize
	.syntax unified
	.arm
	.fpu neon
	.type	normalize, %function
normalize:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	puts
	movw	r3, #:lower16:recipricol
	movt	r3, #:upper16:recipricol
	mov	r2, #256
	str	r2, [r3]
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	mov	r2, #0
	str	r2, [r3]
	b	.L19
.L22:
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	mov	r2, #0
	str	r2, [r3]
	b	.L20
.L21:
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r1, [r3]
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r2, [r3]
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	lsl	r1, r1, #3
	add	r2, r1, r2
	ldr	r3, [r3, r2, lsl #2]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r1, [r3]
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r2, [r3]
	vldr.32	s13, .L23
	vdiv.f32	s15, s14, s13
	movw	r3, #:lower16:result
	movt	r3, #:upper16:result
	lsl	r1, r1, #3
	add	r2, r1, r2
	lsl	r2, r2, #2
	add	r3, r3, r2
	vstr.32	s15, [r3]
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r1, [r3]
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r2, [r3]
	movw	r3, #:lower16:result
	movt	r3, #:upper16:result
	lsl	r1, r1, #3
	add	r2, r1, r2
	lsl	r2, r2, #2
	add	r3, r3, r2
	vldr.32	s15, [r3]
	vcvt.f64.f32	d16, s15
	vmov	r2, r3, d16
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	printf
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	add	r2, r3, #1
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	str	r2, [r3]
.L20:
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	cmp	r3, #7
	ble	.L21
	mov	r0, #10
	bl	putchar
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	add	r2, r3, #1
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	str	r2, [r3]
.L19:
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L22
	nop
	pop	{fp, pc}
.L24:
	.align	2
.L23:
	.word	1132462080
	.size	normalize, .-normalize
	.global	__aeabi_idiv
	.align	2
	.global	belowDiagonal
	.syntax unified
	.arm
	.fpu neon
	.type	belowDiagonal, %function
belowDiagonal:
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	vpush.64	{d8}
	add	fp, sp, #12
	sub	sp, sp, #120
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	mov	r2, #0
	str	r2, [r3]
	b	.L26
.L37:
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	add	r2, r3, #1
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	str	r2, [r3]
	b	.L27
.L36:
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r1, [r3]
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r2, [r3]
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	lsl	r1, r1, #3
	add	r2, r1, r2
	ldr	r3, [r3, r2, lsl #2]
	lsl	r0, r3, #8
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r1, [r3]
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r2, [r3]
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	lsl	r1, r1, #3
	add	r2, r1, r2
	ldr	r3, [r3, r2, lsl #2]
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r2, r3
	movw	r3, #:lower16:scalar
	movt	r3, #:upper16:scalar
	str	r2, [r3]
	movw	r3, #:lower16:k
	movt	r3, #:upper16:k
	mov	r2, #0
	str	r2, [r3]
	b	.L28
.L35:
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	lsl	r2, r3, #5
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	add	r2, r2, r3
	movw	r3, #:lower16:k
	movt	r3, #:upper16:k
	ldr	r3, [r3]
	lsl	r3, r3, #2
	add	r3, r2, r3
	str	r3, [fp, #-132]
	ldr	r3, [fp, #-132]
	vld1.32	{d16-d17}, [r3]
	movw	r3, #:lower16:piv
	movt	r3, #:upper16:piv
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	lsl	r2, r3, #5
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	add	r2, r2, r3
	movw	r3, #:lower16:k
	movt	r3, #:upper16:k
	ldr	r3, [r3]
	lsl	r3, r3, #2
	add	r3, r2, r3
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-128]
	vld1.32	{d16-d17}, [r3]
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vld1.64	{d16-d17}, [r3:64]
	vstr	d16, [fp, #-124]
	vstr	d17, [fp, #-116]
	vldr	d16, [fp, #-124]
	vldr	d17, [fp, #-116]
	vshl.i32	q8, q8, #8
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:piv
	movt	r3, #:upper16:piv
	vld1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:scalar
	movt	r3, #:upper16:scalar
	ldr	r3, [r3]
	vstr	d16, [fp, #-100]
	vstr	d17, [fp, #-92]
	str	r3, [fp, #-104]
	vldr	d16, [fp, #-100]
	vldr	d17, [fp, #-92]
	ldr	r3, [fp, #-104]
	vmov.32	d8[0], r3
	vmul.i32	q8, q8, d8[0]
	movw	r3, #:lower16:piv
	movt	r3, #:upper16:piv
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vld1.64	{d18-d19}, [r3:64]
	movw	r3, #:lower16:piv
	movt	r3, #:upper16:piv
	vld1.64	{d16-d17}, [r3:64]
	vstr	d18, [fp, #-68]
	vstr	d19, [fp, #-60]
	vstr	d16, [fp, #-84]
	vstr	d17, [fp, #-76]
	vldr	d18, [fp, #-68]
	vldr	d19, [fp, #-60]
	vldr	d16, [fp, #-84]
	vldr	d17, [fp, #-76]
	vsub.i32	q8, q9, q8
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vld1.64	{d16-d17}, [r3:64]
	vstr	d16, [fp, #-52]
	vstr	d17, [fp, #-44]
	vldr	d16, [fp, #-52]
	vldr	d17, [fp, #-44]
	vshr.s32	q8, q8, #8
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	lsl	r2, r3, #5
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	add	r2, r2, r3
	movw	r3, #:lower16:k
	movt	r3, #:upper16:k
	ldr	r3, [r3]
	lsl	r3, r3, #2
	add	r2, r2, r3
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vld1.64	{d16-d17}, [r3:64]
	str	r2, [fp, #-16]
	vstr	d16, [fp, #-36]
	vstr	d17, [fp, #-28]
	ldr	r3, [fp, #-16]
	vldr	d16, [fp, #-36]
	vldr	d17, [fp, #-28]
	vst1.32	{d16-d17}, [r3]
	movw	r3, #:lower16:k
	movt	r3, #:upper16:k
	ldr	r3, [r3]
	add	r2, r3, #4
	movw	r3, #:lower16:k
	movt	r3, #:upper16:k
	str	r2, [r3]
.L28:
	movw	r3, #:lower16:k
	movt	r3, #:upper16:k
	ldr	r3, [r3]
	cmp	r3, #7
	ble	.L35
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	add	r2, r3, #1
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	str	r2, [r3]
.L27:
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L36
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	add	r2, r3, #1
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	str	r2, [r3]
.L26:
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	cmp	r3, #2
	ble	.L37
	nop
	sub	sp, fp, #12
	@ sp needed
	vldm	sp!, {d8}
	pop	{fp, pc}
	.size	belowDiagonal, .-belowDiagonal
	.align	2
	.global	setOnes
	.syntax unified
	.arm
	.fpu neon
	.type	setOnes, %function
setOnes:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	vpush.64	{d8}
	add	fp, sp, #12
	sub	sp, sp, #64
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	mov	r2, #0
	str	r2, [r3]
	b	.L39
.L45:
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r1, [r3]
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r2, [r3]
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	lsl	r1, r1, #3
	add	r2, r1, r2
	ldr	r3, [r3, r2, lsl #2]
	mov	r1, r3
	mov	r0, #1048576
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-16]
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	mov	r2, #0
	str	r2, [r3]
	b	.L40
.L44:
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	lsl	r2, r3, #5
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	add	r2, r2, r3
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	lsl	r3, r3, #2
	add	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-76]
	vld1.32	{d16-d17}, [r3]
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vld1.64	{d16-d17}, [r3:64]
	vstr	d16, [fp, #-68]
	vstr	d17, [fp, #-60]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-72]
	vldr	d16, [fp, #-68]
	vldr	d17, [fp, #-60]
	ldr	r3, [fp, #-72]
	vmov.32	d8[0], r3
	vmul.i32	q8, q8, d8[0]
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vld1.64	{d16-d17}, [r3:64]
	vstr	d16, [fp, #-52]
	vstr	d17, [fp, #-44]
	vldr	d16, [fp, #-52]
	vldr	d17, [fp, #-44]
	vshr.s32	q8, q8, #12
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	lsl	r2, r3, #5
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	add	r2, r2, r3
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	lsl	r3, r3, #2
	add	r2, r2, r3
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vld1.64	{d16-d17}, [r3:64]
	str	r2, [fp, #-20]
	vstr	d16, [fp, #-36]
	vstr	d17, [fp, #-28]
	ldr	r3, [fp, #-20]
	vldr	d16, [fp, #-36]
	vldr	d17, [fp, #-28]
	vst1.32	{d16-d17}, [r3]
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	add	r2, r3, #4
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	str	r2, [r3]
.L40:
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	cmp	r3, #7
	ble	.L44
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	add	r2, r3, #1
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	str	r2, [r3]
.L39:
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L45
	nop
	sub	sp, fp, #12
	@ sp needed
	vldm	sp!, {d8}
	pop	{fp, pc}
	.size	setOnes, .-setOnes
	.align	2
	.global	aboveDiagonal
	.syntax unified
	.arm
	.fpu neon
	.type	aboveDiagonal, %function
aboveDiagonal:
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	vpush.64	{d8}
	add	fp, sp, #12
	sub	sp, sp, #120
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	mov	r2, #3
	str	r2, [r3]
	b	.L47
.L58:
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	sub	r2, r3, #1
	movw	r3, #:lower16:k
	movt	r3, #:upper16:k
	str	r2, [r3]
	b	.L48
.L57:
	movw	r3, #:lower16:k
	movt	r3, #:upper16:k
	ldr	r1, [r3]
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r2, [r3]
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	lsl	r1, r1, #3
	add	r2, r1, r2
	ldr	r3, [r3, r2, lsl #2]
	lsl	r0, r3, #8
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r1, [r3]
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r2, [r3]
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	lsl	r1, r1, #3
	add	r2, r1, r2
	ldr	r3, [r3, r2, lsl #2]
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r2, r3
	movw	r3, #:lower16:scalar
	movt	r3, #:upper16:scalar
	str	r2, [r3]
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	mov	r2, #0
	str	r2, [r3]
	b	.L49
.L56:
	movw	r3, #:lower16:k
	movt	r3, #:upper16:k
	ldr	r3, [r3]
	lsl	r2, r3, #5
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	add	r2, r2, r3
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	lsl	r3, r3, #2
	add	r3, r2, r3
	str	r3, [fp, #-132]
	ldr	r3, [fp, #-132]
	vld1.32	{d16-d17}, [r3]
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	lsl	r2, r3, #5
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	add	r2, r2, r3
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	lsl	r3, r3, #2
	add	r3, r2, r3
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-128]
	vld1.32	{d16-d17}, [r3]
	movw	r3, #:lower16:piv
	movt	r3, #:upper16:piv
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vld1.64	{d16-d17}, [r3:64]
	vstr	d16, [fp, #-124]
	vstr	d17, [fp, #-116]
	vldr	d16, [fp, #-124]
	vldr	d17, [fp, #-116]
	vshl.i32	q8, q8, #8
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:piv
	movt	r3, #:upper16:piv
	vld1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:scalar
	movt	r3, #:upper16:scalar
	ldr	r3, [r3]
	vstr	d16, [fp, #-100]
	vstr	d17, [fp, #-92]
	str	r3, [fp, #-104]
	vldr	d16, [fp, #-100]
	vldr	d17, [fp, #-92]
	ldr	r3, [fp, #-104]
	vmov.32	d8[0], r3
	vmul.i32	q8, q8, d8[0]
	movw	r3, #:lower16:piv
	movt	r3, #:upper16:piv
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vld1.64	{d18-d19}, [r3:64]
	movw	r3, #:lower16:piv
	movt	r3, #:upper16:piv
	vld1.64	{d16-d17}, [r3:64]
	vstr	d18, [fp, #-68]
	vstr	d19, [fp, #-60]
	vstr	d16, [fp, #-84]
	vstr	d17, [fp, #-76]
	vldr	d18, [fp, #-68]
	vldr	d19, [fp, #-60]
	vldr	d16, [fp, #-84]
	vldr	d17, [fp, #-76]
	vsub.i32	q8, q9, q8
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vld1.64	{d16-d17}, [r3:64]
	vstr	d16, [fp, #-52]
	vstr	d17, [fp, #-44]
	vldr	d16, [fp, #-52]
	vldr	d17, [fp, #-44]
	vshr.s32	q8, q8, #8
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vst1.64	{d16-d17}, [r3:64]
	movw	r3, #:lower16:k
	movt	r3, #:upper16:k
	ldr	r3, [r3]
	lsl	r2, r3, #5
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	add	r2, r2, r3
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	lsl	r3, r3, #2
	add	r2, r2, r3
	movw	r3, #:lower16:vec
	movt	r3, #:upper16:vec
	vld1.64	{d16-d17}, [r3:64]
	str	r2, [fp, #-16]
	vstr	d16, [fp, #-36]
	vstr	d17, [fp, #-28]
	ldr	r3, [fp, #-16]
	vldr	d16, [fp, #-36]
	vldr	d17, [fp, #-28]
	vst1.32	{d16-d17}, [r3]
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	add	r2, r3, #4
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	str	r2, [r3]
.L49:
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	cmp	r3, #7
	ble	.L56
	movw	r3, #:lower16:k
	movt	r3, #:upper16:k
	ldr	r3, [r3]
	sub	r2, r3, #1
	movw	r3, #:lower16:k
	movt	r3, #:upper16:k
	str	r2, [r3]
.L48:
	movw	r3, #:lower16:k
	movt	r3, #:upper16:k
	ldr	r3, [r3]
	cmp	r3, #0
	bge	.L57
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	sub	r2, r3, #1
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	str	r2, [r3]
.L47:
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L58
	nop
	sub	sp, fp, #12
	@ sp needed
	vldm	sp!, {d8}
	pop	{fp, pc}
	.size	aboveDiagonal, .-aboveDiagonal
	.section	.rodata
	.align	2
.LC3:
	.ascii	"----------Matrix----------\000"
	.align	2
.LC4:
	.ascii	"%8d\000"
	.align	2
.LC5:
	.ascii	"  |   \000"
	.text
	.align	2
	.global	printMatrix
	.syntax unified
	.arm
	.fpu neon
	.type	printMatrix, %function
printMatrix:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	bl	puts
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	mov	r2, #0
	str	r2, [r3]
	b	.L60
.L64:
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	mov	r2, #0
	str	r2, [r3]
	b	.L61
.L63:
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r1, [r3]
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r2, [r3]
	movw	r3, #:lower16:matrix
	movt	r3, #:upper16:matrix
	lsl	r1, r1, #3
	add	r2, r1, r2
	ldr	r3, [r3, r2, lsl #2]
	mov	r1, r3
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	printf
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	cmp	r3, #3
	bne	.L62
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	printf
.L62:
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	add	r2, r3, #1
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	str	r2, [r3]
.L61:
	movw	r3, #:lower16:j
	movt	r3, #:upper16:j
	ldr	r3, [r3]
	cmp	r3, #7
	ble	.L63
	mov	r0, #10
	bl	putchar
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	add	r2, r3, #1
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	str	r2, [r3]
.L60:
	movw	r3, #:lower16:i
	movt	r3, #:upper16:i
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L64
	nop
	pop	{fp, pc}
	.size	printMatrix, .-printMatrix
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
