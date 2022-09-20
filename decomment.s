	.arch armv8-a
	.file	"decomment.c"
	.text
	.align	2
	.global	handleBase
	.type	handleBase, %function
handleBase:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	str	wzr, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L2
	mov	w0, 2
	str	w0, [sp, 44]
	b	.L3
.L2:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L4
	mov	w0, 4
	str	w0, [sp, 44]
	b	.L3
.L4:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L3
	mov	w0, 5
	str	w0, [sp, 44]
.L3:
	ldr	w0, [sp, 44]
	cmp	w0, 2
	beq	.L5
	ldr	w0, [sp, 28]
	bl	putchar
.L5:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	handleBase, .-handleBase
	.align	2
	.global	handlePotentialComment
	.type	handlePotentialComment, %function
handlePotentialComment:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	str	wzr, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L8
	mov	w0, 32
	bl	putchar
	mov	w0, 1
	str	w0, [sp, 44]
	b	.L9
.L8:
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L10
	mov	w0, 47
	bl	putchar
	mov	w0, 2
	str	w0, [sp, 44]
	b	.L9
.L10:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L11
	mov	w0, 4
	str	w0, [sp, 44]
	b	.L9
.L11:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L9
	mov	w0, 5
	str	w0, [sp, 44]
.L9:
	ldr	w0, [sp, 44]
	cmp	w0, 1
	beq	.L12
	ldr	w0, [sp, 44]
	cmp	w0, 2
	beq	.L12
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
.L12:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	handlePotentialComment, .-handlePotentialComment
	.align	2
	.global	handleComment
	.type	handleComment, %function
handleComment:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 1
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L15
	mov	w0, 3
	str	w0, [sp, 44]
	b	.L16
.L15:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L16
	mov	w0, 10
	bl	putchar
.L16:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	handleComment, .-handleComment
	.align	2
	.global	handlePotentialOutComment
	.type	handlePotentialOutComment, %function
handlePotentialOutComment:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 1
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L19
	str	wzr, [sp, 44]
	b	.L20
.L19:
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L21
	mov	w0, 3
	str	w0, [sp, 44]
	b	.L20
.L21:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L20
	mov	w0, 10
	bl	putchar
.L20:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	handlePotentialOutComment, .-handlePotentialOutComment
	.align	2
	.global	handleStrLiteral
	.type	handleStrLiteral, %function
handleStrLiteral:
.LFB4:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 4
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L24
	mov	w0, 6
	str	w0, [sp, 44]
	b	.L25
.L24:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L25
	str	wzr, [sp, 44]
.L25:
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	handleStrLiteral, .-handleStrLiteral
	.align	2
	.global	handleStrBackslash
	.type	handleStrBackslash, %function
handleStrBackslash:
.LFB5:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	handleStrBackslash, .-handleStrBackslash
	.align	2
	.global	handleChrLiteral
	.type	handleChrLiteral, %function
handleChrLiteral:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 5
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L30
	mov	w0, 7
	str	w0, [sp, 44]
	b	.L31
.L30:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L31
	str	wzr, [sp, 44]
.L31:
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	handleChrLiteral, .-handleChrLiteral
	.align	2
	.global	handleChrBackslash
	.type	handleChrBackslash, %function
handleChrBackslash:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 5
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	handleChrBackslash, .-handleChrBackslash
	.section	.rodata
	.align	3
.LC0:
	.string	"Error: line %i: unterminated comment\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	wzr, [sp, 44]
	str	wzr, [sp, 32]
	mov	w0, 1
	str	w0, [sp, 40]
	b	.L36
.L48:
	ldr	w0, [sp, 44]
	cmp	w0, 3
	beq	.L37
	ldr	w0, [sp, 44]
	cmp	w0, 3
	bhi	.L38
	ldr	w0, [sp, 44]
	cmp	w0, 1
	beq	.L39
	ldr	w0, [sp, 44]
	cmp	w0, 1
	bhi	.L40
	b	.L53
.L38:
	ldr	w0, [sp, 44]
	cmp	w0, 5
	beq	.L42
	ldr	w0, [sp, 44]
	cmp	w0, 5
	bcc	.L43
	ldr	w0, [sp, 44]
	cmp	w0, 6
	beq	.L44
	ldr	w0, [sp, 44]
	cmp	w0, 7
	beq	.L45
	b	.L46
.L53:
	ldr	w0, [sp, 28]
	bl	handleBase
	str	w0, [sp, 44]
	b	.L46
.L40:
	ldr	w0, [sp, 28]
	bl	handlePotentialComment
	str	w0, [sp, 44]
	ldr	w0, [sp, 44]
	cmp	w0, 1
	bne	.L54
	ldr	w0, [sp, 40]
	str	w0, [sp, 36]
	b	.L54
.L39:
	ldr	w0, [sp, 28]
	bl	handleComment
	str	w0, [sp, 44]
	b	.L46
.L37:
	ldr	w0, [sp, 28]
	bl	handlePotentialOutComment
	str	w0, [sp, 44]
	b	.L46
.L43:
	ldr	w0, [sp, 28]
	bl	handleStrLiteral
	str	w0, [sp, 44]
	b	.L46
.L42:
	ldr	w0, [sp, 28]
	bl	handleChrLiteral
	str	w0, [sp, 44]
	b	.L46
.L44:
	ldr	w0, [sp, 28]
	bl	handleStrBackslash
	str	w0, [sp, 44]
	b	.L46
.L45:
	ldr	w0, [sp, 28]
	bl	handleChrBackslash
	str	w0, [sp, 44]
	b	.L46
.L54:
	nop
.L46:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L36
	ldr	w0, [sp, 40]
	add	w0, w0, 1
	str	w0, [sp, 40]
.L36:
	bl	getchar
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmn	w0, #1
	bne	.L48
	ldr	w0, [sp, 44]
	cmp	w0, 2
	bne	.L49
	mov	w0, 47
	bl	putchar
.L49:
	ldr	w0, [sp, 44]
	cmp	w0, 1
	beq	.L50
	ldr	w0, [sp, 44]
	cmp	w0, 3
	bne	.L51
.L50:
	adrp	x0, stderr
	add	x0, x0, :lo12:stderr
	ldr	x3, [x0]
	ldr	w2, [sp, 36]
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x3
	bl	fprintf
	mov	w0, 1
	bl	exit
.L51:
	ldr	w0, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 8.5.0 20210514 (Red Hat 8.5.0-10)"
	.section	.note.GNU-stack,"",@progbits
