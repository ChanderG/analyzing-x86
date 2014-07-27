	.file	"matrix.c"
	.section	.rodata
.LC0:
	.string	"Insert end value: "
.LC1:
	.string	"%d"
.LC2:
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$10032, %esp
	movl	$.LC0, %eax
	movl	%eax, (%esp)
	call	printf

	movl	$.LC1, %eax
	leal	10020(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf

	movl	$0, 10024(%esp)   # i
	jmp	.L2
.L5:
	movl	$0, 10028(%esp)   # j
	jmp	.L3
.L4:
	movl	10024(%esp), %eax  # copy i
	imull	$50, %eax, %edx    # edx -> 50i
	movl	10028(%esp), %eax  # copy j
	addl	%edx, %eax         # eax -> 50i + j
	leal	0(,%eax,4), %edx   # address of 4 times the whole thing
	leal	20(%esp), %eax     
	addl	%eax, %edx         # adding 20 to the whole deal
	movl	$.LC1, %eax
	movl	%edx, 4(%esp)      # the address &a[i][j]
	movl	%eax, (%esp)       # the string
	call	__isoc99_scanf

	addl	$1, 10028(%esp)
.L3:
	movl	10020(%esp), %eax
	cmpl	%eax, 10028(%esp)
	jl	.L4
	addl	$1, 10024(%esp)
.L2:
	movl	10020(%esp), %eax
	cmpl	%eax, 10024(%esp)
	jl	.L5
	movl	$0, 10024(%esp)
	jmp	.L6
.L9:
	movl	$0, 10028(%esp)
	jmp	.L7
.L8:
	movl	10024(%esp), %eax
	imull	$50, %eax, %eax
	addl	10028(%esp), %eax
	movl	20(%esp,%eax,4), %edx
	movl	$.LC2, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	addl	$1, 10028(%esp)
.L7:
	movl	10020(%esp), %eax
	cmpl	%eax, 10028(%esp)
	jl	.L8
	movl	$10, (%esp)
	call	putchar
	addl	$1, 10024(%esp)
.L6:
	movl	10020(%esp), %eax
	cmpl	%eax, 10024(%esp)
	jl	.L9
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
