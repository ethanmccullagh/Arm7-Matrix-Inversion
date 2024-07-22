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
	.file	"unoptimized_code.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%f \000"
	.text
	.align	2
	.global	PrintFullMatrix
	.type	PrintFullMatrix, %function
PrintFullMatrix:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L2
.L5:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L3
.L4:
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #4
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r3, r2
	ldr	r3, [fp, #-8]
	add	r1, r2, r3, asl #2
	flds	s15, [r1, #0]
	fcvtds	d16, s15
	ldr	r0, .L7
	fmrrd	r2, r3, d16
	bl	printf
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L3:
	ldr	r3, [fp, #-8]
	cmp	r3, #19
	ble	.L4
	mov	r0, #10
	bl	putchar
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L2:
	ldr	r3, [fp, #-12]
	cmp	r3, #9
	ble	.L5
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LC0
	.size	PrintFullMatrix, .-PrintFullMatrix
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Starting the inversion\000"
	.align	2
.LC2:
	.ascii	"Finished augmenting the identity matrix\000"
	.align	2
.LC3:
	.ascii	"Apply Gauss-Jordan elimination\000"
	.align	2
.LC4:
	.ascii	"\012Rows have been interchanged\000"
	.align	2
.LC5:
	.ascii	"\012\012INVERTED MATRIX\012\000"
	.align	2
.LC6:
	.ascii	"matrix condition number: %.5f\012\000"
	.align	2
.LC7:
	.ascii	"The program took %.5f seconds to execute\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 968
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #968
	str	r0, [fp, #-968]
	str	r1, [fp, #-972]
	bl	clock
	mov	r3, r0
	str	r3, [fp, #-80]
	sub	r3, fp, #880
	mov	r2, #800
	mov	r0, r3
	mov	r1, #0
	bl	memset
	ldr	r3, .L43+8	@ float
	str	r3, [fp, #-880]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-876]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-872]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-868]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-864]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-860]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-856]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-852]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-848]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-844]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-800]	@ float
	ldr	r3, .L43+16	@ float
	str	r3, [fp, #-796]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-792]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-788]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-784]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-780]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-776]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-772]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-768]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-764]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-720]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-716]	@ float
	ldr	r3, .L43+20	@ float
	str	r3, [fp, #-712]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-708]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-704]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-700]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-696]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-692]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-688]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-684]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-640]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-636]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-632]	@ float
	ldr	r3, .L43+24	@ float
	str	r3, [fp, #-628]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-624]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-620]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-616]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-612]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-608]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-604]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-560]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-556]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-552]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-548]	@ float
	ldr	r3, .L43+28	@ float
	str	r3, [fp, #-544]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-540]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-536]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-532]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-528]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-524]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-480]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-476]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-472]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-468]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-464]	@ float
	ldr	r3, .L43+32	@ float
	str	r3, [fp, #-460]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-456]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-452]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-448]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-444]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-400]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-396]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-392]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-388]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-384]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-380]	@ float
	ldr	r3, .L43+36	@ float
	str	r3, [fp, #-376]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-372]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-368]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-364]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-320]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-316]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-312]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-308]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-304]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-300]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-296]	@ float
	ldr	r3, .L43+40	@ float
	str	r3, [fp, #-292]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-288]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-284]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-240]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-236]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-232]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-228]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-224]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-220]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-216]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-212]	@ float
	ldr	r3, .L43+44	@ float
	str	r3, [fp, #-208]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-204]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-160]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-156]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-152]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-148]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-144]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-140]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-136]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-132]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-128]	@ float
	ldr	r3, .L43+12	@ float
	str	r3, [fp, #-124]	@ float
	ldr	r0, .L43+48
	bl	puts
	mov	r3, #0
	str	r3, [fp, #-64]
	b	.L10
.L15:
	mov	r3, #0
	str	r3, [fp, #-60]
	b	.L11
.L14:
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-60]
	cmp	r2, r3
	bne	.L12
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-60]
	add	r1, r3, #10
	mov	r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	r0, fp, #4
	add	r2, r0, r2
	add	r2, r2, r3
	ldr	r3, .L43+12	@ float
	str	r3, [r2, #0]	@ float
	b	.L13
.L12:
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-60]
	add	r1, r3, #10
	mov	r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r2, r2, r3
	ldr	r3, .L43+52	@ float
	str	r3, [r2, #0]	@ float
.L13:
	ldr	r3, [fp, #-60]
	add	r3, r3, #1
	str	r3, [fp, #-60]
.L11:
	ldr	r3, [fp, #-60]
	cmp	r3, #9
	ble	.L14
	ldr	r3, [fp, #-64]
	add	r3, r3, #1
	str	r3, [fp, #-64]
.L10:
	ldr	r3, [fp, #-64]
	cmp	r3, #9
	ble	.L15
	mov	r3, #0
	str	r3, [fp, #-56]
	b	.L16
.L19:
	mov	r3, #0
	str	r3, [fp, #-52]
	b	.L17
.L18:
	ldr	r3, [fp, #-56]
	ldr	r1, [fp, #-52]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	ip, fp, #4
	add	r2, ip, r2
	add	r3, r2, r3
	flds	s14, [r3, #0]
	ldr	r3, .L43+56
	flds	s15, [r3, #0]
	fadds	s15, s14, s15
	ldr	r3, .L43+56
	fsts	s15, [r3, #0]
	ldr	r3, [fp, #-52]
	add	r3, r3, #1
	str	r3, [fp, #-52]
.L17:
	ldr	r3, [fp, #-52]
	cmp	r3, #9
	ble	.L18
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-56]
.L16:
	ldr	r3, [fp, #-56]
	cmp	r3, #9
	ble	.L19
	sub	r3, fp, #880
	mov	r0, r3
	bl	PrintFullMatrix
	ldr	r0, .L43+60
	bl	puts
	ldr	r0, .L43+64
	bl	puts
	mov	r3, #9
	str	r3, [fp, #-48]
	b	.L20
.L25:
	ldr	r3, [fp, #-48]
	sub	r3, r3, #1
	mov	r1, #0
	sub	r1, r1, #876
	mov	r3, r3, asl #4
	mov	r2, r3, asl #2
	add	r3, r3, r2
	sub	r0, fp, #4
	add	r3, r0, r3
	add	r3, r3, r1
	flds	s14, [r3, #0]
	ldr	r3, [fp, #-48]
	mov	r1, #0
	sub	r1, r1, #876
	mov	r3, r3, asl #4
	mov	r2, r3, asl #2
	add	r3, r3, r2
	sub	r2, fp, #4
	add	r3, r2, r3
	add	r3, r3, r1
	flds	s15, [r3, #0]
	fcmpes	s14, s15
	fmstat
	bpl	.L21
.L42:
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L23
.L24:
	ldr	r0, [fp, #-44]
	ldr	r3, [fp, #-48]
	ldr	r1, [fp, #-44]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	ip, fp, #4
	add	r2, ip, r2
	add	r3, r2, r3
	ldr	r1, [r3, #0]	@ float
	mov	r3, #0
	sub	r3, r3, #956
	mov	r2, r0, asl #2
	sub	r0, fp, #4
	add	r2, r0, r2
	add	r3, r2, r3
	str	r1, [r3, #0]	@ float
	ldr	r0, [fp, #-48]
	ldr	ip, [fp, #-44]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #1
	ldr	r1, [fp, #-44]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r1, [r3, #0]	@ float
	mov	r3, r0
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, ip
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	ip, fp, #4
	add	r2, ip, r2
	add	r3, r2, r3
	str	r1, [r3, #0]	@ float
	ldr	r3, [fp, #-48]
	sub	r1, r3, #1
	ldr	r0, [fp, #-44]
	ldr	r2, [fp, #-44]
	mov	r3, #0
	sub	r3, r3, #956
	mov	r2, r2, asl #2
	sub	ip, fp, #4
	add	r2, ip, r2
	add	r3, r2, r3
	ldr	ip, [r3, #0]	@ float
	mov	r3, r1
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r0
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	r0, fp, #4
	add	r2, r0, r2
	add	r3, r2, r3
	str	ip, [r3, #0]	@ float
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L23:
	ldr	r3, [fp, #-44]
	cmp	r3, #19
	ble	.L24
.L21:
	ldr	r3, [fp, #-48]
	sub	r3, r3, #1
	str	r3, [fp, #-48]
.L20:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	bgt	.L25
	ldr	r0, .L43+68
	bl	puts
	sub	r3, fp, #880
	mov	r0, r3
	bl	PrintFullMatrix
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L26
.L32:
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L27
.L31:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	beq	.L28
	ldr	r3, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	flds	s14, [r3, #0]
	ldr	r3, [fp, #-40]
	ldr	r1, [fp, #-40]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	ip, fp, #4
	add	r2, ip, r2
	add	r3, r2, r3
	flds	s15, [r3, #0]
	fdivs	s15, s14, s15
	fsts	s15, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L29
.L30:
	ldr	r0, [fp, #-36]
	ldr	ip, [fp, #-28]
	ldr	r3, [fp, #-36]
	ldr	r1, [fp, #-28]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	flds	s13, [r3, #0]
	ldr	r3, [fp, #-40]
	ldr	r1, [fp, #-28]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	flds	s14, [r3, #0]
	flds	s15, [fp, #-32]
	fmuls	s15, s14, s15
	fsubs	s15, s13, s15
	mov	r3, r0
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, ip
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	ip, fp, #4
	add	r2, ip, r2
	add	r3, r2, r3
	fsts	s15, [r3, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L29:
	ldr	r3, [fp, #-28]
	cmp	r3, #19
	ble	.L30
.L28:
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L27:
	ldr	r3, [fp, #-36]
	cmp	r3, #9
	ble	.L31
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L26:
	ldr	r3, [fp, #-40]
	cmp	r3, #9
	ble	.L32
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L33
.L36:
	ldr	r3, [fp, #-24]
	ldr	r1, [fp, #-24]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	r0, fp, #4
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]	@ float
	str	r3, [fp, #-20]	@ float
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L34
.L35:
	ldr	r0, [fp, #-24]
	ldr	ip, [fp, #-16]
	ldr	r3, [fp, #-24]
	ldr	r1, [fp, #-16]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	flds	s14, [r3, #0]
	flds	s15, [fp, #-20]
	fdivs	s15, s14, s15
	mov	r3, r0
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, ip
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	ip, fp, #4
	add	r2, ip, r2
	add	r3, r2, r3
	fsts	s15, [r3, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L34:
	ldr	r3, [fp, #-16]
	cmp	r3, #19
	ble	.L35
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L33:
	ldr	r3, [fp, #-24]
	cmp	r3, #9
	ble	.L36
	ldr	r0, .L43+72
	bl	puts
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L37
.L40:
	mov	r3, #10
	str	r3, [fp, #-8]
	b	.L38
.L39:
	ldr	r3, [fp, #-12]
	ldr	r1, [fp, #-8]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	r0, fp, #4
	add	r2, r0, r2
	add	r3, r2, r3
	flds	s14, [r3, #0]
	ldr	r3, .L43+76
	flds	s15, [r3, #0]
	fadds	s15, s14, s15
	ldr	r3, .L43+76
	fsts	s15, [r3, #0]
	ldr	r3, [fp, #-12]
	ldr	r1, [fp, #-8]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	sub	r3, r3, #876
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	flds	s15, [r3, #0]
	fcvtds	d16, s15
	ldr	r0, .L43+80
	fmrrd	r2, r3, d16
	bl	printf
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L38:
	ldr	r3, [fp, #-8]
	cmp	r3, #19
	ble	.L39
	mov	r0, #10
	bl	putchar
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L37:
	ldr	r3, [fp, #-12]
	cmp	r3, #9
	ble	.L40
	ldr	r3, .L43+56
	flds	s14, [r3, #0]
	ldr	r3, .L43+76
	flds	s15, [r3, #0]
	fmuls	s15, s14, s15
	fcvtds	d16, s15
	ldr	r0, .L43+84
	fmrrd	r2, r3, d16
	bl	printf
	bl	clock
	mov	r2, r0
	ldr	r3, [fp, #-80]
	rsb	r3, r3, r2
	fmsr	s15, r3	@ int
	fsitod	d17, s15
	fldd	d16, .L43
	fdivd	d16, d17, d16
	fstd	d16, [fp, #-76]
	ldr	r0, .L43+88
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L44:
	.align	3
.L43:
	.word	0
	.word	1093567616
	.word	1092616192
	.word	1065353216
	.word	1091567616
	.word	1090519040
	.word	1088421888
	.word	1086324736
	.word	1084227584
	.word	1082130432
	.word	1077936128
	.word	1073741824
	.word	.LC1
	.word	0
	.word	input_norm
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	output_norm
	.word	.LC0
	.word	.LC6
	.word	.LC7
	.size	main, .-main
	.comm	input_norm,4,4
	.comm	output_norm,4,4
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
