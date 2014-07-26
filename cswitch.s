	.file	"switch.c"
	.section	.rodata
.LC0:
	.string	"Insert a c b: "
.LC1:
	.string	"%d %c %d"
.LC2:
	.string	"Invalid input!"
.LC3:
	.string	"The answer is: %d\n"

	.text

	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$48, %esp

	movl	$.LC0, %eax
	movl	%eax, (%esp)
	call	printf

	movl	$.LC1, %eax
	leal	36(%esp), %edx  # variable b int
	movl	%edx, 12(%esp)
	leal	47(%esp), %edx  # variable c char 
	movl	%edx, 8(%esp)
	leal	32(%esp), %edx  # variable a int
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf

	movl	$-1, 40(%esp)   # variable ans int

	movzbl	47(%esp), %eax
	movsbl	%al, %eax

  # switch case being handled as a series of comaprisions
	cmpl	$43, %eax
	je	.L4
	cmpl	$43, %eax
	jg	.L7
	cmpl	$42, %eax
	je	.L3
	jmp	.L2
.L7:
	cmpl	$45, %eax
	je	.L5
	cmpl	$47, %eax
	je	.L6
	jmp	.L2
.L4:
	movl	32(%esp), %edx
	movl	36(%esp), %eax
	addl	%edx, %eax
	movl	%eax, 40(%esp)
	jmp	.L8
.L5:
	movl	32(%esp), %edx
	movl	36(%esp), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, 40(%esp)
	jmp	.L8
.L3:
	movl	32(%esp), %edx
	movl	36(%esp), %eax
	imull	%edx, %eax
	movl	%eax, 40(%esp)
	jmp	.L8
.L6:
	movl	32(%esp), %eax
	movl	36(%esp), %edx
	movl	%edx, 28(%esp)
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	28(%esp)
	movl	%eax, 40(%esp)
	jmp	.L8
.L2:
	movl	$.LC2, (%esp)
	call	puts
.L8:
	movl	$.LC3, %eax
	movl	40(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	$0, %eax
	leave
	ret
	.size	main, .-main

	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
