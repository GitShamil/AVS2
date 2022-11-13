	.file	"makeString.c"
	.intel_syntax noprefix
	.text
	.section	.text.makeString,"ax",@progbits
	.globl	makeString
	.type	makeString, @function
makeString:
	endbr64
	lea	r9, A[rip]
	xor	edx, edx
	xor	edi, edi
	xor	eax, eax
	lea	r8, B[rip]
	lea	r10, -1[r9]
.L2:
	mov	sil, BYTE PTR [r9+rdx]
	cmp	sil, -1
	je	.L19
	test	rdx, rdx
	je	.L3
	mov	cl, BYTE PTR [rdx+r10]
	and	ecx, -33
	sub	ecx, 65
	cmp	cl, 25
	jbe	.L4
.L3:
	lea	ecx, -65[rsi]
	cmp	cl, 25
	jbe	.L5
	jmp	.L6
.L4:
	mov	ecx, esi
	and	ecx, -33
	sub	ecx, 65
	cmp	cl, 25
	jbe	.L6
	test	dil, dil
	je	.L7
	movsx	rcx, eax
	xor	edi, edi
	inc	eax
	mov	BYTE PTR [r8+rcx], 32
	jmp	.L7
.L6:
	test	dil, dil
	je	.L7
.L5:
	movsx	rcx, eax
	mov	dil, 1
	inc	eax
	mov	BYTE PTR [r8+rcx], sil
.L7:
	inc	rdx
	jmp	.L2
.L19:
	cdqe
	lea	rdx, B[rip]
	mov	BYTE PTR [rdx+rax], -1
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
