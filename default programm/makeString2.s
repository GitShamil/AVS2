	.file	"makeString.c"
	.intel_syntax noprefix
	.text
	.globl	makeString
	.type	makeString, @function
makeString:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -4[rbp], 0
	mov	DWORD PTR -8[rbp], 0
	mov	BYTE PTR -9[rbp], 0
	jmp	.L2
.L12:
	cmp	DWORD PTR -4[rbp], 0
	je	.L3
	mov	eax, DWORD PTR -4[rbp]
	sub	eax, 1
	cdqe
	lea	rdx, A[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 64
	jle	.L4
	mov	eax, DWORD PTR -4[rbp]
	sub	eax, 1
	cdqe
	lea	rdx, A[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 90
	jle	.L5
.L4:
	mov	eax, DWORD PTR -4[rbp]
	sub	eax, 1
	cdqe
	lea	rdx, A[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 96
	jle	.L3
	mov	eax, DWORD PTR -4[rbp]
	sub	eax, 1
	cdqe
	lea	rdx, A[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 122
	jle	.L5
.L3:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, A[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 64
	jle	.L13
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, A[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 90
	jg	.L13
	mov	BYTE PTR -9[rbp], 1
	jmp	.L13
.L5:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, A[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 64
	jle	.L8
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, A[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 90
	jle	.L7
.L8:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, A[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 96
	jle	.L9
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, A[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 122
	jle	.L7
.L9:
	cmp	BYTE PTR -9[rbp], 0
	je	.L10
	mov	eax, DWORD PTR -8[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -8[rbp], edx
	cdqe
	lea	rdx, B[rip]
	mov	BYTE PTR [rax+rdx], 32
.L10:
	mov	BYTE PTR -9[rbp], 0
	jmp	.L7
.L13:
	nop
.L7:
	cmp	BYTE PTR -9[rbp], 0
	je	.L11
	mov	eax, DWORD PTR -8[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -8[rbp], edx
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	lea	rcx, A[rip]
	movzx	edx, BYTE PTR [rdx+rcx]
	cdqe
	lea	rcx, B[rip]
	mov	BYTE PTR [rax+rcx], dl
.L11:
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, A[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, -1
	jne	.L12
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, B[rip]
	mov	BYTE PTR [rax+rdx], -1
	nop
	pop	rbp
	ret
	.size	makeString, .-makeString
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
