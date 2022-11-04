	.file	"makeString.c"
	.intel_syntax noprefix
	.text
	.globl	makeString
	.type	makeString, @function
makeString:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	r13d, 0				# j
	mov	r14d, 0				# h	
	mov	r15b, 0				# read
	jmp	.L2
.L12:
	cmp	r13d, 0				# compare j and 0
	je	.L3				# if j = 0
	mov	eax, r13d
	sub	eax, 1				# j = j-1
	cdqe
	lea	rdx, A[rip]
	movzx	ebx, BYTE PTR [rax+rdx]		# put in ebx A[j-1] instead of eax (ebx = A[j-1])
	cmp	bl, 64				# compare A[j-1] and 'A'
	jle	.L4
	cmp	bl, 90                          # compare A[j-1] and 'Z'
	jle	.L5
.L4:
	cmp	bl, 96				# compare A[j-1] and 'a'
	jle	.L3
	cmp	bl, 122				# compare A[j-1] and 'z'
	jle	.L5
.L3:
	mov	eax, r13d
	cdqe
	lea	rdx, A[rip]
	movzx	ebx, BYTE PTR [rax+rdx]
	cmp	bl, 64				# ebx = A[j] # compare A[j] and 'A'
	jle	.L13
	cmp	bl, 90				# compare A[j] and 'Z'
	jg	.L13
	mov	r15b, 1				# read = true
	jmp	.L13
.L5:
	mov	eax, r13d	
	cdqe
	lea	rdx, A[rip]
	movzx	ebx, BYTE PTR [rax+rdx]
	cmp	bl, 64				# ebx = A[j] # compare A[j] and 'A'
	jle	.L8
	cmp	bl, 90				# compare A[j] and 'Z'
	jle	.L7
.L8:
	cmp	bl, 96				# compare A[j] and 'a'
	jle	.L9
	cmp	bl, 122				# compare A[j] and 'z'
	jle	.L7
.L9:
	cmp	r15b, 0				# compare read and false
	je	.L10				# if read == false then don't do B[h++]=' '
	mov	eax, r14d			# do B[h++]=' '
	lea	edx, 1[rax]
	mov	r14d, edx
	cdqe
	lea	rdx, B[rip]
	mov	BYTE PTR [rax+rdx], 32
.L10:
	mov	r15b, 0				# read = false
	jmp	.L7
.L13:
	nop
.L7:
	cmp	r15b, 0				#compare read and 0
	je	.L11				# if read = false than don't do B[h++] =A[j]
	lea	rcx, B[rip]
	mov	BYTE PTR [r14+rcx], bl		# B[h++] = bl = A[j]
	add 	r14d, 1
.L11:
	add	r13d, 1				# ++j
.L2:
	mov	eax, r13d
	cdqe
	lea	rdx, A[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, -1
	jne	.L12				#continue cycle while  A[j] != EOF
	mov	eax, r14d
	cdqe
	lea	rdx, B[rip]
	mov	BYTE PTR [rax+rdx], -1
	nop
	pop	rbp
	ret
