	.cpu cortex-m4
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"sensirion_common.c"
	.text
.Ltext0:
	.section	.text.sensirion_common_bytes_to_uint16_t,"ax",%progbits
	.align	1
	.global	sensirion_common_bytes_to_uint16_t
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sensirion_common_bytes_to_uint16_t, %function
sensirion_common_bytes_to_uint16_t:
.LFB0:
	.file 1 "D:\\zepyth\\nRF5_SDK_17.0.2_d674dde\\examples\\ble_peripheral\\ble_app_blinky_k5\\sensirion_common.c"
	.loc 1 35 67
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI0:
	str	r0, [sp, #4]
	.loc 1 36 27
	ldr	r3, [sp, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 36 31
	lsls	r3, r3, #8
	.loc 1 36 36
	sxth	r2, r3
	.loc 1 36 53
	ldr	r3, [sp, #4]
	adds	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	sxth	r3, r3
	.loc 1 36 36
	orrs	r3, r3, r2
	sxth	r3, r3
	uxth	r3, r3
	.loc 1 37 1
	mov	r0, r3
	add	sp, sp, #8
.LCFI1:
	@ sp needed
	bx	lr
.LFE0:
	.size	sensirion_common_bytes_to_uint16_t, .-sensirion_common_bytes_to_uint16_t
	.section	.text.sensirion_common_bytes_to_uint32_t,"ax",%progbits
	.align	1
	.global	sensirion_common_bytes_to_uint32_t
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sensirion_common_bytes_to_uint32_t, %function
sensirion_common_bytes_to_uint32_t:
.LFB1:
	.loc 1 39 67
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI2:
	str	r0, [sp, #4]
	.loc 1 40 27
	ldr	r3, [sp, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 40 31
	lsls	r2, r3, #24
	.loc 1 40 54
	ldr	r3, [sp, #4]
	adds	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 40 58
	lsls	r3, r3, #16
	.loc 1 40 37
	orrs	r2, r2, r3
	.loc 1 41 27
	ldr	r3, [sp, #4]
	adds	r3, r3, #2
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 41 31
	lsls	r3, r3, #8
	.loc 1 40 64
	orrs	r3, r3, r2
	.loc 1 41 53
	ldr	r2, [sp, #4]
	adds	r2, r2, #3
	ldrb	r2, [r2]	@ zero_extendqisi2
	.loc 1 41 36
	orrs	r3, r3, r2
	.loc 1 42 1
	mov	r0, r3
	add	sp, sp, #8
.LCFI3:
	@ sp needed
	bx	lr
.LFE1:
	.size	sensirion_common_bytes_to_uint32_t, .-sensirion_common_bytes_to_uint32_t
	.section	.text.sensirion_common_bytes_to_int16_t,"ax",%progbits
	.align	1
	.global	sensirion_common_bytes_to_int16_t
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sensirion_common_bytes_to_int16_t, %function
sensirion_common_bytes_to_int16_t:
.LFB2:
	.loc 1 44 65
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI4:
	sub	sp, sp, #12
.LCFI5:
	str	r0, [sp, #4]
	.loc 1 45 21
	ldr	r0, [sp, #4]
	bl	sensirion_common_bytes_to_uint16_t
	mov	r3, r0
	.loc 1 45 12
	sxth	r3, r3
	.loc 1 46 1
	mov	r0, r3
	add	sp, sp, #12
.LCFI6:
	@ sp needed
	ldr	pc, [sp], #4
.LFE2:
	.size	sensirion_common_bytes_to_int16_t, .-sensirion_common_bytes_to_int16_t
	.section	.text.sensirion_common_bytes_to_int32_t,"ax",%progbits
	.align	1
	.global	sensirion_common_bytes_to_int32_t
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sensirion_common_bytes_to_int32_t, %function
sensirion_common_bytes_to_int32_t:
.LFB3:
	.loc 1 48 65
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI7:
	sub	sp, sp, #12
.LCFI8:
	str	r0, [sp, #4]
	.loc 1 49 21
	ldr	r0, [sp, #4]
	bl	sensirion_common_bytes_to_uint32_t
	mov	r3, r0
	.loc 1 50 1
	mov	r0, r3
	add	sp, sp, #12
.LCFI9:
	@ sp needed
	ldr	pc, [sp], #4
.LFE3:
	.size	sensirion_common_bytes_to_int32_t, .-sensirion_common_bytes_to_int32_t
	.section	.text.sensirion_common_bytes_to_float,"ax",%progbits
	.align	1
	.global	sensirion_common_bytes_to_float
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sensirion_common_bytes_to_float, %function
sensirion_common_bytes_to_float:
.LFB4:
	.loc 1 52 61
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI10:
	sub	sp, sp, #20
.LCFI11:
	str	r0, [sp, #4]
	.loc 1 58 21
	ldr	r0, [sp, #4]
	bl	sensirion_common_bytes_to_uint32_t
	mov	r3, r0
	.loc 1 58 19
	str	r3, [sp, #12]
	.loc 1 59 15
	ldr	r3, [sp, #12]	@ float
	.loc 1 60 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI12:
	@ sp needed
	ldr	pc, [sp], #4
.LFE4:
	.size	sensirion_common_bytes_to_float, .-sensirion_common_bytes_to_float
	.section	.text.sensirion_common_uint32_t_to_bytes,"ax",%progbits
	.align	1
	.global	sensirion_common_uint32_t_to_bytes
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sensirion_common_uint32_t_to_bytes, %function
sensirion_common_uint32_t_to_bytes:
.LFB5:
	.loc 1 62 79
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI13:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 63 22
	ldr	r3, [sp, #4]
	lsrs	r3, r3, #24
	.loc 1 63 14
	uxtb	r2, r3
	ldr	r3, [sp]
	strb	r2, [r3]
	.loc 1 64 22
	ldr	r3, [sp, #4]
	lsrs	r2, r3, #16
	.loc 1 64 10
	ldr	r3, [sp]
	adds	r3, r3, #1
	.loc 1 64 14
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 65 22
	ldr	r3, [sp, #4]
	lsrs	r2, r3, #8
	.loc 1 65 10
	ldr	r3, [sp]
	adds	r3, r3, #2
	.loc 1 65 14
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 66 10
	ldr	r3, [sp]
	adds	r3, r3, #3
	.loc 1 66 14
	ldr	r2, [sp, #4]
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 67 1
	nop
	add	sp, sp, #8
.LCFI14:
	@ sp needed
	bx	lr
.LFE5:
	.size	sensirion_common_uint32_t_to_bytes, .-sensirion_common_uint32_t_to_bytes
	.section	.text.sensirion_common_uint16_t_to_bytes,"ax",%progbits
	.align	1
	.global	sensirion_common_uint16_t_to_bytes
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sensirion_common_uint16_t_to_bytes, %function
sensirion_common_uint16_t_to_bytes:
.LFB6:
	.loc 1 69 79
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI15:
	mov	r3, r0
	str	r1, [sp]
	strh	r3, [sp, #6]	@ movhi
	.loc 1 70 14
	ldrh	r3, [sp, #6]
	lsrs	r3, r3, #8
	uxth	r3, r3
	uxtb	r2, r3
	ldr	r3, [sp]
	strb	r2, [r3]
	.loc 1 71 10
	ldr	r3, [sp]
	adds	r3, r3, #1
	.loc 1 71 14
	ldrh	r2, [sp, #6]	@ movhi
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 72 1
	nop
	add	sp, sp, #8
.LCFI16:
	@ sp needed
	bx	lr
.LFE6:
	.size	sensirion_common_uint16_t_to_bytes, .-sensirion_common_uint16_t_to_bytes
	.section	.text.sensirion_common_int32_t_to_bytes,"ax",%progbits
	.align	1
	.global	sensirion_common_int32_t_to_bytes
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sensirion_common_int32_t_to_bytes, %function
sensirion_common_int32_t_to_bytes:
.LFB7:
	.loc 1 74 77
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI17:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 75 22
	ldr	r3, [sp, #4]
	asrs	r3, r3, #24
	.loc 1 75 14
	uxtb	r2, r3
	ldr	r3, [sp]
	strb	r2, [r3]
	.loc 1 76 22
	ldr	r3, [sp, #4]
	asrs	r2, r3, #16
	.loc 1 76 10
	ldr	r3, [sp]
	adds	r3, r3, #1
	.loc 1 76 14
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 77 22
	ldr	r3, [sp, #4]
	asrs	r2, r3, #8
	.loc 1 77 10
	ldr	r3, [sp]
	adds	r3, r3, #2
	.loc 1 77 14
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 78 10
	ldr	r3, [sp]
	adds	r3, r3, #3
	.loc 1 78 14
	ldr	r2, [sp, #4]
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 79 1
	nop
	add	sp, sp, #8
.LCFI18:
	@ sp needed
	bx	lr
.LFE7:
	.size	sensirion_common_int32_t_to_bytes, .-sensirion_common_int32_t_to_bytes
	.section	.text.sensirion_common_int16_t_to_bytes,"ax",%progbits
	.align	1
	.global	sensirion_common_int16_t_to_bytes
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sensirion_common_int16_t_to_bytes, %function
sensirion_common_int16_t_to_bytes:
.LFB8:
	.loc 1 81 77
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI19:
	mov	r3, r0
	str	r1, [sp]
	strh	r3, [sp, #6]	@ movhi
	.loc 1 82 14
	ldrsh	r3, [sp, #6]
	asrs	r3, r3, #8
	sxth	r3, r3
	uxtb	r2, r3
	ldr	r3, [sp]
	strb	r2, [r3]
	.loc 1 83 10
	ldr	r3, [sp]
	adds	r3, r3, #1
	.loc 1 83 14
	ldrh	r2, [sp, #6]	@ movhi
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 84 1
	nop
	add	sp, sp, #8
.LCFI20:
	@ sp needed
	bx	lr
.LFE8:
	.size	sensirion_common_int16_t_to_bytes, .-sensirion_common_int16_t_to_bytes
	.section	.text.sensirion_common_float_to_bytes,"ax",%progbits
	.align	1
	.global	sensirion_common_float_to_bytes
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sensirion_common_float_to_bytes, %function
sensirion_common_float_to_bytes:
.LFB9:
	.loc 1 86 73
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI21:
	sub	sp, sp, #20
.LCFI22:
	str	r0, [sp, #4]	@ float
	str	r1, [sp]
	.loc 1 91 17
	ldr	r3, [sp, #4]	@ float
	str	r3, [sp, #12]	@ float
	.loc 1 92 5
	ldr	r3, [sp, #12]
	ldr	r1, [sp]
	mov	r0, r3
	bl	sensirion_common_uint32_t_to_bytes
	.loc 1 93 1
	nop
	add	sp, sp, #20
.LCFI23:
	@ sp needed
	ldr	pc, [sp], #4
.LFE9:
	.size	sensirion_common_float_to_bytes, .-sensirion_common_float_to_bytes
	.section	.text.sensirion_common_copy_bytes,"ax",%progbits
	.align	1
	.global	sensirion_common_copy_bytes
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sensirion_common_copy_bytes, %function
sensirion_common_copy_bytes:
.LFB10:
	.loc 1 96 56
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #24
.LCFI24:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	mov	r3, r2
	strh	r3, [sp, #6]	@ movhi
	.loc 1 98 12
	movs	r3, #0
	strh	r3, [sp, #22]	@ movhi
	.loc 1 98 5
	b	.L17
.L18:
	.loc 1 99 32 discriminator 3
	ldrh	r3, [sp, #22]
	ldr	r2, [sp, #12]
	add	r2, r2, r3
	.loc 1 99 20 discriminator 3
	ldrh	r3, [sp, #22]
	ldr	r1, [sp, #8]
	add	r3, r3, r1
	.loc 1 99 32 discriminator 3
	ldrb	r2, [r2]	@ zero_extendqisi2
	.loc 1 99 24 discriminator 3
	strb	r2, [r3]
	.loc 1 98 35 discriminator 3
	ldrh	r3, [sp, #22]
	adds	r3, r3, #1
	strh	r3, [sp, #22]	@ movhi
.L17:
	.loc 1 98 5 discriminator 1
	ldrh	r2, [sp, #22]
	ldrh	r3, [sp, #6]
	cmp	r2, r3
	bcc	.L18
	.loc 1 101 1
	nop
	nop
	add	sp, sp, #24
.LCFI25:
	@ sp needed
	bx	lr
.LFE10:
	.size	sensirion_common_copy_bytes, .-sensirion_common_copy_bytes
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI2-.LFB1
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI4-.LFB2
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI7-.LFB3
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI10-.LFB4
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI13-.LFB5
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI15-.LFB6
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI17-.LFB7
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI19-.LFB8
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI21-.LFB9
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI24-.LFB10
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE20:
	.text
.Letext0:
	.file 2 "D:/sse/include/stdint.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x363
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF650
	.byte	0xc
	.4byte	.LASF651
	.4byte	.LASF652
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF617
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF618
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF619
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF620
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF621
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF622
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF623
	.uleb128 0x4
	.4byte	.LASF624
	.byte	0x2
	.byte	0x2a
	.byte	0x1c
	.4byte	0x45
	.uleb128 0x5
	.4byte	0x61
	.uleb128 0x4
	.4byte	.LASF625
	.byte	0x2
	.byte	0x2f
	.byte	0x1c
	.4byte	0x83
	.uleb128 0x5
	.4byte	0x72
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF626
	.uleb128 0x4
	.4byte	.LASF627
	.byte	0x2
	.byte	0x30
	.byte	0x1c
	.4byte	0x4c
	.uleb128 0x5
	.4byte	0x8a
	.uleb128 0x4
	.4byte	.LASF628
	.byte	0x2
	.byte	0x36
	.byte	0x1c
	.4byte	0x29
	.uleb128 0x5
	.4byte	0x9b
	.uleb128 0x4
	.4byte	.LASF629
	.byte	0x2
	.byte	0x37
	.byte	0x1c
	.4byte	0x3e
	.uleb128 0x5
	.4byte	0xac
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF630
	.uleb128 0x6
	.4byte	.LASF634
	.byte	0x1
	.byte	0x5f
	.byte	0x6
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x115
	.uleb128 0x7
	.4byte	.LASF631
	.byte	0x1
	.byte	0x5f
	.byte	0x31
	.4byte	0x115
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x7
	.4byte	.LASF632
	.byte	0x1
	.byte	0x5f
	.byte	0x42
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x7
	.4byte	.LASF633
	.byte	0x1
	.byte	0x60
	.byte	0x2b
	.4byte	0x8a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x8
	.ascii	"i\000"
	.byte	0x1
	.byte	0x61
	.byte	0xe
	.4byte	0x8a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -2
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x6d
	.uleb128 0x9
	.byte	0x4
	.4byte	0x61
	.uleb128 0xa
	.4byte	.LASF635
	.byte	0x1
	.byte	0x56
	.byte	0x6
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x187
	.uleb128 0x7
	.4byte	.LASF636
	.byte	0x1
	.byte	0x56
	.byte	0x32
	.4byte	0x18e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x7
	.4byte	.LASF637
	.byte	0x1
	.byte	0x56
	.byte	0x42
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.byte	0x4
	.byte	0x1
	.byte	0x57
	.byte	0x5
	.4byte	0x177
	.uleb128 0xc
	.4byte	.LASF638
	.byte	0x1
	.byte	0x58
	.byte	0x12
	.4byte	0xac
	.uleb128 0xc
	.4byte	.LASF639
	.byte	0x1
	.byte	0x59
	.byte	0xf
	.4byte	0x187
	.byte	0
	.uleb128 0x8
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	0x155
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF640
	.uleb128 0x5
	.4byte	0x187
	.uleb128 0x6
	.4byte	.LASF641
	.byte	0x1
	.byte	0x51
	.byte	0x6
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1c8
	.uleb128 0x7
	.4byte	.LASF636
	.byte	0x1
	.byte	0x51
	.byte	0x36
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -2
	.uleb128 0x7
	.4byte	.LASF637
	.byte	0x1
	.byte	0x51
	.byte	0x46
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x6
	.4byte	.LASF642
	.byte	0x1
	.byte	0x4a
	.byte	0x6
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1fd
	.uleb128 0x7
	.4byte	.LASF636
	.byte	0x1
	.byte	0x4a
	.byte	0x36
	.4byte	0xa7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x7
	.4byte	.LASF637
	.byte	0x1
	.byte	0x4a
	.byte	0x46
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x6
	.4byte	.LASF643
	.byte	0x1
	.byte	0x45
	.byte	0x6
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x232
	.uleb128 0x7
	.4byte	.LASF636
	.byte	0x1
	.byte	0x45
	.byte	0x38
	.4byte	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -2
	.uleb128 0x7
	.4byte	.LASF637
	.byte	0x1
	.byte	0x45
	.byte	0x48
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x6
	.4byte	.LASF644
	.byte	0x1
	.byte	0x3e
	.byte	0x6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x267
	.uleb128 0x7
	.4byte	.LASF636
	.byte	0x1
	.byte	0x3e
	.byte	0x38
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x7
	.4byte	.LASF637
	.byte	0x1
	.byte	0x3e
	.byte	0x48
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0xd
	.4byte	.LASF645
	.byte	0x1
	.byte	0x34
	.byte	0x7
	.4byte	0x187
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2c2
	.uleb128 0x7
	.4byte	.LASF637
	.byte	0x1
	.byte	0x34
	.byte	0x36
	.4byte	0x115
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xb
	.byte	0x4
	.byte	0x1
	.byte	0x35
	.byte	0x5
	.4byte	0x2b2
	.uleb128 0xc
	.4byte	.LASF638
	.byte	0x1
	.byte	0x36
	.byte	0x12
	.4byte	0xac
	.uleb128 0xc
	.4byte	.LASF639
	.byte	0x1
	.byte	0x37
	.byte	0xf
	.4byte	0x187
	.byte	0
	.uleb128 0x8
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0x38
	.byte	0x7
	.4byte	0x290
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.4byte	.LASF646
	.byte	0x1
	.byte	0x30
	.byte	0x9
	.4byte	0x9b
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2ec
	.uleb128 0x7
	.4byte	.LASF637
	.byte	0x1
	.byte	0x30
	.byte	0x3a
	.4byte	0x115
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.4byte	.LASF647
	.byte	0x1
	.byte	0x2c
	.byte	0x9
	.4byte	0x72
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x316
	.uleb128 0x7
	.4byte	.LASF637
	.byte	0x1
	.byte	0x2c
	.byte	0x3a
	.4byte	0x115
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xe
	.4byte	.LASF648
	.byte	0x1
	.byte	0x27
	.byte	0xa
	.4byte	0xac
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x340
	.uleb128 0x7
	.4byte	.LASF637
	.byte	0x1
	.byte	0x27
	.byte	0x3c
	.4byte	0x115
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xf
	.4byte	.LASF649
	.byte	0x1
	.byte	0x23
	.byte	0xa
	.4byte	0x8a
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	.LASF637
	.byte	0x1
	.byte	0x23
	.byte	0x3c
	.4byte	0x115
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x2134
	.uleb128 0x19
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x2119
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x1aa
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x367
	.4byte	0xc4
	.ascii	"sensirion_common_copy_bytes\000"
	.4byte	0x121
	.ascii	"sensirion_common_float_to_bytes\000"
	.4byte	0x193
	.ascii	"sensirion_common_int16_t_to_bytes\000"
	.4byte	0x1c8
	.ascii	"sensirion_common_int32_t_to_bytes\000"
	.4byte	0x1fd
	.ascii	"sensirion_common_uint16_t_to_bytes\000"
	.4byte	0x232
	.ascii	"sensirion_common_uint32_t_to_bytes\000"
	.4byte	0x267
	.ascii	"sensirion_common_bytes_to_float\000"
	.4byte	0x2c2
	.ascii	"sensirion_common_bytes_to_int32_t\000"
	.4byte	0x2ec
	.ascii	"sensirion_common_bytes_to_int16_t\000"
	.4byte	0x316
	.ascii	"sensirion_common_bytes_to_uint32_t\000"
	.4byte	0x340
	.ascii	"sensirion_common_bytes_to_uint16_t\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xf9
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x367
	.4byte	0x29
	.ascii	"int\000"
	.4byte	0x30
	.ascii	"long int\000"
	.4byte	0x37
	.ascii	"char\000"
	.4byte	0x3e
	.ascii	"unsigned int\000"
	.4byte	0x45
	.ascii	"unsigned char\000"
	.4byte	0x4c
	.ascii	"short unsigned int\000"
	.4byte	0x53
	.ascii	"long long int\000"
	.4byte	0x5a
	.ascii	"signed char\000"
	.4byte	0x61
	.ascii	"uint8_t\000"
	.4byte	0x83
	.ascii	"short int\000"
	.4byte	0x72
	.ascii	"int16_t\000"
	.4byte	0x8a
	.ascii	"uint16_t\000"
	.4byte	0x9b
	.ascii	"int32_t\000"
	.4byte	0xac
	.ascii	"uint32_t\000"
	.4byte	0xbd
	.ascii	"long long unsigned int\000"
	.4byte	0x187
	.ascii	"float\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x6c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LFB7
	.4byte	.LFE7
	.4byte	.LFB8
	.4byte	.LFE8
	.4byte	.LFB9
	.4byte	.LFE9
	.4byte	.LFB10
	.4byte	.LFE10
	.4byte	0
	.4byte	0
	.section	.debug_macro,"",%progbits
.Ldebug_macro0:
	.2byte	0x4
	.byte	0x2
	.4byte	.Ldebug_line0
	.byte	0x7
	.4byte	.Ldebug_macro2
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.file 3 "D:\\zepyth\\nRF5_SDK_17.0.2_d674dde\\examples\\ble_peripheral\\ble_app_blinky_k5\\sensirion_common.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x3
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF462
	.file 4 "D:\\zepyth\\nRF5_SDK_17.0.2_d674dde\\examples\\ble_peripheral\\ble_app_blinky_k5\\sensirion_config.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x4
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF463
	.file 5 "D:/sse/include/stdlib.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF464
	.file 6 "D:/sse/include/__crossworks.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x6
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro4
	.byte	0x4
	.byte	0x3
	.uleb128 0x33
	.uleb128 0x2
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.file 7 "D:/sse/include/stdbool.h"
	.byte	0x3
	.uleb128 0x4b
	.uleb128 0x7
	.byte	0x7
	.4byte	.Ldebug_macro6
	.byte	0x4
	.byte	0x4
	.file 8 "../../../../../../components/libraries/util/nordic_common.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x8
	.byte	0x7
	.4byte	.Ldebug_macro7
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro8
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.0.af016d4e592d178661922af4efbfa820,comdat
.Ldebug_macro2:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF1
	.byte	0x5
	.uleb128 0
	.4byte	.LASF2
	.byte	0x5
	.uleb128 0
	.4byte	.LASF3
	.byte	0x5
	.uleb128 0
	.4byte	.LASF4
	.byte	0x5
	.uleb128 0
	.4byte	.LASF5
	.byte	0x5
	.uleb128 0
	.4byte	.LASF6
	.byte	0x5
	.uleb128 0
	.4byte	.LASF7
	.byte	0x5
	.uleb128 0
	.4byte	.LASF8
	.byte	0x5
	.uleb128 0
	.4byte	.LASF9
	.byte	0x5
	.uleb128 0
	.4byte	.LASF10
	.byte	0x5
	.uleb128 0
	.4byte	.LASF11
	.byte	0x5
	.uleb128 0
	.4byte	.LASF12
	.byte	0x5
	.uleb128 0
	.4byte	.LASF13
	.byte	0x5
	.uleb128 0
	.4byte	.LASF14
	.byte	0x5
	.uleb128 0
	.4byte	.LASF15
	.byte	0x5
	.uleb128 0
	.4byte	.LASF16
	.byte	0x5
	.uleb128 0
	.4byte	.LASF17
	.byte	0x5
	.uleb128 0
	.4byte	.LASF18
	.byte	0x5
	.uleb128 0
	.4byte	.LASF19
	.byte	0x5
	.uleb128 0
	.4byte	.LASF20
	.byte	0x5
	.uleb128 0
	.4byte	.LASF21
	.byte	0x5
	.uleb128 0
	.4byte	.LASF22
	.byte	0x5
	.uleb128 0
	.4byte	.LASF23
	.byte	0x5
	.uleb128 0
	.4byte	.LASF24
	.byte	0x5
	.uleb128 0
	.4byte	.LASF25
	.byte	0x5
	.uleb128 0
	.4byte	.LASF26
	.byte	0x5
	.uleb128 0
	.4byte	.LASF27
	.byte	0x5
	.uleb128 0
	.4byte	.LASF28
	.byte	0x5
	.uleb128 0
	.4byte	.LASF29
	.byte	0x5
	.uleb128 0
	.4byte	.LASF30
	.byte	0x5
	.uleb128 0
	.4byte	.LASF31
	.byte	0x5
	.uleb128 0
	.4byte	.LASF32
	.byte	0x5
	.uleb128 0
	.4byte	.LASF33
	.byte	0x5
	.uleb128 0
	.4byte	.LASF34
	.byte	0x5
	.uleb128 0
	.4byte	.LASF35
	.byte	0x5
	.uleb128 0
	.4byte	.LASF36
	.byte	0x5
	.uleb128 0
	.4byte	.LASF37
	.byte	0x5
	.uleb128 0
	.4byte	.LASF38
	.byte	0x5
	.uleb128 0
	.4byte	.LASF39
	.byte	0x5
	.uleb128 0
	.4byte	.LASF40
	.byte	0x5
	.uleb128 0
	.4byte	.LASF41
	.byte	0x5
	.uleb128 0
	.4byte	.LASF42
	.byte	0x5
	.uleb128 0
	.4byte	.LASF43
	.byte	0x5
	.uleb128 0
	.4byte	.LASF44
	.byte	0x5
	.uleb128 0
	.4byte	.LASF45
	.byte	0x5
	.uleb128 0
	.4byte	.LASF46
	.byte	0x5
	.uleb128 0
	.4byte	.LASF47
	.byte	0x5
	.uleb128 0
	.4byte	.LASF48
	.byte	0x5
	.uleb128 0
	.4byte	.LASF49
	.byte	0x5
	.uleb128 0
	.4byte	.LASF50
	.byte	0x5
	.uleb128 0
	.4byte	.LASF51
	.byte	0x5
	.uleb128 0
	.4byte	.LASF52
	.byte	0x5
	.uleb128 0
	.4byte	.LASF53
	.byte	0x5
	.uleb128 0
	.4byte	.LASF54
	.byte	0x5
	.uleb128 0
	.4byte	.LASF55
	.byte	0x5
	.uleb128 0
	.4byte	.LASF56
	.byte	0x5
	.uleb128 0
	.4byte	.LASF57
	.byte	0x5
	.uleb128 0
	.4byte	.LASF58
	.byte	0x5
	.uleb128 0
	.4byte	.LASF59
	.byte	0x5
	.uleb128 0
	.4byte	.LASF60
	.byte	0x5
	.uleb128 0
	.4byte	.LASF61
	.byte	0x5
	.uleb128 0
	.4byte	.LASF62
	.byte	0x5
	.uleb128 0
	.4byte	.LASF63
	.byte	0x5
	.uleb128 0
	.4byte	.LASF64
	.byte	0x5
	.uleb128 0
	.4byte	.LASF65
	.byte	0x5
	.uleb128 0
	.4byte	.LASF66
	.byte	0x5
	.uleb128 0
	.4byte	.LASF67
	.byte	0x5
	.uleb128 0
	.4byte	.LASF68
	.byte	0x5
	.uleb128 0
	.4byte	.LASF69
	.byte	0x5
	.uleb128 0
	.4byte	.LASF70
	.byte	0x5
	.uleb128 0
	.4byte	.LASF71
	.byte	0x5
	.uleb128 0
	.4byte	.LASF72
	.byte	0x5
	.uleb128 0
	.4byte	.LASF73
	.byte	0x5
	.uleb128 0
	.4byte	.LASF74
	.byte	0x5
	.uleb128 0
	.4byte	.LASF75
	.byte	0x5
	.uleb128 0
	.4byte	.LASF76
	.byte	0x5
	.uleb128 0
	.4byte	.LASF77
	.byte	0x5
	.uleb128 0
	.4byte	.LASF78
	.byte	0x5
	.uleb128 0
	.4byte	.LASF79
	.byte	0x5
	.uleb128 0
	.4byte	.LASF80
	.byte	0x5
	.uleb128 0
	.4byte	.LASF81
	.byte	0x5
	.uleb128 0
	.4byte	.LASF82
	.byte	0x5
	.uleb128 0
	.4byte	.LASF83
	.byte	0x5
	.uleb128 0
	.4byte	.LASF84
	.byte	0x5
	.uleb128 0
	.4byte	.LASF85
	.byte	0x5
	.uleb128 0
	.4byte	.LASF86
	.byte	0x5
	.uleb128 0
	.4byte	.LASF87
	.byte	0x5
	.uleb128 0
	.4byte	.LASF88
	.byte	0x5
	.uleb128 0
	.4byte	.LASF89
	.byte	0x5
	.uleb128 0
	.4byte	.LASF90
	.byte	0x5
	.uleb128 0
	.4byte	.LASF91
	.byte	0x5
	.uleb128 0
	.4byte	.LASF92
	.byte	0x5
	.uleb128 0
	.4byte	.LASF93
	.byte	0x5
	.uleb128 0
	.4byte	.LASF94
	.byte	0x5
	.uleb128 0
	.4byte	.LASF95
	.byte	0x5
	.uleb128 0
	.4byte	.LASF96
	.byte	0x5
	.uleb128 0
	.4byte	.LASF97
	.byte	0x5
	.uleb128 0
	.4byte	.LASF98
	.byte	0x5
	.uleb128 0
	.4byte	.LASF99
	.byte	0x5
	.uleb128 0
	.4byte	.LASF100
	.byte	0x5
	.uleb128 0
	.4byte	.LASF101
	.byte	0x5
	.uleb128 0
	.4byte	.LASF102
	.byte	0x5
	.uleb128 0
	.4byte	.LASF103
	.byte	0x5
	.uleb128 0
	.4byte	.LASF104
	.byte	0x5
	.uleb128 0
	.4byte	.LASF105
	.byte	0x5
	.uleb128 0
	.4byte	.LASF106
	.byte	0x5
	.uleb128 0
	.4byte	.LASF107
	.byte	0x5
	.uleb128 0
	.4byte	.LASF108
	.byte	0x5
	.uleb128 0
	.4byte	.LASF109
	.byte	0x5
	.uleb128 0
	.4byte	.LASF110
	.byte	0x5
	.uleb128 0
	.4byte	.LASF111
	.byte	0x5
	.uleb128 0
	.4byte	.LASF112
	.byte	0x5
	.uleb128 0
	.4byte	.LASF113
	.byte	0x5
	.uleb128 0
	.4byte	.LASF114
	.byte	0x5
	.uleb128 0
	.4byte	.LASF115
	.byte	0x5
	.uleb128 0
	.4byte	.LASF116
	.byte	0x5
	.uleb128 0
	.4byte	.LASF117
	.byte	0x5
	.uleb128 0
	.4byte	.LASF118
	.byte	0x5
	.uleb128 0
	.4byte	.LASF119
	.byte	0x5
	.uleb128 0
	.4byte	.LASF120
	.byte	0x5
	.uleb128 0
	.4byte	.LASF121
	.byte	0x5
	.uleb128 0
	.4byte	.LASF122
	.byte	0x5
	.uleb128 0
	.4byte	.LASF123
	.byte	0x5
	.uleb128 0
	.4byte	.LASF124
	.byte	0x5
	.uleb128 0
	.4byte	.LASF125
	.byte	0x5
	.uleb128 0
	.4byte	.LASF126
	.byte	0x5
	.uleb128 0
	.4byte	.LASF127
	.byte	0x5
	.uleb128 0
	.4byte	.LASF128
	.byte	0x5
	.uleb128 0
	.4byte	.LASF129
	.byte	0x5
	.uleb128 0
	.4byte	.LASF130
	.byte	0x5
	.uleb128 0
	.4byte	.LASF131
	.byte	0x5
	.uleb128 0
	.4byte	.LASF132
	.byte	0x5
	.uleb128 0
	.4byte	.LASF133
	.byte	0x5
	.uleb128 0
	.4byte	.LASF134
	.byte	0x5
	.uleb128 0
	.4byte	.LASF135
	.byte	0x5
	.uleb128 0
	.4byte	.LASF136
	.byte	0x5
	.uleb128 0
	.4byte	.LASF137
	.byte	0x5
	.uleb128 0
	.4byte	.LASF138
	.byte	0x5
	.uleb128 0
	.4byte	.LASF139
	.byte	0x5
	.uleb128 0
	.4byte	.LASF140
	.byte	0x5
	.uleb128 0
	.4byte	.LASF141
	.byte	0x5
	.uleb128 0
	.4byte	.LASF142
	.byte	0x5
	.uleb128 0
	.4byte	.LASF143
	.byte	0x5
	.uleb128 0
	.4byte	.LASF144
	.byte	0x5
	.uleb128 0
	.4byte	.LASF145
	.byte	0x5
	.uleb128 0
	.4byte	.LASF146
	.byte	0x5
	.uleb128 0
	.4byte	.LASF147
	.byte	0x5
	.uleb128 0
	.4byte	.LASF148
	.byte	0x5
	.uleb128 0
	.4byte	.LASF149
	.byte	0x5
	.uleb128 0
	.4byte	.LASF150
	.byte	0x5
	.uleb128 0
	.4byte	.LASF151
	.byte	0x5
	.uleb128 0
	.4byte	.LASF152
	.byte	0x5
	.uleb128 0
	.4byte	.LASF153
	.byte	0x5
	.uleb128 0
	.4byte	.LASF154
	.byte	0x5
	.uleb128 0
	.4byte	.LASF155
	.byte	0x5
	.uleb128 0
	.4byte	.LASF156
	.byte	0x5
	.uleb128 0
	.4byte	.LASF157
	.byte	0x5
	.uleb128 0
	.4byte	.LASF158
	.byte	0x5
	.uleb128 0
	.4byte	.LASF159
	.byte	0x5
	.uleb128 0
	.4byte	.LASF160
	.byte	0x5
	.uleb128 0
	.4byte	.LASF161
	.byte	0x5
	.uleb128 0
	.4byte	.LASF162
	.byte	0x5
	.uleb128 0
	.4byte	.LASF163
	.byte	0x5
	.uleb128 0
	.4byte	.LASF164
	.byte	0x5
	.uleb128 0
	.4byte	.LASF165
	.byte	0x5
	.uleb128 0
	.4byte	.LASF166
	.byte	0x5
	.uleb128 0
	.4byte	.LASF167
	.byte	0x5
	.uleb128 0
	.4byte	.LASF168
	.byte	0x5
	.uleb128 0
	.4byte	.LASF169
	.byte	0x5
	.uleb128 0
	.4byte	.LASF170
	.byte	0x5
	.uleb128 0
	.4byte	.LASF171
	.byte	0x5
	.uleb128 0
	.4byte	.LASF172
	.byte	0x5
	.uleb128 0
	.4byte	.LASF173
	.byte	0x5
	.uleb128 0
	.4byte	.LASF174
	.byte	0x5
	.uleb128 0
	.4byte	.LASF175
	.byte	0x5
	.uleb128 0
	.4byte	.LASF176
	.byte	0x5
	.uleb128 0
	.4byte	.LASF177
	.byte	0x5
	.uleb128 0
	.4byte	.LASF178
	.byte	0x5
	.uleb128 0
	.4byte	.LASF179
	.byte	0x5
	.uleb128 0
	.4byte	.LASF180
	.byte	0x5
	.uleb128 0
	.4byte	.LASF181
	.byte	0x5
	.uleb128 0
	.4byte	.LASF182
	.byte	0x5
	.uleb128 0
	.4byte	.LASF183
	.byte	0x5
	.uleb128 0
	.4byte	.LASF184
	.byte	0x5
	.uleb128 0
	.4byte	.LASF185
	.byte	0x5
	.uleb128 0
	.4byte	.LASF186
	.byte	0x5
	.uleb128 0
	.4byte	.LASF187
	.byte	0x5
	.uleb128 0
	.4byte	.LASF188
	.byte	0x5
	.uleb128 0
	.4byte	.LASF189
	.byte	0x5
	.uleb128 0
	.4byte	.LASF190
	.byte	0x5
	.uleb128 0
	.4byte	.LASF191
	.byte	0x5
	.uleb128 0
	.4byte	.LASF192
	.byte	0x5
	.uleb128 0
	.4byte	.LASF193
	.byte	0x5
	.uleb128 0
	.4byte	.LASF194
	.byte	0x5
	.uleb128 0
	.4byte	.LASF195
	.byte	0x5
	.uleb128 0
	.4byte	.LASF196
	.byte	0x5
	.uleb128 0
	.4byte	.LASF197
	.byte	0x5
	.uleb128 0
	.4byte	.LASF198
	.byte	0x5
	.uleb128 0
	.4byte	.LASF199
	.byte	0x5
	.uleb128 0
	.4byte	.LASF200
	.byte	0x5
	.uleb128 0
	.4byte	.LASF201
	.byte	0x5
	.uleb128 0
	.4byte	.LASF202
	.byte	0x5
	.uleb128 0
	.4byte	.LASF203
	.byte	0x5
	.uleb128 0
	.4byte	.LASF204
	.byte	0x5
	.uleb128 0
	.4byte	.LASF205
	.byte	0x5
	.uleb128 0
	.4byte	.LASF206
	.byte	0x5
	.uleb128 0
	.4byte	.LASF207
	.byte	0x5
	.uleb128 0
	.4byte	.LASF208
	.byte	0x5
	.uleb128 0
	.4byte	.LASF209
	.byte	0x5
	.uleb128 0
	.4byte	.LASF210
	.byte	0x5
	.uleb128 0
	.4byte	.LASF211
	.byte	0x5
	.uleb128 0
	.4byte	.LASF212
	.byte	0x5
	.uleb128 0
	.4byte	.LASF213
	.byte	0x5
	.uleb128 0
	.4byte	.LASF214
	.byte	0x5
	.uleb128 0
	.4byte	.LASF215
	.byte	0x5
	.uleb128 0
	.4byte	.LASF216
	.byte	0x5
	.uleb128 0
	.4byte	.LASF217
	.byte	0x5
	.uleb128 0
	.4byte	.LASF218
	.byte	0x5
	.uleb128 0
	.4byte	.LASF219
	.byte	0x5
	.uleb128 0
	.4byte	.LASF220
	.byte	0x5
	.uleb128 0
	.4byte	.LASF221
	.byte	0x5
	.uleb128 0
	.4byte	.LASF222
	.byte	0x5
	.uleb128 0
	.4byte	.LASF223
	.byte	0x5
	.uleb128 0
	.4byte	.LASF224
	.byte	0x5
	.uleb128 0
	.4byte	.LASF225
	.byte	0x5
	.uleb128 0
	.4byte	.LASF226
	.byte	0x5
	.uleb128 0
	.4byte	.LASF227
	.byte	0x5
	.uleb128 0
	.4byte	.LASF228
	.byte	0x5
	.uleb128 0
	.4byte	.LASF229
	.byte	0x5
	.uleb128 0
	.4byte	.LASF230
	.byte	0x5
	.uleb128 0
	.4byte	.LASF231
	.byte	0x5
	.uleb128 0
	.4byte	.LASF232
	.byte	0x5
	.uleb128 0
	.4byte	.LASF233
	.byte	0x5
	.uleb128 0
	.4byte	.LASF234
	.byte	0x5
	.uleb128 0
	.4byte	.LASF235
	.byte	0x5
	.uleb128 0
	.4byte	.LASF236
	.byte	0x5
	.uleb128 0
	.4byte	.LASF237
	.byte	0x5
	.uleb128 0
	.4byte	.LASF238
	.byte	0x5
	.uleb128 0
	.4byte	.LASF239
	.byte	0x5
	.uleb128 0
	.4byte	.LASF240
	.byte	0x5
	.uleb128 0
	.4byte	.LASF241
	.byte	0x5
	.uleb128 0
	.4byte	.LASF242
	.byte	0x5
	.uleb128 0
	.4byte	.LASF243
	.byte	0x5
	.uleb128 0
	.4byte	.LASF244
	.byte	0x5
	.uleb128 0
	.4byte	.LASF245
	.byte	0x5
	.uleb128 0
	.4byte	.LASF246
	.byte	0x5
	.uleb128 0
	.4byte	.LASF247
	.byte	0x5
	.uleb128 0
	.4byte	.LASF248
	.byte	0x5
	.uleb128 0
	.4byte	.LASF249
	.byte	0x5
	.uleb128 0
	.4byte	.LASF250
	.byte	0x5
	.uleb128 0
	.4byte	.LASF251
	.byte	0x5
	.uleb128 0
	.4byte	.LASF252
	.byte	0x5
	.uleb128 0
	.4byte	.LASF253
	.byte	0x5
	.uleb128 0
	.4byte	.LASF254
	.byte	0x5
	.uleb128 0
	.4byte	.LASF255
	.byte	0x5
	.uleb128 0
	.4byte	.LASF256
	.byte	0x5
	.uleb128 0
	.4byte	.LASF257
	.byte	0x5
	.uleb128 0
	.4byte	.LASF258
	.byte	0x5
	.uleb128 0
	.4byte	.LASF259
	.byte	0x5
	.uleb128 0
	.4byte	.LASF260
	.byte	0x5
	.uleb128 0
	.4byte	.LASF261
	.byte	0x5
	.uleb128 0
	.4byte	.LASF262
	.byte	0x5
	.uleb128 0
	.4byte	.LASF263
	.byte	0x5
	.uleb128 0
	.4byte	.LASF264
	.byte	0x5
	.uleb128 0
	.4byte	.LASF265
	.byte	0x5
	.uleb128 0
	.4byte	.LASF266
	.byte	0x5
	.uleb128 0
	.4byte	.LASF267
	.byte	0x5
	.uleb128 0
	.4byte	.LASF268
	.byte	0x5
	.uleb128 0
	.4byte	.LASF269
	.byte	0x5
	.uleb128 0
	.4byte	.LASF270
	.byte	0x5
	.uleb128 0
	.4byte	.LASF271
	.byte	0x5
	.uleb128 0
	.4byte	.LASF272
	.byte	0x5
	.uleb128 0
	.4byte	.LASF273
	.byte	0x5
	.uleb128 0
	.4byte	.LASF274
	.byte	0x5
	.uleb128 0
	.4byte	.LASF275
	.byte	0x5
	.uleb128 0
	.4byte	.LASF276
	.byte	0x5
	.uleb128 0
	.4byte	.LASF277
	.byte	0x5
	.uleb128 0
	.4byte	.LASF278
	.byte	0x5
	.uleb128 0
	.4byte	.LASF279
	.byte	0x5
	.uleb128 0
	.4byte	.LASF280
	.byte	0x5
	.uleb128 0
	.4byte	.LASF281
	.byte	0x5
	.uleb128 0
	.4byte	.LASF282
	.byte	0x5
	.uleb128 0
	.4byte	.LASF283
	.byte	0x5
	.uleb128 0
	.4byte	.LASF284
	.byte	0x5
	.uleb128 0
	.4byte	.LASF285
	.byte	0x5
	.uleb128 0
	.4byte	.LASF286
	.byte	0x5
	.uleb128 0
	.4byte	.LASF287
	.byte	0x5
	.uleb128 0
	.4byte	.LASF288
	.byte	0x5
	.uleb128 0
	.4byte	.LASF289
	.byte	0x5
	.uleb128 0
	.4byte	.LASF290
	.byte	0x5
	.uleb128 0
	.4byte	.LASF291
	.byte	0x5
	.uleb128 0
	.4byte	.LASF292
	.byte	0x5
	.uleb128 0
	.4byte	.LASF293
	.byte	0x5
	.uleb128 0
	.4byte	.LASF294
	.byte	0x5
	.uleb128 0
	.4byte	.LASF295
	.byte	0x5
	.uleb128 0
	.4byte	.LASF296
	.byte	0x5
	.uleb128 0
	.4byte	.LASF297
	.byte	0x5
	.uleb128 0
	.4byte	.LASF298
	.byte	0x5
	.uleb128 0
	.4byte	.LASF299
	.byte	0x5
	.uleb128 0
	.4byte	.LASF300
	.byte	0x5
	.uleb128 0
	.4byte	.LASF301
	.byte	0x5
	.uleb128 0
	.4byte	.LASF302
	.byte	0x5
	.uleb128 0
	.4byte	.LASF303
	.byte	0x5
	.uleb128 0
	.4byte	.LASF304
	.byte	0x5
	.uleb128 0
	.4byte	.LASF305
	.byte	0x5
	.uleb128 0
	.4byte	.LASF306
	.byte	0x5
	.uleb128 0
	.4byte	.LASF307
	.byte	0x5
	.uleb128 0
	.4byte	.LASF308
	.byte	0x5
	.uleb128 0
	.4byte	.LASF309
	.byte	0x5
	.uleb128 0
	.4byte	.LASF310
	.byte	0x5
	.uleb128 0
	.4byte	.LASF311
	.byte	0x5
	.uleb128 0
	.4byte	.LASF312
	.byte	0x5
	.uleb128 0
	.4byte	.LASF313
	.byte	0x5
	.uleb128 0
	.4byte	.LASF314
	.byte	0x5
	.uleb128 0
	.4byte	.LASF315
	.byte	0x5
	.uleb128 0
	.4byte	.LASF316
	.byte	0x5
	.uleb128 0
	.4byte	.LASF317
	.byte	0x5
	.uleb128 0
	.4byte	.LASF318
	.byte	0x5
	.uleb128 0
	.4byte	.LASF319
	.byte	0x5
	.uleb128 0
	.4byte	.LASF320
	.byte	0x5
	.uleb128 0
	.4byte	.LASF321
	.byte	0x5
	.uleb128 0
	.4byte	.LASF322
	.byte	0x5
	.uleb128 0
	.4byte	.LASF323
	.byte	0x5
	.uleb128 0
	.4byte	.LASF324
	.byte	0x5
	.uleb128 0
	.4byte	.LASF325
	.byte	0x5
	.uleb128 0
	.4byte	.LASF326
	.byte	0x5
	.uleb128 0
	.4byte	.LASF327
	.byte	0x5
	.uleb128 0
	.4byte	.LASF328
	.byte	0x5
	.uleb128 0
	.4byte	.LASF329
	.byte	0x5
	.uleb128 0
	.4byte	.LASF330
	.byte	0x5
	.uleb128 0
	.4byte	.LASF331
	.byte	0x5
	.uleb128 0
	.4byte	.LASF332
	.byte	0x5
	.uleb128 0
	.4byte	.LASF333
	.byte	0x5
	.uleb128 0
	.4byte	.LASF334
	.byte	0x5
	.uleb128 0
	.4byte	.LASF335
	.byte	0x5
	.uleb128 0
	.4byte	.LASF336
	.byte	0x5
	.uleb128 0
	.4byte	.LASF337
	.byte	0x5
	.uleb128 0
	.4byte	.LASF338
	.byte	0x5
	.uleb128 0
	.4byte	.LASF339
	.byte	0x5
	.uleb128 0
	.4byte	.LASF340
	.byte	0x5
	.uleb128 0
	.4byte	.LASF341
	.byte	0x5
	.uleb128 0
	.4byte	.LASF342
	.byte	0x5
	.uleb128 0
	.4byte	.LASF343
	.byte	0x5
	.uleb128 0
	.4byte	.LASF344
	.byte	0x5
	.uleb128 0
	.4byte	.LASF345
	.byte	0x5
	.uleb128 0
	.4byte	.LASF346
	.byte	0x5
	.uleb128 0
	.4byte	.LASF347
	.byte	0x5
	.uleb128 0
	.4byte	.LASF348
	.byte	0x5
	.uleb128 0
	.4byte	.LASF349
	.byte	0x5
	.uleb128 0
	.4byte	.LASF350
	.byte	0x5
	.uleb128 0
	.4byte	.LASF351
	.byte	0x5
	.uleb128 0
	.4byte	.LASF352
	.byte	0x5
	.uleb128 0
	.4byte	.LASF353
	.byte	0x5
	.uleb128 0
	.4byte	.LASF354
	.byte	0x5
	.uleb128 0
	.4byte	.LASF355
	.byte	0x5
	.uleb128 0
	.4byte	.LASF356
	.byte	0x5
	.uleb128 0
	.4byte	.LASF357
	.byte	0x5
	.uleb128 0
	.4byte	.LASF358
	.byte	0x5
	.uleb128 0
	.4byte	.LASF359
	.byte	0x5
	.uleb128 0
	.4byte	.LASF360
	.byte	0x5
	.uleb128 0
	.4byte	.LASF361
	.byte	0x5
	.uleb128 0
	.4byte	.LASF362
	.byte	0x5
	.uleb128 0
	.4byte	.LASF363
	.byte	0x5
	.uleb128 0
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0
	.4byte	.LASF365
	.byte	0x5
	.uleb128 0
	.4byte	.LASF366
	.byte	0x5
	.uleb128 0
	.4byte	.LASF367
	.byte	0x5
	.uleb128 0
	.4byte	.LASF368
	.byte	0x5
	.uleb128 0
	.4byte	.LASF369
	.byte	0x5
	.uleb128 0
	.4byte	.LASF370
	.byte	0x5
	.uleb128 0
	.4byte	.LASF371
	.byte	0x5
	.uleb128 0
	.4byte	.LASF372
	.byte	0x5
	.uleb128 0
	.4byte	.LASF373
	.byte	0x5
	.uleb128 0
	.4byte	.LASF374
	.byte	0x5
	.uleb128 0
	.4byte	.LASF375
	.byte	0x5
	.uleb128 0
	.4byte	.LASF376
	.byte	0x5
	.uleb128 0
	.4byte	.LASF377
	.byte	0x5
	.uleb128 0
	.4byte	.LASF378
	.byte	0x6
	.uleb128 0
	.4byte	.LASF379
	.byte	0x5
	.uleb128 0
	.4byte	.LASF380
	.byte	0x6
	.uleb128 0
	.4byte	.LASF381
	.byte	0x6
	.uleb128 0
	.4byte	.LASF382
	.byte	0x6
	.uleb128 0
	.4byte	.LASF383
	.byte	0x6
	.uleb128 0
	.4byte	.LASF384
	.byte	0x5
	.uleb128 0
	.4byte	.LASF385
	.byte	0x6
	.uleb128 0
	.4byte	.LASF386
	.byte	0x6
	.uleb128 0
	.4byte	.LASF387
	.byte	0x6
	.uleb128 0
	.4byte	.LASF388
	.byte	0x5
	.uleb128 0
	.4byte	.LASF389
	.byte	0x5
	.uleb128 0
	.4byte	.LASF390
	.byte	0x6
	.uleb128 0
	.4byte	.LASF391
	.byte	0x5
	.uleb128 0
	.4byte	.LASF392
	.byte	0x5
	.uleb128 0
	.4byte	.LASF393
	.byte	0x5
	.uleb128 0
	.4byte	.LASF394
	.byte	0x6
	.uleb128 0
	.4byte	.LASF395
	.byte	0x5
	.uleb128 0
	.4byte	.LASF396
	.byte	0x5
	.uleb128 0
	.4byte	.LASF397
	.byte	0x6
	.uleb128 0
	.4byte	.LASF398
	.byte	0x5
	.uleb128 0
	.4byte	.LASF399
	.byte	0x5
	.uleb128 0
	.4byte	.LASF400
	.byte	0x5
	.uleb128 0
	.4byte	.LASF401
	.byte	0x5
	.uleb128 0
	.4byte	.LASF402
	.byte	0x5
	.uleb128 0
	.4byte	.LASF403
	.byte	0x5
	.uleb128 0
	.4byte	.LASF404
	.byte	0x6
	.uleb128 0
	.4byte	.LASF405
	.byte	0x5
	.uleb128 0
	.4byte	.LASF406
	.byte	0x5
	.uleb128 0
	.4byte	.LASF407
	.byte	0x5
	.uleb128 0
	.4byte	.LASF408
	.byte	0x5
	.uleb128 0
	.4byte	.LASF409
	.byte	0x6
	.uleb128 0
	.4byte	.LASF410
	.byte	0x6
	.uleb128 0
	.4byte	.LASF411
	.byte	0x6
	.uleb128 0
	.4byte	.LASF412
	.byte	0x6
	.uleb128 0
	.4byte	.LASF413
	.byte	0x6
	.uleb128 0
	.4byte	.LASF414
	.byte	0x6
	.uleb128 0
	.4byte	.LASF415
	.byte	0x6
	.uleb128 0
	.4byte	.LASF416
	.byte	0x5
	.uleb128 0
	.4byte	.LASF417
	.byte	0x6
	.uleb128 0
	.4byte	.LASF418
	.byte	0x6
	.uleb128 0
	.4byte	.LASF419
	.byte	0x6
	.uleb128 0
	.4byte	.LASF420
	.byte	0x5
	.uleb128 0
	.4byte	.LASF421
	.byte	0x5
	.uleb128 0
	.4byte	.LASF422
	.byte	0x5
	.uleb128 0
	.4byte	.LASF423
	.byte	0x5
	.uleb128 0
	.4byte	.LASF424
	.byte	0x6
	.uleb128 0
	.4byte	.LASF425
	.byte	0x5
	.uleb128 0
	.4byte	.LASF426
	.byte	0x5
	.uleb128 0
	.4byte	.LASF427
	.byte	0x5
	.uleb128 0
	.4byte	.LASF428
	.byte	0x6
	.uleb128 0
	.4byte	.LASF429
	.byte	0x5
	.uleb128 0
	.4byte	.LASF430
	.byte	0x6
	.uleb128 0
	.4byte	.LASF431
	.byte	0x6
	.uleb128 0
	.4byte	.LASF432
	.byte	0x6
	.uleb128 0
	.4byte	.LASF433
	.byte	0x6
	.uleb128 0
	.4byte	.LASF434
	.byte	0x6
	.uleb128 0
	.4byte	.LASF435
	.byte	0x6
	.uleb128 0
	.4byte	.LASF436
	.byte	0x5
	.uleb128 0
	.4byte	.LASF437
	.byte	0x5
	.uleb128 0
	.4byte	.LASF438
	.byte	0x5
	.uleb128 0
	.4byte	.LASF439
	.byte	0x5
	.uleb128 0
	.4byte	.LASF422
	.byte	0x5
	.uleb128 0
	.4byte	.LASF440
	.byte	0x5
	.uleb128 0
	.4byte	.LASF441
	.byte	0x5
	.uleb128 0
	.4byte	.LASF442
	.byte	0x5
	.uleb128 0
	.4byte	.LASF443
	.byte	0x5
	.uleb128 0
	.4byte	.LASF444
	.byte	0x5
	.uleb128 0
	.4byte	.LASF445
	.byte	0x5
	.uleb128 0
	.4byte	.LASF446
	.byte	0x5
	.uleb128 0
	.4byte	.LASF447
	.byte	0x5
	.uleb128 0
	.4byte	.LASF448
	.byte	0x5
	.uleb128 0
	.4byte	.LASF449
	.byte	0x5
	.uleb128 0
	.4byte	.LASF450
	.byte	0x5
	.uleb128 0
	.4byte	.LASF451
	.byte	0x5
	.uleb128 0
	.4byte	.LASF452
	.byte	0x5
	.uleb128 0
	.4byte	.LASF453
	.byte	0x5
	.uleb128 0
	.4byte	.LASF454
	.byte	0x5
	.uleb128 0
	.4byte	.LASF455
	.byte	0x5
	.uleb128 0
	.4byte	.LASF456
	.byte	0x5
	.uleb128 0
	.4byte	.LASF457
	.byte	0x5
	.uleb128 0
	.4byte	.LASF458
	.byte	0x5
	.uleb128 0
	.4byte	.LASF459
	.byte	0x5
	.uleb128 0
	.4byte	.LASF460
	.byte	0x5
	.uleb128 0
	.4byte	.LASF461
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.__crossworks.h.39.ff21eb83ebfc80fb95245a821dd1e413,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF465
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF466
	.byte	0x6
	.uleb128 0x3d
	.4byte	.LASF467
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF468
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF469
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF470
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF471
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF466
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF472
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF473
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF474
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF475
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF476
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF477
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF478
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF479
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF480
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF481
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF482
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF483
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF484
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF485
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdlib.h.48.46499b9a2c5c0782586f14a39a906a6b,comdat
.Ldebug_macro4:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF486
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF487
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF488
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF489
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF490
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF491
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF492
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdint.h.39.fe42d6eb18d369206696c6985313e641,comdat
.Ldebug_macro5:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF493
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF494
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF495
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF496
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF497
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF498
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF499
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF500
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF501
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF502
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF503
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF504
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF505
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF506
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF507
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF508
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF509
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF510
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF511
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF512
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF513
	.byte	0x5
	.uleb128 0x95
	.4byte	.LASF514
	.byte	0x5
	.uleb128 0x96
	.4byte	.LASF515
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF516
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF517
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF518
	.byte	0x5
	.uleb128 0x9a
	.4byte	.LASF519
	.byte	0x5
	.uleb128 0x9b
	.4byte	.LASF520
	.byte	0x5
	.uleb128 0x9d
	.4byte	.LASF521
	.byte	0x5
	.uleb128 0x9e
	.4byte	.LASF522
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF523
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF524
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF525
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF526
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF527
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF528
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF529
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF530
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF531
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF532
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF533
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF534
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF535
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF536
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF537
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF538
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF539
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF540
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF541
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF542
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF543
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF544
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF545
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF546
	.byte	0x5
	.uleb128 0xcc
	.4byte	.LASF547
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF548
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF549
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF550
	.byte	0x5
	.uleb128 0xe3
	.4byte	.LASF551
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF552
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdbool.h.39.3758cb47b714dfcbf7837a03b10a6ad6,comdat
.Ldebug_macro6:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF553
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF554
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF555
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF556
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF557
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.nordic_common.h.45.9c3ae75d2a281e8621d2dc58ab581f4c,comdat
.Ldebug_macro7:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF558
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF559
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF560
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF561
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF562
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF563
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF564
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF565
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF566
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF567
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF568
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF569
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF570
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF571
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF572
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF573
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF574
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF575
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF576
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF577
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF578
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF579
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF580
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF581
	.byte	0x5
	.uleb128 0xb4
	.4byte	.LASF582
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF583
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF584
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF585
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF586
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF587
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF588
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF589
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF590
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF591
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF592
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF593
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF594
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF595
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF596
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF597
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF598
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF599
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF600
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF601
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF602
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF603
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF604
	.byte	0x5
	.uleb128 0xcb
	.4byte	.LASF605
	.byte	0x5
	.uleb128 0xcc
	.4byte	.LASF606
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF607
	.byte	0x5
	.uleb128 0xcf
	.4byte	.LASF608
	.byte	0x5
	.uleb128 0xd0
	.4byte	.LASF609
	.byte	0x5
	.uleb128 0xd1
	.4byte	.LASF610
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.sensirion_common.h.42.a34aab85cbddfaf1e43f4d500e682b20,comdat
.Ldebug_macro8:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF611
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF612
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF613
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF614
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF615
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF616
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF168:
	.ascii	"__DBL_NORM_MAX__ ((double)1.1)\000"
.LASF93:
	.ascii	"__SIG_ATOMIC_MAX__ 0x7fffffff\000"
.LASF220:
	.ascii	"__FLT64_HAS_QUIET_NAN__ 1\000"
.LASF407:
	.ascii	"__ARMEL__ 1\000"
.LASF252:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF204:
	.ascii	"__FLT32_HAS_INFINITY__ 1\000"
.LASF506:
	.ascii	"INTMAX_MIN (-9223372036854775807LL-1)\000"
.LASF61:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF210:
	.ascii	"__FLT64_MAX_EXP__ 1024\000"
.LASF451:
	.ascii	"DEVELOP_IN_NRF52832 1\000"
.LASF513:
	.ascii	"INT_LEAST8_MAX INT8_MAX\000"
.LASF225:
	.ascii	"__FLT32X_MAX_EXP__ 1024\000"
.LASF127:
	.ascii	"__INT_FAST16_WIDTH__ 32\000"
.LASF369:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF541:
	.ascii	"INT16_C(x) (x)\000"
.LASF616:
	.ascii	"SENSIRION_MAX_BUFFER_WORDS 32\000"
.LASF305:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF484:
	.ascii	"__RAL_WCHAR_T __WCHAR_TYPE__\000"
.LASF198:
	.ascii	"__FLT32_MAX__ 1.1\000"
.LASF191:
	.ascii	"__FLT32_MANT_DIG__ 24\000"
.LASF618:
	.ascii	"char\000"
.LASF117:
	.ascii	"__UINT8_C(c) c\000"
.LASF418:
	.ascii	"__ARM_NEON__\000"
.LASF374:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF317:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF333:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF652:
	.ascii	"D:\\zepyth\\nRF5_SDK_17.0.2_d674dde\\examples\\ble_"
	.ascii	"peripheral\\ble_app_blinky_k5\\pca10040e_k5_sht\\s1"
	.ascii	"12\\ses\000"
.LASF575:
	.ascii	"IS_SET(W,B) (((W) >> (B)) & 1)\000"
.LASF227:
	.ascii	"__FLT32X_DECIMAL_DIG__ 17\000"
.LASF607:
	.ascii	"BIT_31 0x80000000\000"
.LASF162:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF83:
	.ascii	"__LONG_LONG_WIDTH__ 64\000"
.LASF362:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2\000"
.LASF432:
	.ascii	"__ARM_FEATURE_CDE_COPROC\000"
.LASF394:
	.ascii	"__ARM_SIZEOF_WCHAR_T 4\000"
.LASF411:
	.ascii	"__ARM_FP16_FORMAT_IEEE\000"
.LASF384:
	.ascii	"__ARM_FEATURE_COMPLEX\000"
.LASF267:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF243:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF557:
	.ascii	"__bool_true_false_are_defined 1\000"
.LASF6:
	.ascii	"__GNUC_MINOR__ 2\000"
.LASF116:
	.ascii	"__UINT_LEAST8_MAX__ 0xff\000"
.LASF573:
	.ascii	"SET_BIT(W,B) ((W) |= (uint32_t)(1U << (B)))\000"
.LASF428:
	.ascii	"__ARM_ASM_SYNTAX_UNIFIED__ 1\000"
.LASF519:
	.ascii	"UINT_LEAST32_MAX UINT32_MAX\000"
.LASF619:
	.ascii	"unsigned int\000"
.LASF543:
	.ascii	"INT32_C(x) (x ##L)\000"
.LASF379:
	.ascii	"__ARM_FEATURE_CRYPTO\000"
.LASF645:
	.ascii	"sensirion_common_bytes_to_float\000"
.LASF588:
	.ascii	"BIT_12 0x1000\000"
.LASF119:
	.ascii	"__UINT16_C(c) c\000"
.LASF23:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF38:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF458:
	.ascii	"NRF_SD_BLE_API_VERSION 7\000"
.LASF534:
	.ascii	"PTRDIFF_MAX INT32_MAX\000"
.LASF22:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF152:
	.ascii	"__FLT_MAX__ 1.1\000"
.LASF124:
	.ascii	"__INT_FAST8_MAX__ 0x7fffffff\000"
.LASF27:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF274:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF376:
	.ascii	"__ARM_FEATURE_DSP 1\000"
.LASF350:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF160:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF56:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF231:
	.ascii	"__FLT32X_EPSILON__ 1.1\000"
.LASF70:
	.ascii	"__INT_MAX__ 0x7fffffff\000"
.LASF12:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF33:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF356:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF42:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF644:
	.ascii	"sensirion_common_uint32_t_to_bytes\000"
.LASF381:
	.ascii	"__ARM_FEATURE_QRDMX\000"
.LASF176:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF230:
	.ascii	"__FLT32X_MIN__ 1.1\000"
.LASF517:
	.ascii	"UINT_LEAST8_MAX UINT8_MAX\000"
.LASF307:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF605:
	.ascii	"BIT_29 0x20000000\000"
.LASF10:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF454:
	.ascii	"NO_VTOR_CONFIG 1\000"
.LASF19:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF186:
	.ascii	"__LDBL_EPSILON__ 1.1\000"
.LASF441:
	.ascii	"__HEAP_SIZE__ 2048\000"
.LASF648:
	.ascii	"sensirion_common_bytes_to_uint32_t\000"
.LASF206:
	.ascii	"__FLT64_MANT_DIG__ 53\000"
.LASF496:
	.ascii	"INT8_MIN (-128)\000"
.LASF91:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF610:
	.ascii	"UNUSED_RETURN_VALUE(X) UNUSED_VARIABLE(X)\000"
.LASF29:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF590:
	.ascii	"BIT_14 0x4000\000"
.LASF194:
	.ascii	"__FLT32_MIN_10_EXP__ (-37)\000"
.LASF455:
	.ascii	"NRF52810_XXAA 1\000"
.LASF257:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF483:
	.ascii	"__CTYPE_PRINT (__CTYPE_BLANK | __CTYPE_PUNCT | __CT"
	.ascii	"YPE_UPPER | __CTYPE_LOWER | __CTYPE_DIGIT)\000"
.LASF522:
	.ascii	"INT_FAST16_MIN INT32_MIN\000"
.LASF399:
	.ascii	"__ARM_ARCH 7\000"
.LASF3:
	.ascii	"__STDC_UTF_32__ 1\000"
.LASF107:
	.ascii	"__INT_LEAST16_MAX__ 0x7fff\000"
.LASF68:
	.ascii	"__SCHAR_MAX__ 0x7f\000"
.LASF312:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF391:
	.ascii	"__ARM_FEATURE_NUMERIC_MAXMIN\000"
.LASF272:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF207:
	.ascii	"__FLT64_DIG__ 15\000"
.LASF515:
	.ascii	"INT_LEAST32_MAX INT32_MAX\000"
.LASF9:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF487:
	.ascii	"__RAL_WCHAR_T_DEFINED \000"
.LASF416:
	.ascii	"__ARM_FEATURE_FP16_FML\000"
.LASF78:
	.ascii	"__SIZE_MAX__ 0xffffffffU\000"
.LASF298:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF314:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF303:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF465:
	.ascii	"__crossworks_H \000"
.LASF158:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF601:
	.ascii	"BIT_25 0x02000000\000"
.LASF491:
	.ascii	"RAND_MAX 32767\000"
.LASF53:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF349:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF527:
	.ascii	"INT_FAST32_MAX INT32_MAX\000"
.LASF611:
	.ascii	"NO_ERROR 0\000"
.LASF60:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF591:
	.ascii	"BIT_15 0x8000\000"
.LASF105:
	.ascii	"__INT8_C(c) c\000"
.LASF403:
	.ascii	"__thumb2__ 1\000"
.LASF623:
	.ascii	"signed char\000"
.LASF385:
	.ascii	"__ARM_32BIT_STATE 1\000"
.LASF425:
	.ascii	"__FDPIC__\000"
.LASF232:
	.ascii	"__FLT32X_DENORM_MIN__ 1.1\000"
.LASF109:
	.ascii	"__INT_LEAST16_WIDTH__ 16\000"
.LASF531:
	.ascii	"UINT_FAST32_MAX UINT32_MAX\000"
.LASF412:
	.ascii	"__ARM_FP16_FORMAT_ALTERNATIVE\000"
.LASF313:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF629:
	.ascii	"uint32_t\000"
.LASF383:
	.ascii	"__ARM_FEATURE_DOTPROD\000"
.LASF419:
	.ascii	"__ARM_NEON\000"
.LASF554:
	.ascii	"bool _Bool\000"
.LASF77:
	.ascii	"__PTRDIFF_MAX__ 0x7fffffff\000"
.LASF387:
	.ascii	"__ARM_FEATURE_CMSE\000"
.LASF66:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF155:
	.ascii	"__FLT_EPSILON__ 1.1\000"
.LASF203:
	.ascii	"__FLT32_HAS_DENORM__ 1\000"
.LASF641:
	.ascii	"sensirion_common_int16_t_to_bytes\000"
.LASF357:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1\000"
.LASF492:
	.ascii	"MB_CUR_MAX __RAL_mb_max(&__RAL_global_locale)\000"
.LASF498:
	.ascii	"INT16_MIN (-32767-1)\000"
.LASF339:
	.ascii	"__SA_IBIT__ 16\000"
.LASF269:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF634:
	.ascii	"sensirion_common_copy_bytes\000"
.LASF130:
	.ascii	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF414:
	.ascii	"__ARM_FEATURE_FP16_SCALAR_ARITHMETIC\000"
.LASF640:
	.ascii	"float\000"
.LASF146:
	.ascii	"__FLT_DIG__ 6\000"
.LASF126:
	.ascii	"__INT_FAST16_MAX__ 0x7fffffff\000"
.LASF360:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 2\000"
.LASF358:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1\000"
.LASF486:
	.ascii	"__RAL_SIZE_T_DEFINED \000"
.LASF340:
	.ascii	"__DA_FBIT__ 31\000"
.LASF393:
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 1\000"
.LASF578:
	.ascii	"BIT_2 0x04\000"
.LASF139:
	.ascii	"__GCC_IEC_559 0\000"
.LASF633:
	.ascii	"data_length\000"
.LASF285:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF625:
	.ascii	"int16_t\000"
.LASF205:
	.ascii	"__FLT32_HAS_QUIET_NAN__ 1\000"
.LASF304:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF254:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF239:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF424:
	.ascii	"__ARM_EABI__ 1\000"
.LASF630:
	.ascii	"long long unsigned int\000"
.LASF99:
	.ascii	"__INT64_MAX__ 0x7fffffffffffffffLL\000"
.LASF567:
	.ascii	"CONCAT_2_(p1,p2) p1 ##p2\000"
.LASF96:
	.ascii	"__INT8_MAX__ 0x7f\000"
.LASF265:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF51:
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
.LASF559:
	.ascii	"NRF_MODULE_ENABLED(module) ((defined(module ## _ENA"
	.ascii	"BLED) && (module ## _ENABLED)) ? 1 : 0)\000"
.LASF262:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF335:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF514:
	.ascii	"INT_LEAST16_MAX INT16_MAX\000"
.LASF122:
	.ascii	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF144:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF643:
	.ascii	"sensirion_common_uint16_t_to_bytes\000"
.LASF273:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF174:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF293:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF478:
	.ascii	"__CTYPE_BLANK 0x40\000"
.LASF260:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF57:
	.ascii	"__INT_FAST8_TYPE__ int\000"
.LASF462:
	.ascii	"SENSIRION_COMMON_H \000"
.LASF219:
	.ascii	"__FLT64_HAS_INFINITY__ 1\000"
.LASF613:
	.ascii	"SENSIRION_COMMAND_SIZE 2\000"
.LASF202:
	.ascii	"__FLT32_DENORM_MIN__ 1.1\000"
.LASF427:
	.ascii	"__ARM_FEATURE_IDIV 1\000"
.LASF472:
	.ascii	"__CTYPE_UPPER 0x01\000"
.LASF276:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF34:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF200:
	.ascii	"__FLT32_MIN__ 1.1\000"
.LASF562:
	.ascii	"MSB_16(a) (((a) & 0xFF00) >> 8)\000"
.LASF396:
	.ascii	"__ARM_ARCH_PROFILE 77\000"
.LASF459:
	.ascii	"S112 1\000"
.LASF439:
	.ascii	"__SIZEOF_WCHAR_T 4\000"
.LASF248:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF469:
	.ascii	"__RAL_SIZE_MAX 4294967295UL\000"
.LASF366:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 2\000"
.LASF88:
	.ascii	"__INTMAX_MAX__ 0x7fffffffffffffffLL\000"
.LASF253:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF295:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF501:
	.ascii	"INT32_MAX 2147483647L\000"
.LASF565:
	.ascii	"MAX(a,b) ((a) < (b) ? (b) : (a))\000"
.LASF287:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF323:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF467:
	.ascii	"__RAL_SIZE_T\000"
.LASF211:
	.ascii	"__FLT64_MAX_10_EXP__ 308\000"
.LASF277:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF375:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF372:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF331:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF238:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF347:
	.ascii	"__USA_IBIT__ 16\000"
.LASF426:
	.ascii	"__ARM_ARCH_EXT_IDIV__ 1\000"
.LASF547:
	.ascii	"INTMAX_C(x) (x ##LL)\000"
.LASF380:
	.ascii	"__ARM_FEATURE_UNALIGNED 1\000"
.LASF482:
	.ascii	"__CTYPE_GRAPH (__CTYPE_PUNCT | __CTYPE_UPPER | __CT"
	.ascii	"YPE_LOWER | __CTYPE_DIGIT)\000"
.LASF20:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF466:
	.ascii	"__THREAD __thread\000"
.LASF284:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF121:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF348:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF606:
	.ascii	"BIT_30 0x40000000\000"
.LASF404:
	.ascii	"__THUMBEL__ 1\000"
.LASF185:
	.ascii	"__LDBL_MIN__ 1.1\000"
.LASF580:
	.ascii	"BIT_4 0x10\000"
.LASF341:
	.ascii	"__DA_IBIT__ 32\000"
.LASF25:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF297:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF244:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF132:
	.ascii	"__UINT_FAST8_MAX__ 0xffffffffU\000"
.LASF26:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF371:
	.ascii	"__HAVE_SPECULATION_SAFE_VALUE 1\000"
.LASF460:
	.ascii	"SOFTDEVICE_PRESENT 1\000"
.LASF308:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF526:
	.ascii	"INT_FAST16_MAX INT32_MAX\000"
.LASF338:
	.ascii	"__SA_FBIT__ 15\000"
.LASF209:
	.ascii	"__FLT64_MIN_10_EXP__ (-307)\000"
.LASF593:
	.ascii	"BIT_17 0x00020000\000"
.LASF637:
	.ascii	"bytes\000"
.LASF280:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF600:
	.ascii	"BIT_24 0x01000000\000"
.LASF58:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF473:
	.ascii	"__CTYPE_LOWER 0x02\000"
.LASF197:
	.ascii	"__FLT32_DECIMAL_DIG__ 9\000"
.LASF46:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF450:
	.ascii	"CONFIG_GPIO_AS_PINRESET 1\000"
.LASF84:
	.ascii	"__WCHAR_WIDTH__ 32\000"
.LASF354:
	.ascii	"__GNUC_STDC_INLINE__ 1\000"
.LASF329:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF251:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF542:
	.ascii	"UINT16_C(x) (x ##U)\000"
.LASF390:
	.ascii	"__ARM_FEATURE_CLZ 1\000"
.LASF72:
	.ascii	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL\000"
.LASF479:
	.ascii	"__CTYPE_XDIGIT 0x80\000"
.LASF44:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF150:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF309:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF445:
	.ascii	"DEBUG_NRF 1\000"
.LASF552:
	.ascii	"WINT_MAX 2147483647L\000"
.LASF646:
	.ascii	"sensirion_common_bytes_to_int32_t\000"
.LASF310:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF283:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF221:
	.ascii	"__FLT32X_MANT_DIG__ 53\000"
.LASF355:
	.ascii	"__NO_INLINE__ 1\000"
.LASF429:
	.ascii	"__ARM_FEATURE_COPROC\000"
.LASF589:
	.ascii	"BIT_13 0x2000\000"
.LASF263:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF145:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF558:
	.ascii	"NORDIC_COMMON_H__ \000"
.LASF398:
	.ascii	"__ARM_ARCH\000"
.LASF212:
	.ascii	"__FLT64_DECIMAL_DIG__ 17\000"
.LASF569:
	.ascii	"CONCAT_3_(p1,p2,p3) p1 ##p2 ##p3\000"
.LASF352:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF528:
	.ascii	"INT_FAST64_MAX INT64_MAX\000"
.LASF193:
	.ascii	"__FLT32_MIN_EXP__ (-125)\000"
.LASF452:
	.ascii	"FLOAT_ABI_SOFT 1\000"
.LASF292:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF133:
	.ascii	"__UINT_FAST16_MAX__ 0xffffffffU\000"
.LASF62:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF475:
	.ascii	"__CTYPE_SPACE 0x08\000"
.LASF163:
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
.LASF282:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF67:
	.ascii	"__GXX_ABI_VERSION 1014\000"
.LASF192:
	.ascii	"__FLT32_DIG__ 6\000"
.LASF520:
	.ascii	"UINT_LEAST64_MAX UINT64_MAX\000"
.LASF493:
	.ascii	"__stdint_H \000"
.LASF218:
	.ascii	"__FLT64_HAS_DENORM__ 1\000"
.LASF141:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF233:
	.ascii	"__FLT32X_HAS_DENORM__ 1\000"
.LASF516:
	.ascii	"INT_LEAST64_MAX INT64_MAX\000"
.LASF113:
	.ascii	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF217:
	.ascii	"__FLT64_DENORM_MIN__ 1.1\000"
.LASF511:
	.ascii	"INT_LEAST32_MIN INT32_MIN\000"
.LASF364:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2\000"
.LASF302:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF266:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF488:
	.ascii	"NULL 0\000"
.LASF585:
	.ascii	"BIT_9 0x0200\000"
.LASF106:
	.ascii	"__INT_LEAST8_WIDTH__ 8\000"
.LASF346:
	.ascii	"__USA_FBIT__ 16\000"
.LASF100:
	.ascii	"__UINT8_MAX__ 0xff\000"
.LASF639:
	.ascii	"float32\000"
.LASF544:
	.ascii	"UINT32_C(x) (x ##UL)\000"
.LASF101:
	.ascii	"__UINT16_MAX__ 0xffff\000"
.LASF444:
	.ascii	"DEBUG 1\000"
.LASF154:
	.ascii	"__FLT_MIN__ 1.1\000"
.LASF494:
	.ascii	"UINT8_MAX 255\000"
.LASF8:
	.ascii	"__VERSION__ \"10.2.1 20201103 (release)\"\000"
.LASF624:
	.ascii	"uint8_t\000"
.LASF461:
	.ascii	"TEMP_FRON_SHT 1\000"
.LASF92:
	.ascii	"__INTMAX_WIDTH__ 64\000"
.LASF431:
	.ascii	"__ARM_FEATURE_CDE\000"
.LASF256:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF577:
	.ascii	"BIT_1 0x02\000"
.LASF440:
	.ascii	"__SES_ARM 1\000"
.LASF551:
	.ascii	"WINT_MIN (-2147483647L-1)\000"
.LASF50:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF195:
	.ascii	"__FLT32_MAX_EXP__ 128\000"
.LASF614:
	.ascii	"SENSIRION_WORD_SIZE 2\000"
.LASF443:
	.ascii	"__GNU_LINKER 1\000"
.LASF161:
	.ascii	"__DBL_DIG__ 15\000"
.LASF555:
	.ascii	"true 1\000"
.LASF104:
	.ascii	"__INT_LEAST8_MAX__ 0x7f\000"
.LASF405:
	.ascii	"__ARM_ARCH_ISA_THUMB\000"
.LASF296:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF603:
	.ascii	"BIT_27 0x08000000\000"
.LASF171:
	.ascii	"__DBL_DENORM_MIN__ ((double)1.1)\000"
.LASF367:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 2\000"
.LASF222:
	.ascii	"__FLT32X_DIG__ 15\000"
.LASF290:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF508:
	.ascii	"UINTMAX_MAX 18446744073709551615ULL\000"
.LASF332:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF184:
	.ascii	"__LDBL_NORM_MAX__ 1.1\000"
.LASF608:
	.ascii	"UNUSED_VARIABLE(X) ((void)(X))\000"
.LASF406:
	.ascii	"__ARM_ARCH_ISA_THUMB 2\000"
.LASF566:
	.ascii	"CONCAT_2(p1,p2) CONCAT_2_(p1, p2)\000"
.LASF334:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF153:
	.ascii	"__FLT_NORM_MAX__ 1.1\000"
.LASF622:
	.ascii	"long long int\000"
.LASF24:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF583:
	.ascii	"BIT_7 0x80\000"
.LASF49:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF137:
	.ascii	"__INTPTR_WIDTH__ 32\000"
.LASF286:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF15:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF279:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF397:
	.ascii	"__arm__ 1\000"
.LASF598:
	.ascii	"BIT_22 0x00400000\000"
.LASF74:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF175:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF564:
	.ascii	"MIN(a,b) ((a) < (b) ? (a) : (b))\000"
.LASF325:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF344:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF510:
	.ascii	"INT_LEAST16_MIN INT16_MIN\000"
.LASF604:
	.ascii	"BIT_28 0x10000000\000"
.LASF401:
	.ascii	"__GCC_ASM_FLAG_OUTPUTS__ 1\000"
.LASF574:
	.ascii	"CLR_BIT(W,B) ((W) &= (~(uint32_t)(1U << (B))))\000"
.LASF438:
	.ascii	"__ELF__ 1\000"
.LASF545:
	.ascii	"INT64_C(x) (x ##LL)\000"
.LASF108:
	.ascii	"__INT16_C(c) c\000"
.LASF377:
	.ascii	"__ARM_FEATURE_QBIT 1\000"
.LASF103:
	.ascii	"__UINT64_MAX__ 0xffffffffffffffffULL\000"
.LASF299:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF128:
	.ascii	"__INT_FAST32_MAX__ 0x7fffffff\000"
.LASF170:
	.ascii	"__DBL_EPSILON__ ((double)1.1)\000"
.LASF11:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF430:
	.ascii	"__ARM_FEATURE_COPROC 15\000"
.LASF0:
	.ascii	"__STDC__ 1\000"
.LASF480:
	.ascii	"__CTYPE_ALPHA (__CTYPE_UPPER | __CTYPE_LOWER)\000"
.LASF291:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF164:
	.ascii	"__DBL_MAX_EXP__ 1024\000"
.LASF14:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF563:
	.ascii	"LSB_16(a) ((a) & 0x00FF)\000"
.LASF609:
	.ascii	"UNUSED_PARAMETER(X) UNUSED_VARIABLE(X)\000"
.LASF129:
	.ascii	"__INT_FAST32_WIDTH__ 32\000"
.LASF436:
	.ascii	"__ARM_BF16_FORMAT_ALTERNATIVE\000"
.LASF35:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF612:
	.ascii	"NOT_IMPLEMENTED_ERROR 31\000"
.LASF71:
	.ascii	"__LONG_MAX__ 0x7fffffffL\000"
.LASF97:
	.ascii	"__INT16_MAX__ 0x7fff\000"
.LASF261:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF79:
	.ascii	"__SCHAR_WIDTH__ 8\000"
.LASF649:
	.ascii	"sensirion_common_bytes_to_uint16_t\000"
.LASF288:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF532:
	.ascii	"UINT_FAST64_MAX UINT64_MAX\000"
.LASF21:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF7:
	.ascii	"__GNUC_PATCHLEVEL__ 1\000"
.LASF592:
	.ascii	"BIT_16 0x00010000\000"
.LASF571:
	.ascii	"STRINGIFY(val) STRINGIFY_(val)\000"
.LASF437:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF249:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF76:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF301:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF650:
	.ascii	"GNU C99 10.2.1 20201103 (release) -fmessage-length="
	.ascii	"0 -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=soft "
	.ascii	"-mthumb -mtp=soft -munaligned-access -std=gnu99 -g3"
	.ascii	" -gpubnames -fomit-frame-pointer -fno-dwarf2-cfi-as"
	.ascii	"m -fno-builtin -ffunction-sections -fdata-sections "
	.ascii	"-fshort-enums -fno-common\000"
.LASF420:
	.ascii	"__ARM_NEON_FP\000"
.LASF457:
	.ascii	"NRFX_COREDEP_DELAY_US_LOOP_CYCLES 3\000"
.LASF2:
	.ascii	"__STDC_UTF_16__ 1\000"
.LASF247:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF464:
	.ascii	"__stdlib_H \000"
.LASF342:
	.ascii	"__TA_FBIT__ 63\000"
.LASF189:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF140:
	.ascii	"__GCC_IEC_559_COMPLEX 0\000"
.LASF102:
	.ascii	"__UINT32_MAX__ 0xffffffffUL\000"
.LASF199:
	.ascii	"__FLT32_NORM_MAX__ 1.1\000"
.LASF177:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF595:
	.ascii	"BIT_19 0x00080000\000"
.LASF271:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF373:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF599:
	.ascii	"BIT_23 0x00800000\000"
.LASF560:
	.ascii	"MSB_32(a) (((a) & 0xFF000000) >> 24)\000"
.LASF115:
	.ascii	"__INT_LEAST64_WIDTH__ 64\000"
.LASF30:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF289:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF87:
	.ascii	"__SIZE_WIDTH__ 32\000"
.LASF386:
	.ascii	"__ARM_FEATURE_MVE\000"
.LASF94:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF270:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF546:
	.ascii	"UINT64_C(x) (x ##ULL)\000"
.LASF82:
	.ascii	"__LONG_WIDTH__ 32\000"
.LASF236:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF39:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF237:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF449:
	.ascii	"BOARD_K5_SHT 1\000"
.LASF505:
	.ascii	"UINT64_MAX 18446744073709551615ULL\000"
.LASF423:
	.ascii	"__ARM_PCS 1\000"
.LASF319:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF627:
	.ascii	"uint16_t\000"
.LASF353:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF602:
	.ascii	"BIT_26 0x04000000\000"
.LASF470:
	.ascii	"__RAL_PTRDIFF_T int\000"
.LASF55:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF322:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF37:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF579:
	.ascii	"BIT_3 0x08\000"
.LASF389:
	.ascii	"__ARM_FEATURE_LDREX 7\000"
.LASF503:
	.ascii	"INT64_MIN (-9223372036854775807LL-1)\000"
.LASF95:
	.ascii	"__SIG_ATOMIC_WIDTH__ 32\000"
.LASF477:
	.ascii	"__CTYPE_CNTRL 0x20\000"
.LASF435:
	.ascii	"__ARM_FEATURE_BF16_VECTOR_ARITHMETIC\000"
.LASF69:
	.ascii	"__SHRT_MAX__ 0x7fff\000"
.LASF561:
	.ascii	"LSB_32(a) ((a) & 0x000000FF)\000"
.LASF413:
	.ascii	"__ARM_FP16_ARGS\000"
.LASF28:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF321:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF5:
	.ascii	"__GNUC__ 10\000"
.LASF512:
	.ascii	"INT_LEAST64_MIN INT64_MIN\000"
.LASF151:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF98:
	.ascii	"__INT32_MAX__ 0x7fffffffL\000"
.LASF587:
	.ascii	"BIT_11 0x0800\000"
.LASF85:
	.ascii	"__WINT_WIDTH__ 32\000"
.LASF530:
	.ascii	"UINT_FAST16_MAX UINT32_MAX\000"
.LASF539:
	.ascii	"INT8_C(x) (x)\000"
.LASF442:
	.ascii	"__SES_VERSION 54201\000"
.LASF326:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF636:
	.ascii	"value\000"
.LASF584:
	.ascii	"BIT_8 0x0100\000"
.LASF524:
	.ascii	"INT_FAST64_MIN INT64_MIN\000"
.LASF626:
	.ascii	"short int\000"
.LASF255:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF328:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF43:
	.ascii	"__INT32_TYPE__ long int\000"
.LASF224:
	.ascii	"__FLT32X_MIN_10_EXP__ (-307)\000"
.LASF434:
	.ascii	"__ARM_FEATURE_BF16_SCALAR_ARITHMETIC\000"
.LASF617:
	.ascii	"long int\000"
.LASF17:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF179:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF320:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF306:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF258:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF536:
	.ascii	"INTPTR_MIN INT32_MIN\000"
.LASF223:
	.ascii	"__FLT32X_MIN_EXP__ (-1021)\000"
.LASF495:
	.ascii	"INT8_MAX 127\000"
.LASF471:
	.ascii	"__CODE \000"
.LASF120:
	.ascii	"__UINT_LEAST32_MAX__ 0xffffffffUL\000"
.LASF582:
	.ascii	"BIT_6 0x40\000"
.LASF521:
	.ascii	"INT_FAST8_MIN INT8_MIN\000"
.LASF402:
	.ascii	"__thumb__ 1\000"
.LASF594:
	.ascii	"BIT_18 0x00040000\000"
.LASF190:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF41:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF75:
	.ascii	"__WINT_MAX__ 0xffffffffU\000"
.LASF182:
	.ascii	"__LDBL_DECIMAL_DIG__ 17\000"
.LASF597:
	.ascii	"BIT_21 0x00200000\000"
.LASF324:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF245:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF596:
	.ascii	"BIT_20 0x00100000\000"
.LASF447:
	.ascii	"APP_TIMER_V2_RTC1_ENABLED 1\000"
.LASF615:
	.ascii	"SENSIRION_NUM_WORDS(x) (sizeof(x) / SENSIRION_WORD_"
	.ascii	"SIZE)\000"
.LASF504:
	.ascii	"INT64_MAX 9223372036854775807LL\000"
.LASF135:
	.ascii	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF134:
	.ascii	"__UINT_FAST32_MAX__ 0xffffffffU\000"
.LASF533:
	.ascii	"PTRDIFF_MIN INT32_MIN\000"
.LASF241:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF114:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF318:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF213:
	.ascii	"__FLT64_MAX__ 1.1\000"
.LASF345:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF392:
	.ascii	"__ARM_FEATURE_SIMD32 1\000"
.LASF73:
	.ascii	"__WCHAR_MAX__ 0xffffffffU\000"
.LASF572:
	.ascii	"ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))\000"
.LASF18:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF497:
	.ascii	"UINT16_MAX 65535\000"
.LASF45:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF80:
	.ascii	"__SHRT_WIDTH__ 16\000"
.LASF410:
	.ascii	"__ARM_FP\000"
.LASF576:
	.ascii	"BIT_0 0x01\000"
.LASF631:
	.ascii	"source\000"
.LASF52:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF537:
	.ascii	"INTPTR_MAX INT32_MAX\000"
.LASF489:
	.ascii	"EXIT_SUCCESS 0\000"
.LASF47:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF178:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF228:
	.ascii	"__FLT32X_MAX__ 1.1\000"
.LASF31:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF294:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF529:
	.ascii	"UINT_FAST8_MAX UINT8_MAX\000"
.LASF409:
	.ascii	"__VFP_FP__ 1\000"
.LASF264:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF651:
	.ascii	"D:\\zepyth\\nRF5_SDK_17.0.2_d674dde\\examples\\ble_"
	.ascii	"peripheral\\ble_app_blinky_k5\\sensirion_common.c\000"
.LASF336:
	.ascii	"__HA_FBIT__ 7\000"
.LASF86:
	.ascii	"__PTRDIFF_WIDTH__ 32\000"
.LASF278:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF81:
	.ascii	"__INT_WIDTH__ 32\000"
.LASF370:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 2\000"
.LASF123:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF300:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF538:
	.ascii	"UINTPTR_MAX UINT32_MAX\000"
.LASF240:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF327:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF330:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF337:
	.ascii	"__HA_IBIT__ 8\000"
.LASF363:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2\000"
.LASF1:
	.ascii	"__STDC_VERSION__ 199901L\000"
.LASF156:
	.ascii	"__FLT_DENORM_MIN__ 1.1\000"
.LASF628:
	.ascii	"int32_t\000"
.LASF4:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF586:
	.ascii	"BIT_10 0x0400\000"
.LASF136:
	.ascii	"__INTPTR_MAX__ 0x7fffffff\000"
.LASF169:
	.ascii	"__DBL_MIN__ ((double)1.1)\000"
.LASF408:
	.ascii	"__SOFTFP__ 1\000"
.LASF446:
	.ascii	"APP_TIMER_V2 1\000"
.LASF229:
	.ascii	"__FLT32X_NORM_MAX__ 1.1\000"
.LASF453:
	.ascii	"INITIALIZE_USER_SECTIONS 1\000"
.LASF647:
	.ascii	"sensirion_common_bytes_to_int16_t\000"
.LASF499:
	.ascii	"INT16_MAX 32767\000"
.LASF518:
	.ascii	"UINT_LEAST16_MAX UINT16_MAX\000"
.LASF550:
	.ascii	"WCHAR_MAX __WCHAR_MAX__\000"
.LASF509:
	.ascii	"INT_LEAST8_MIN INT8_MIN\000"
.LASF368:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 1\000"
.LASF359:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1\000"
.LASF149:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF13:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF64:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF620:
	.ascii	"unsigned char\000"
.LASF468:
	.ascii	"__RAL_SIZE_T unsigned\000"
.LASF500:
	.ascii	"UINT32_MAX 4294967295UL\000"
.LASF65:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF143:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF201:
	.ascii	"__FLT32_EPSILON__ 1.1\000"
.LASF642:
	.ascii	"sensirion_common_int32_t_to_bytes\000"
.LASF456:
	.ascii	"NRF52_PAN_74 1\000"
.LASF242:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF448:
	.ascii	"ACC_SENSOR_ENABLE 1\000"
.LASF112:
	.ascii	"__INT_LEAST32_WIDTH__ 32\000"
.LASF490:
	.ascii	"EXIT_FAILURE 1\000"
.LASF63:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF523:
	.ascii	"INT_FAST32_MIN INT32_MIN\000"
.LASF187:
	.ascii	"__LDBL_DENORM_MIN__ 1.1\000"
.LASF395:
	.ascii	"__ARM_ARCH_PROFILE\000"
.LASF463:
	.ascii	"SENSIRION_CONFIG_H \000"
.LASF32:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF549:
	.ascii	"WCHAR_MIN __WCHAR_MIN__\000"
.LASF311:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF540:
	.ascii	"UINT8_C(x) (x ##U)\000"
.LASF548:
	.ascii	"UINTMAX_C(x) (x ##ULL)\000"
.LASF246:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF365:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 2\000"
.LASF481:
	.ascii	"__CTYPE_ALNUM (__CTYPE_UPPER | __CTYPE_LOWER | __CT"
	.ascii	"YPE_DIGIT)\000"
.LASF351:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF250:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF148:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF208:
	.ascii	"__FLT64_MIN_EXP__ (-1021)\000"
.LASF142:
	.ascii	"__FLT_EVAL_METHOD_TS_18661_3__ 0\000"
.LASF173:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF167:
	.ascii	"__DBL_MAX__ ((double)1.1)\000"
.LASF59:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF570:
	.ascii	"STRINGIFY_(val) #val\000"
.LASF159:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF16:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF36:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF553:
	.ascii	"__stdbool_h \000"
.LASF89:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF415:
	.ascii	"__ARM_FEATURE_FP16_VECTOR_ARITHMETIC\000"
.LASF400:
	.ascii	"__APCS_32__ 1\000"
.LASF216:
	.ascii	"__FLT64_EPSILON__ 1.1\000"
.LASF525:
	.ascii	"INT_FAST8_MAX INT8_MAX\000"
.LASF632:
	.ascii	"destination\000"
.LASF581:
	.ascii	"BIT_5 0x20\000"
.LASF48:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF507:
	.ascii	"INTMAX_MAX 9223372036854775807LL\000"
.LASF235:
	.ascii	"__FLT32X_HAS_QUIET_NAN__ 1\000"
.LASF165:
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
.LASF214:
	.ascii	"__FLT64_NORM_MAX__ 1.1\000"
.LASF621:
	.ascii	"short unsigned int\000"
.LASF361:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 2\000"
.LASF343:
	.ascii	"__TA_IBIT__ 64\000"
.LASF316:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF234:
	.ascii	"__FLT32X_HAS_INFINITY__ 1\000"
.LASF54:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF125:
	.ascii	"__INT_FAST8_WIDTH__ 32\000"
.LASF147:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF476:
	.ascii	"__CTYPE_PUNCT 0x10\000"
.LASF433:
	.ascii	"__ARM_FEATURE_MATMUL_INT8\000"
.LASF181:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF421:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF111:
	.ascii	"__INT32_C(c) c ## L\000"
.LASF556:
	.ascii	"false 0\000"
.LASF638:
	.ascii	"u32_value\000"
.LASF180:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF226:
	.ascii	"__FLT32X_MAX_10_EXP__ 308\000"
.LASF138:
	.ascii	"__UINTPTR_MAX__ 0xffffffffU\000"
.LASF172:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF382:
	.ascii	"__ARM_FEATURE_CRC32\000"
.LASF196:
	.ascii	"__FLT32_MAX_10_EXP__ 38\000"
.LASF635:
	.ascii	"sensirion_common_float_to_bytes\000"
.LASF378:
	.ascii	"__ARM_FEATURE_SAT 1\000"
.LASF259:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF422:
	.ascii	"__ARM_ARCH_7EM__ 1\000"
.LASF502:
	.ascii	"INT32_MIN (-2147483647L-1)\000"
.LASF110:
	.ascii	"__INT_LEAST32_MAX__ 0x7fffffffL\000"
.LASF183:
	.ascii	"__LDBL_MAX__ 1.1\000"
.LASF474:
	.ascii	"__CTYPE_DIGIT 0x04\000"
.LASF90:
	.ascii	"__UINTMAX_MAX__ 0xffffffffffffffffULL\000"
.LASF40:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF485:
	.ascii	"__MAX_CATEGORY 5\000"
.LASF535:
	.ascii	"SIZE_MAX INT32_MAX\000"
.LASF268:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF215:
	.ascii	"__FLT64_MIN__ 1.1\000"
.LASF417:
	.ascii	"__ARM_FEATURE_FMA 1\000"
.LASF275:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF188:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF568:
	.ascii	"CONCAT_3(p1,p2,p3) CONCAT_3_(p1, p2, p3)\000"
.LASF118:
	.ascii	"__UINT_LEAST16_MAX__ 0xffff\000"
.LASF388:
	.ascii	"__ARM_FEATURE_LDREX\000"
.LASF315:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF281:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF157:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF131:
	.ascii	"__INT_FAST64_WIDTH__ 64\000"
.LASF166:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
	.ident	"GCC: (GNU) 10.2.1 20201103 (release)"
