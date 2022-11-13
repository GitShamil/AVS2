	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Incorrect length > %d\n"
.LC1:
	.string	"r"
.LC2:
	.string	"input.txt"
.LC4:
	.string	"w"
.LC5:
	.string	"output.txt"
.LC6:
	.string	"time spent: %f sec\n"
	.section	.text.startup.main,"ax",@progbits
	.globl	main
	.type	main, @function
main:
	endbr64
	push	r14
	push	r13
	push	r12
	mov	r12d, edi
	push	rbp
	mov	rbp, rsi
	push	rbx
	sub	rsp, 16
	dec	edi
	jle	.L2
	mov	rdi, QWORD PTR 8[rsi]
	call	atoi@PLT
	test	eax, eax
	jne	.L30
.L2:
	lea	rbx, A[rip]
	lea	r13, 100[rbx]
.L4:
	call	getchar@PLT
	mov	BYTE PTR [rbx], al
	inc	al
	je	.L7
	inc	rbx
	cmp	r13, rbx
	jne	.L4
.L10:
	mov	edx, 100
	lea	rsi, .LC0[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, 1
	jmp	.L1
.L30:
	cmp	eax, 1
	jne	.L8
	lea	rsi, .LC1[rip]
	lea	rdi, .LC2[rip]
	call	fopen@PLT
	lea	rbx, A[rip]
	mov	r14, rax
	lea	r13, 100[rbx]
.L9:
	mov	rdi, r14
	call	getc@PLT
	mov	BYTE PTR [rbx], al
	inc	al
	je	.L7
	inc	rbx
	cmp	r13, rbx
	jne	.L9
	jmp	.L10
.L8:
	cmp	eax, 2
	jne	.L7
	xor	edi, edi
	lea	r14, A[rip]
	call	time@PLT
	mov	r13, r14
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	mov	ecx, 40
	mov	edx, eax
	neg	edx
	cmovns	eax, edx
	cdq
	idiv	ecx
	lea	ebx, 9[rdx]
.L13:
	mov	eax, r13d
	sub	eax, r14d
	cmp	ebx, eax
	jle	.L31
	call	rand@PLT
	mov	ecx, 63
	mov	edx, eax
	neg	edx
	cmovns	eax, edx
	inc	r13
	cdq
	idiv	ecx
	add	edx, 60
	mov	BYTE PTR -1[r13], dl
	jmp	.L13
.L31:
	movsx	rbx, ebx
	mov	BYTE PTR [r14+rbx], -1
.L7:
	call	clock@PLT
	mov	r13d, 50000000
	mov	rbx, rax
.L15:
	xor	eax, eax
	call	makeString@PLT
	dec	r13d
	jne	.L15
	call	clock@PLT
	sub	rax, rbx
	dec	r12d
	lea	r12, .LC6[rip]
	cvtsi2sd	xmm0, rax
	divsd	xmm0, QWORD PTR .LC3[rip]
	jle	.L16
	mov	rdi, QWORD PTR 8[rbp]
	movsd	QWORD PTR 8[rsp], xmm0
	call	atoi@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	dec	eax
	jne	.L16
	lea	rsi, .LC4[rip]
	lea	rdi, .LC5[rip]
	call	fopen@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	mov	rdx, r12
	mov	esi, 1
	mov	rdi, rax
	mov	rbx, rax
	lea	rbp, B[rip]
	mov	al, 1
	call	__fprintf_chk@PLT
.L17:
	movsx	edi, BYTE PTR 0[rbp]
	inc	rbp
	cmp	dil, -1
	je	.L28
	mov	rsi, rbx
	call	fputc@PLT
	jmp	.L17
.L16:
	mov	rsi, r12
	mov	edi, 1
	mov	al, 1
	call	__printf_chk@PLT
	lea	rbx, B[rip]
.L19:
	movsx	edi, BYTE PTR [rbx]
	inc	rbx
	cmp	dil, -1
	je	.L32
	call	putchar@PLT
	jmp	.L19
.L32:
	mov	edi, 10
	call	putchar@PLT
.L28:
	xor	eax, eax
.L1:
	add	rsp, 16
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	ret
	.size	main, .-main
	.globl	B
	.bss
	.align 32
	.type	B, @object
	.size	B, 100
B:
	.zero	100
	.globl	A
	.align 32
	.type	A, @object
	.size	A, 100
A:
	.zero	100
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
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
