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
	mov	DWORD PTR -52[rbp], edi		#argc
	mov	QWORD PTR -64[rbp], rsi		#argv
	cmp	edi, 1				# compare argc and 1, if argc<=1 then input from console
	jle	.L2
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
	mov	rdi, QWORD PTR [rax]		# rax = argv[1]
	call	atoi@PLT			# eax = argv[1]
	test	eax, eax		
	jne	.L3				# if abs(argv[1]) !=0
.L2:						# input from console
	mov	DWORD PTR -4[rbp], 0		# i = 0
.L6:
	cmp	DWORD PTR -4[rbp], 99		
	jle	.L4				# i <= 99
	mov	esi, 100
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L5
.L4:
	call	getchar@PLT			# getchar
	mov	ecx, eax			# ecx = new char
	mov	eax, DWORD PTR -4[rbp]		# eax = i
	cdqe
	lea	rdx, A[rip]			# rdx = *A
	mov	BYTE PTR [rax+rdx], cl		# A[i] = ecx = new char
	add	DWORD PTR -4[rbp], 1		# i++
	mov	eax, DWORD PTR -4[rbp]		# eax = i
	sub	eax, 1				# eax = eax - 1
	cdqe
	movzx	eax, BYTE PTR [rax+rdx]		# eax = A[i]
	cmp	al, -1				# cmp eax and EOF
	jne	.L6				# eax != EOF then go do next stage of cycle
	jmp	.L7				# end of cicle
.L3:						
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
	mov	rdi, QWORD PTR [rax]
	call	atoi@PLT
	cmp	eax, 1
	jne	.L8				# if atoi(argv[1]) != 1 then do input from random
	lea	rsi, .LC1[rip]
	lea	rdi, .LC2[rip]
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax		# input 
	mov	DWORD PTR -4[rbp], 0		# i = 0
.L10:						# it is the same cycle of input data but from input.txt
	cmp	DWORD PTR -4[rbp], 99		
	jle	.L9				# i <= 99
	mov	esi, 100			# if i>99 than exception
	lea	rax, .LC0[rip]			
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L5
.L9:						
	mov	rdi, QWORD PTR -16[rbp]		# rdi = input	
	call	getc@PLT			# rax = char from input
	mov	ecx, eax			# rcx = char
	mov	eax, DWORD PTR -4[rbp]		# rax = i
	cdqe
	lea	rdx, A[rip]			# rdx = *A
	mov	BYTE PTR [rax+rdx], cl		# A[i] = rcx = new char
	add	DWORD PTR -4[rbp], 1		# i ++
	cdqe
	lea	rdx, A[rip]			# rdx = A[i-1]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, -1				# compare A[i-1] and EOF
	jne	.L10				# A[i-1] != EOF
	jmp	.L7
.L8:
	mov	rax, QWORD PTR -64[rbp]		# check if we do random input
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 2
	jne	.L7
	mov	edi, 0
	call	time@PLT			# rax = time
	mov	edi, eax			# rdi = time
	call	srand@PLT			# srand
	call	rand@PLT
	mov	edx, eax			# edx = rand()
	neg	edx				# do length = (rand()%40)+10;
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
	mov	DWORD PTR -8[rbp], eax		# length = eax and length = -8[rbp]
	mov	DWORD PTR -4[rbp], 0		# i = 0
	jmp	.L11
.L12:
	call	rand@PLT
	mov	edx, eax			# rax = rand()
	neg	edx				# do rand() and abs()  for calculate needed number
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
	mov	ecx, eax			# ecx = needed number
	mov	eax, DWORD PTR -4[rbp]		# rax = i
	cdqe
	lea	rdx, A[rip]			# rdx = *A
	mov	BYTE PTR [rax+rdx], cl		# A[i] = ecx
	add	DWORD PTR -4[rbp], 1		# i++
.L11:
	mov	eax, DWORD PTR -8[rbp]		# eax = length
	sub	eax, 1				# eax = length -1
	cmp	DWORD PTR -4[rbp], eax		# compare i and length -1
	jl	.L12				# if i<length -1 then do cycle
	mov	eax, DWORD PTR -8[rbp]		
	sub	eax, 1
	cdqe
	lea	rdx, A[rip]
	mov	BYTE PTR [rax+rdx], -1		# A[length-1] = EOF(-1)
.L7:
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax		# begin = rax
	mov	r12d, 0				# i = 0	 (i = r12d)
	jmp	.L13
.L14:
	mov	eax, 0
	call	makeString@PLT			# makeString()
	add	r12d, 1
.L13:
	cmp	r12d, 49999999			# compare i and 49999999 (condition of cycle)
	jle	.L14
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax		# end = rax
	mov	rax, QWORD PTR -32[rbp]
	sub	rax, QWORD PTR -24[rbp]
	pxor	xmm0, xmm0			# calculate time_spent
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC3[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0	# -40[rbp] = time_spent
	cmp	DWORD PTR -52[rbp], 1
	jle	.L15				# argc <=1  output to console
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 1
	jne	.L15				# output to console	
	lea	rsi, .LC4[rip]			
	lea	rax, .LC5[rip]
	mov	rdi, rax			# rdi = line
	call	fopen@PLT			# open file for output because rsi = "w"
	mov	QWORD PTR -48[rbp], rax		
	movq	xmm0, QWORD PTR -40[rbp]   	# xmm0 = time_spent
	lea	rdx, .LC6[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT			# output time_spent
	mov	DWORD PTR -4[rbp], 0		# i =0
	jmp	.L16
.L17:
	mov	eax, DWORD PTR -4[rbp]		# eax = i
	lea	edx, 1[rax]			# edx = i+1
	mov	DWORD PTR -4[rbp], edx		# i = i +1
	cdqe
	lea	rdx, B[rip]			# rdx = *B
	movzx	eax, BYTE PTR [rax+rdx]		# eax = B[i]
	mov	rsi, QWORD PTR -48[rbp]		# rsi = output			
	mov	edi, eax			# rdi = B[i]
	call	fputc@PLT			# put char to file
.L16:
	mov	eax, DWORD PTR -4[rbp]		# eax = i
	cdqe
	lea	rdx, B[rip]			# rdx = *B
	movzx	eax, BYTE PTR [rax+rdx]		# eax = B[i]
	cmp	al, -1				# comapre B[i] and EOF
	jne	.L17				# if B[i] != EOF then do cycle
	mov	eax, 0
	jmp	.L5
.L15:						# console output
	movq	xmm0, QWORD PTR -40[rbp]	# xmm0 = time_spent
	lea	rdi, .LC6[rip]			
	mov	eax, 1
	call	printf@PLT			# print time
	mov	DWORD PTR -4[rbp], 0		# i = 0
	jmp	.L18
.L19:
	mov	eax, DWORD PTR -4[rbp]		# eax = i
	lea	edx, 1[rax]			# edx = eax +1
	mov	DWORD PTR -4[rbp], edx		# i = i+1
	cdqe
	lea	rdx, B[rip]
	movzx	edi, BYTE PTR [rax+rdx]		# edi = A[i]
	call	putchar@PLT
.L18:						# rax = i
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, B[rip]			# rdx = *B
	movzx	eax, BYTE PTR [rax+rdx]		# eax = B[i]
	cmp	al, -1				# compare eax and EOF
	jne	.L19				# eax != eof 
	mov	edi, 10
	call	putchar@PLT
	mov	eax, 0
.L5:
	leave
	ret
.LC3:
	.long	0
	.long	1093567616

