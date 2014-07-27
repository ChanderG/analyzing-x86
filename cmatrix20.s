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
	subl	$1632, %esp
	movl	$.LC0, %eax
	movl	%eax, (%esp)
	call	printf
	movl	$.LC1, %eax
	leal	1620(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf

	movl	$0, 1624(%esp)    # i
	jmp	.L2
.L5:
	movl	$0, 1628(%esp)    # j
	jmp	.L3
.L4:
	movl	1624(%esp), %edx  # copy i
	movl	%edx, %eax
	sall	$2, %eax          # eax -> 4i
	addl	%edx, %eax        # eax -> 5i
	sall	$2, %eax          # eax -> 20i
	movl	%eax, %edx        # edx -> 20i
	movl	1628(%esp), %eax  # j
	addl	%edx, %eax
	leal	0(,%eax,4), %edx  # 20i + j
	leal	20(%esp), %eax
	addl	%eax, %edx
	movl	$.LC1, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf

	addl	$1, 1628(%esp)
.L3:
	movl	1620(%esp), %eax
	cmpl	%eax, 1628(%esp)
	jl	.L4
	addl	$1, 1624(%esp)
.L2:
	movl	1620(%esp), %eax
	cmpl	%eax, 1624(%esp)
	jl	.L5
	movl	$0, 1624(%esp)
	jmp	.L6
.L9:
	movl	$0, 1628(%esp)
	jmp	.L7
.L8:
	movl	1624(%esp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	1628(%esp), %eax
	movl	20(%esp,%eax,4), %edx
	movl	$.LC2, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	addl	$1, 1628(%esp)
.L7:
	movl	1620(%esp), %eax
	cmpl	%eax, 1628(%esp)
	jl	.L8
	movl	$10, (%esp)
	call	putchar
	addl	$1, 1624(%esp)
.L6:
	movl	1620(%esp), %eax
	cmpl	%eax, 1624(%esp)
	jl	.L9
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
