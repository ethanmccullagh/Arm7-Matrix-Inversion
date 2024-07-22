	.arch armv4t
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"optimized_code.c"
	.section	.rodata
	.align	2
	.type	C.238.18620, %object
	.size	C.238.18620, 800
C.238.18620:
	.word	1065353216
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1065353216
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1060823368
	.word	1063675494
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	0
	.word	1065353216
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1060823368
	.word	1060823368
	.word	1061997773
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	0
	.word	0
	.word	1065353216
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060320051
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	0
	.word	0
	.word	0
	.word	1065353216
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1058642330
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1065353216
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1056964608
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1065353216
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1053609165
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1065353216
	.word	0
	.word	0
	.word	0
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1050253722
	.word	1060823368
	.word	1060823368
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1065353216
	.word	0
	.word	0
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1045220557
	.word	1060823368
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1065353216
	.word	0
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1060823368
	.word	1036831949
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1065353216
	.align	2
.LC0:
	.ascii	"dividing by 0 at i=%d\012\000"
	.global	__aeabi_idiv
	.align	2
.LC1:
	.ascii	"\012\012INVERTED MATRIX\012\000"
	.align	2
.LC2:
	.ascii	"%.5f \000"
	.align	2
.LC3:
	.ascii	"matrix condition number: %.5f\012\000"
	.align	2
.LC4:
	.ascii	"The program took %.5f seconds to execute\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 1912
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #1904
	sub	sp, sp, #8
	str	r0, [fp, #-1872]
	str	r1, [fp, #-1876]
	bl	clock
	mov	r3, r0
	str	r3, [fp, #-184]
	ldr	r3, .L31+8
	sub	r2, fp, #984
	mov	ip, #800
	mov	r0, r2
	mov	r1, r3
	mov	r2, ip
	bl	memcpy
	mov	r0, #0
	mov	r1, #0
	mov	r2, #0
	flds	s13, .L31
	fmrs	r0, s13
	str	r0, [fp, #-1888]	@ float
	flds	s13, .L31
	fmrs	r0, s13
	str	r0, [fp, #-1884]	@ float
	mov	r1, #9
	str	r1, [fp, #-1900]
	b	.L2
.L5:
	mov	r2, #19
	str	r2, [fp, #-1896]
	b	.L3
.L4:
	ldr	r3, [fp, #-1900]
	ldr	r1, [fp, #-1896]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #972
	mov	r2, r2, asl #2
	sub	r4, fp, #12
	add	r2, r4, r2
	add	r3, r2, r3
	flds	s15, [r3, #0]
	ldr	r0, [fp, #-1888]	@ float
	fmsr	s13, r0
	fadds	s13, s13, s15
	fmrs	r0, s13
	str	r0, [fp, #-1888]	@ float
	ldr	r0, [fp, #-1900]
	ldr	ip, [fp, #-1896]
	ldr	r3, [fp, #-1900]
	ldr	r1, [fp, #-1896]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #972
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	flds	s14, [r3, #0]
	flds	s15, .L31+4
	fmuls	s15, s14, s15
	ftosizs	s15, s15
	fmrs	r1, s15	@ int
	mov	r3, r0
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, ip
	mvn	r3, #1760
	sub	r3, r3, #11
	mov	r2, r2, asl #2
	sub	r4, fp, #12
	add	r2, r4, r2
	add	r3, r2, r3
	str	r1, [r3, #0]
	ldr	r0, [fp, #-1896]
	sub	r0, r0, #1
	str	r0, [fp, #-1896]
.L3:
	ldr	r1, [fp, #-1896]
	cmp	r1, #0
	bge	.L4
	ldr	r2, [fp, #-1900]
	sub	r2, r2, #1
	str	r2, [fp, #-1900]
.L2:
	ldr	r3, [fp, #-1900]
	cmp	r3, #0
	bge	.L5
	mov	r4, #8
	str	r4, [fp, #-1900]
	b	.L6
.L8:
	ldr	r3, [fp, #-1900]
	mvn	r1, #1760
	sub	r1, r1, #11
	mov	r3, r3, asl #4
	mov	r2, r3, asl #2
	add	r3, r3, r2
	sub	r0, fp, #12
	add	r3, r0, r3
	add	r3, r3, r1
	ldr	r0, [r3, #0]
	ldr	r1, [fp, #-1900]
	add	r3, r1, #1
	mvn	r1, #1760
	sub	r1, r1, #11
	mov	r3, r3, asl #4
	mov	r2, r3, asl #2
	add	r3, r3, r2
	sub	r2, fp, #12
	add	r3, r2, r3
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r0, r3
	bge	.L7
	ldr	r3, [fp, #-1900]
	add	r3, r3, #1
	mov	r2, r3, asl #4
	mov	r3, r2, asl #2
	add	r2, r2, r3
	sub	r3, fp, #1760
	sub	r3, r3, #12
	sub	r3, r3, #12
	add	r3, r3, r2
	mov	r2, r3
	sub	r3, fp, #1840
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	mov	r1, r2
	mov	r2, #80
	bl	memcpy
	ldr	r3, [fp, #-1900]
	add	r3, r3, #1
	mov	r2, r3, asl #4
	mov	r3, r2, asl #2
	add	r2, r2, r3
	sub	r3, fp, #1760
	sub	r3, r3, #12
	sub	r3, r3, #12
	add	r3, r3, r2
	mov	r0, r3
	sub	r1, fp, #1760
	sub	r1, r1, #12
	sub	r1, r1, #12
	ldr	r3, [fp, #-1900]
	mov	r2, r3, asl #4
	mov	r3, r2, asl #2
	add	r3, r2, r3
	add	r3, r1, r3
	mov	r1, r3
	mov	r2, #80
	bl	memcpy
	sub	r1, fp, #1760
	sub	r1, r1, #12
	sub	r1, r1, #12
	ldr	r3, [fp, #-1900]
	mov	r2, r3, asl #4
	mov	r3, r2, asl #2
	add	r3, r2, r3
	add	r2, r1, r3
	sub	r3, fp, #1840
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r2
	mov	r1, r3
	mov	r2, #80
	bl	memcpy
.L7:
	ldr	r3, [fp, #-1900]
	sub	r3, r3, #1
	str	r3, [fp, #-1900]
.L6:
	ldr	r4, [fp, #-1900]
	cmp	r4, #0
	bgt	.L8
	mov	r0, #9
	str	r0, [fp, #-1900]
	b	.L9
.L17:
	ldr	r3, [fp, #-1900]
	ldr	r1, [fp, #-1900]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mvn	r3, #1760
	sub	r3, r3, #11
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L10
	ldr	r0, .L31+12
	ldr	r1, [fp, #-1900]
	bl	printf
	mov	r2, #0
	str	r2, [fp, #-1904]
	b	.L11
.L10:
	mov	r3, #9
	str	r3, [fp, #-1896]
	b	.L12
.L16:
	ldr	r4, [fp, #-1896]
	ldr	r0, [fp, #-1900]
	cmp	r4, r0
	beq	.L13
	ldr	r3, [fp, #-1896]
	ldr	r1, [fp, #-1900]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mvn	r3, #1760
	sub	r3, r3, #11
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3, asl #11
	ldr	r3, [fp, #-1900]
	ldr	r1, [fp, #-1900]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mvn	r3, #1760
	sub	r3, r3, #11
	mov	r2, r2, asl #2
	sub	r4, fp, #12
	add	r2, r4, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-1880]
	mov	r0, #0
	str	r0, [fp, #-1892]
	b	.L14
.L32:
	.align	2
.L31:
	.word	0
	.word	1157627904
	.word	C.238.18620
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
.L15:
	sub	r1, fp, #1760
	sub	r1, r1, #12
	sub	r1, r1, #12
	ldr	r3, [fp, #-1900]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #-1892]
	add	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r1, r3
	str	r3, [fp, #-120]
	ldr	r3, [fp, #-120]
	vld1.32	{d16-d17}, [r3]
	vstr	d16, [fp, #-180]
	vstr	d17, [fp, #-172]
	sub	r1, fp, #1760
	sub	r1, r1, #12
	sub	r1, r1, #12
	ldr	r3, [fp, #-1896]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #-1892]
	add	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r1, r3
	str	r3, [fp, #-116]
	ldr	r3, [fp, #-116]
	vld1.32	{d16-d17}, [r3]
	vstr	d16, [fp, #-164]
	vstr	d17, [fp, #-156]
	ldr	r3, [fp, #-1880]
	vldr	d16, [fp, #-180]
	vldr	d17, [fp, #-172]
	vstr	d16, [fp, #-108]
	vstr	d17, [fp, #-100]
	str	r3, [fp, #-112]
	vldr	d16, [fp, #-108]
	vldr	d17, [fp, #-100]
	ldr	r3, [fp, #-112]
	sub	r2, fp, #1904
	sub	r2, r2, #12
	ldmia	r2, {r0-r1}
	vmov	d18, r0, r1  @ v2si
	vmov.32	d18[0], r3
	sub	r0, fp, #1904
	sub	r0, r0, #12
	vmov	r1, r2, d18  @ v2si
	stmia	r0, {r1-r2}
	sub	r2, fp, #1904
	sub	r2, r2, #12
	ldmia	r2, {r0-r1}
	vmov	d7, r0, r1  @ v2si
	vmul.i32	q8, q8, d7[0]
	vstr	d16, [fp, #-180]
	vstr	d17, [fp, #-172]
	vldr	d16, [fp, #-180]
	vldr	d17, [fp, #-172]
	vstr	d16, [fp, #-84]
	vstr	d17, [fp, #-76]
	mov	r3, #0
	str	r3, [fp, #-88]
	vldr	d16, [fp, #-84]
	vldr	d17, [fp, #-76]
	ldr	r3, [fp, #-88]
	sub	r2, fp, #1920
	sub	r2, r2, #4
	ldmia	r2, {r0-r1}
	vmov	d18, r0, r1  @ v2si
	vmov.32	d18[0], r3
	sub	r0, fp, #1920
	sub	r0, r0, #4
	vmov	r1, r2, d18  @ v2si
	stmia	r0, {r1-r2}
	sub	r2, fp, #1920
	sub	r2, r2, #4
	ldmia	r2, {r0-r1}
	vmov	d7, r0, r1  @ v2si
	vmul.i32	q8, q8, d7[0]
	vstr	d16, [fp, #-180]
	vstr	d17, [fp, #-172]
	vldr	d16, [fp, #-164]
	vldr	d17, [fp, #-156]
	vstr	d16, [fp, #-52]
	vstr	d17, [fp, #-44]
	vldr	d16, [fp, #-180]
	vldr	d17, [fp, #-172]
	vstr	d16, [fp, #-68]
	vstr	d17, [fp, #-60]
	vldr	d18, [fp, #-52]
	vldr	d19, [fp, #-44]
	vldr	d16, [fp, #-68]
	vldr	d17, [fp, #-60]
	vsub.i32	q8, q9, q8
	vstr	d16, [fp, #-164]
	vstr	d17, [fp, #-156]
	sub	r1, fp, #1760
	sub	r1, r1, #12
	sub	r1, r1, #12
	ldr	r3, [fp, #-1896]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #-1892]
	add	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r1, r3
	str	r3, [fp, #-16]
	vldr	d16, [fp, #-164]
	vldr	d17, [fp, #-156]
	vstr	d16, [fp, #-36]
	vstr	d17, [fp, #-28]
	ldr	r3, [fp, #-16]
	vldr	d16, [fp, #-36]
	vldr	d17, [fp, #-28]
	vst1.32	{d16-d17}, [r3]
	ldr	r0, [fp, #-1892]
	add	r0, r0, #4
	str	r0, [fp, #-1892]
.L14:
	ldr	r1, [fp, #-1892]
	cmp	r1, #19
	ble	.L15
.L13:
	ldr	r2, [fp, #-1896]
	sub	r2, r2, #1
	str	r2, [fp, #-1896]
.L12:
	ldr	r3, [fp, #-1896]
	cmp	r3, #0
	bge	.L16
	ldr	r4, [fp, #-1900]
	sub	r4, r4, #1
	str	r4, [fp, #-1900]
.L9:
	ldr	r0, [fp, #-1900]
	cmp	r0, #0
	bge	.L17
	mov	r3, #0
	str	r3, [fp, #-140]
	b	.L18
.L21:
	ldr	r3, [fp, #-140]
	ldr	r1, [fp, #-140]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mvn	r3, #1760
	sub	r3, r3, #11
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	str	r3, [fp, #-136]
	mov	r3, #0
	str	r3, [fp, #-132]
	b	.L19
.L20:
	ldr	r4, [fp, #-140]
	ldr	r5, [fp, #-132]
	ldr	r3, [fp, #-140]
	ldr	r1, [fp, #-132]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mvn	r3, #1760
	sub	r3, r3, #11
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #11
	ldr	r2, [fp, #-136]
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r1, r3
	mov	r3, r4
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r5
	mvn	r3, #1760
	sub	r3, r3, #11
	mov	r2, r2, asl #2
	sub	r4, fp, #12
	add	r2, r4, r2
	add	r3, r2, r3
	str	r1, [r3, #0]
	ldr	r3, [fp, #-132]
	add	r3, r3, #1
	str	r3, [fp, #-132]
.L19:
	ldr	r3, [fp, #-132]
	cmp	r3, #19
	ble	.L20
	ldr	r3, [fp, #-140]
	add	r3, r3, #1
	str	r3, [fp, #-140]
.L18:
	ldr	r3, [fp, #-140]
	cmp	r3, #9
	ble	.L21
	mov	r0, #9
	str	r0, [fp, #-1900]
	b	.L22
.L25:
	mov	r1, #19
	str	r1, [fp, #-1896]
	b	.L23
.L24:
	ldr	r0, [fp, #-1900]
	ldr	ip, [fp, #-1896]
	ldr	r3, [fp, #-1900]
	ldr	r1, [fp, #-1896]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mvn	r3, #1760
	sub	r3, r3, #11
	mov	r2, r2, asl #2
	sub	r4, fp, #12
	add	r2, r4, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r2, r3
	add	r3, r2, #2032
	add	r3, r3, #15
	cmp	r2, #0
	movlt	r2, r3
	mov	r3, r2, asr #11
	fmsr	s13, r3	@ int
	fsitos	s15, s13
	mov	r3, r0
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, ip
	mov	r3, #0
	sub	r3, r3, #972
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	fsts	s15, [r3, #0]
	ldr	r3, [fp, #-1900]
	ldr	r1, [fp, #-1896]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #972
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	flds	s15, [r3, #0]
	ldr	r0, [fp, #-1884]	@ float
	fmsr	s13, r0
	fadds	s13, s13, s15
	fmrs	r0, s13
	str	r0, [fp, #-1884]	@ float
	ldr	r1, [fp, #-1896]
	sub	r1, r1, #1
	str	r1, [fp, #-1896]
.L23:
	ldr	r2, [fp, #-1896]
	cmp	r2, #0
	bge	.L24
	ldr	r3, [fp, #-1900]
	sub	r3, r3, #1
	str	r3, [fp, #-1900]
.L22:
	ldr	r4, [fp, #-1900]
	cmp	r4, #0
	bge	.L25
	ldr	r0, .L31+16
	bl	puts
	mov	r3, #0
	str	r3, [fp, #-128]
	b	.L26
.L29:
	mov	r3, #10
	str	r3, [fp, #-124]
	b	.L27
.L28:
	ldr	r3, [fp, #-128]
	ldr	r1, [fp, #-124]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #972
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	flds	s15, [r3, #0]
	fcvtds	d16, s15
	ldr	r0, .L31+20
	fmrrd	r2, r3, d16
	bl	printf
	ldr	r3, [fp, #-124]
	add	r3, r3, #1
	str	r3, [fp, #-124]
.L27:
	ldr	r3, [fp, #-124]
	cmp	r3, #19
	ble	.L28
	mov	r0, #10
	bl	putchar
	ldr	r3, [fp, #-128]
	add	r3, r3, #1
	str	r3, [fp, #-128]
.L26:
	ldr	r3, [fp, #-128]
	cmp	r3, #9
	ble	.L29
	ldr	r0, [fp, #-1888]	@ float
	fmsr	s13, r0
	ldr	r0, [fp, #-1884]	@ float
	fmsr	s14, r0
	fmuls	s15, s13, s14
	fcvtds	d16, s15
	ldr	r0, .L31+24
	fmrrd	r2, r3, d16
	bl	printf
	bl	clock
	mov	r2, r0
	ldr	r3, [fp, #-184]
	rsb	r3, r3, r2
	fmsr	s13, r3	@ int
	fsitod	d17, s13
	fldd	d16, .L33
	fdivd	d16, d17, d16
	fstd	d16, [fp, #-148]
	ldr	r0, .L33+8
	sub	r3, fp, #148
	ldmia	r3, {r2-r3}
	bl	printf
	mov	r0, #0
	str	r0, [fp, #-1904]
.L11:
	ldr	r3, [fp, #-1904]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, lr}
	bx	lr
.L34:
	.align	3
.L33:
	.word	0
	.word	1093567616
	.word	.LC4
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
