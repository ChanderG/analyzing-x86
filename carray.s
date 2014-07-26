# simple c program with one dimensional arrays	
	.file	"array.c"
	.section	.rodata
.LC0:
	.string	"Insert end value: "
.LC1:
	.string	"%d"
.LC2:
	.string	"Insert value #%d: "
.LC3:
	.string	"%d\n"

	.text

	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$224, %esp  # 200( = 50 * 4) + 4 + 4 + default 16

	movl	$.LC0, %eax
	movl	%eax, (%esp)
	call	printf

	movl	$.LC1, %eax
	leal	216(%esp), %edx   # location where n is stored
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf

	movl	$0, 220(%esp)    # location where i is stored
	jmp	.L2
.L3:
	movl	220(%esp), %eax
	leal	1(%eax), %edx
	movl	$.LC2, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf

	movl	220(%esp), %eax
	leal	0(,%eax,4), %edx
	leal	16(%esp), %eax
	addl	%eax, %edx
	movl	$.LC1, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf

	addl	$1, 220(%esp)
.L2:
	movl	216(%esp), %eax
	cmpl	%eax, 220(%esp)
	jl	.L3
	movl	$0, 220(%esp)
	jmp	.L4
.L5:
	movl	220(%esp), %eax
	movl	16(%esp,%eax,4), %edx
	movl	$.LC3, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf

	addl	$1, 220(%esp)
.L4:
	movl	216(%esp), %eax
	cmpl	%eax, 220(%esp)
	jl	.L5
	movl	$0, %eax
	leave
	ret
	.size	main, .-main

	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
