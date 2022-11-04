	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	A
	.bss
	.align 32
	.type	A, @object
	.size	A, 100
A:
	.zero	100
	.globl	B
	.align 32
	.type	B, @object
	.size	B, 100
B:
	.zero	100
	.section	.rodata
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
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	DWORD PTR -52[rbp], edi
	mov	QWORD PTR -64[rbp], rsi
	cmp	DWORD PTR -52[rbp], 1
	jle	.L2
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	test	eax, eax
	jne	.L3
.L2:
	mov	DWORD PTR -4[rbp], 0
.L6:
	cmp	DWORD PTR -4[rbp], 99
	jle	.L4
	mov	esi, 100
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L5
.L4:
	call	getchar@PLT
	mov	ecx, eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, A[rip]
	mov	BYTE PTR [rax+rdx], cl
	add	DWORD PTR -4[rbp], 1
	mov	eax, DWORD PTR -4[rbp]
	sub	eax, 1
	cdqe
	lea	rdx, A[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, -1
	jne	.L6
	jmp	.L7
.L3:
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 1
	jne	.L8
	lea	rax, .LC1[rip]
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	DWORD PTR -4[rbp], 0
.L10:
	cmp	DWORD PTR -4[rbp], 99
	jle	.L9
	mov	esi, 100
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L5
.L9:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	getc@PLT
	mov	ecx, eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, A[rip]
	mov	BYTE PTR [rax+rdx], cl
	add	DWORD PTR -4[rbp], 1
	mov	eax, DWORD PTR -4[rbp]
	sub	eax, 1
	cdqe
	lea	rdx, A[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, -1
	jne	.L10
	jmp	.L7
.L8:
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 2
	jne	.L7
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	mov	edx, eax
	neg	edx
	cmovns	eax, edx
	mov	ecx, eax
	movsx	rax, ecx
	imul	rax, rax, 1717986919
	shr	rax, 32
	sar	eax, 4
	mov	esi, ecx
	sar	esi, 31
	sub	eax, esi
	mov	edx, eax
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	sub	ecx, eax
	mov	edx, ecx
	lea	eax, 10[rdx]
	mov	DWORD PTR -8[rbp], eax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L11
.L12:
	call	rand@PLT
	mov	edx, eax
	neg	edx
	cmovns	eax, edx
	movsx	rdx, eax
	imul	rdx, rdx, -2113396605
	shr	rdx, 32
	add	edx, eax
	sar	edx, 5
	mov	esi, eax
	sar	esi, 31
	mov	ecx, edx
	sub	ecx, esi
	mov	edx, ecx
	sal	edx, 6
	sub	edx, ecx
	sub	eax, edx
	mov	ecx, eax
	mov	eax, ecx
	add	eax, 60
	mov	ecx, eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, A[rip]
	mov	BYTE PTR [rax+rdx], cl
	add	DWORD PTR -4[rbp], 1
.L11:
	mov	eax, DWORD PTR -8[rbp]
	sub	eax, 1
	cmp	DWORD PTR -4[rbp], eax
	jl	.L12
	mov	eax, DWORD PTR -8[rbp]
	sub	eax, 1
	cdqe
	lea	rdx, A[rip]
	mov	BYTE PTR [rax+rdx], -1
.L7:
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L13
.L14:
	mov	eax, 0
	call	makeString@PLT
	add	DWORD PTR -4[rbp], 1
.L13:
	cmp	DWORD PTR -4[rbp], 49999999
	jle	.L14
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	sub	rax, QWORD PTR -24[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC3[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0
	cmp	DWORD PTR -52[rbp], 1
	jle	.L15
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 1
	jne	.L15
	lea	rax, .LC4[rip]
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -48[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC6[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L16
.L17:
	mov	eax, DWORD PTR -4[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -4[rbp], edx
	cdqe
	lea	rdx, B[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	movsx	eax, al
	mov	rdx, QWORD PTR -48[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	fputc@PLT
.L16:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, B[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, -1
	jne	.L17
	mov	eax, 0
	jmp	.L5
.L15:
	mov	rax, QWORD PTR -40[rbp]
	movq	xmm0, rax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L18
.L19:
	mov	eax, DWORD PTR -4[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -4[rbp], edx
	cdqe
	lea	rdx, B[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	movsx	eax, al
	mov	edi, eax
	call	putchar@PLT
.L18:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, B[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, -1
	jne	.L19
	mov	edi, 10
	call	putchar@PLT
	mov	eax, 0
.L5:
	leave
	ret
	.size	main, .-main
	.section	.rodata
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
