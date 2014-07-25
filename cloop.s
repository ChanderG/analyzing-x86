# Simple looping program	
	.file	"loop.c"
	.section	.rodata
.LC0:
	.string	"Insert end value: "
.LC1:
	.string	"%d"
.LC2:
	.string	"%d\n"

	.text

	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp

	movl	$.LC0, %eax
	movl	%eax, (%esp)
  # the 2 stmts are equivalent to one
	call	printf

	movl	$.LC1, %eax
	leal	24(%esp), %edx  # leal implies take address of source and keep it in destination
	                      # apparently the variable a is stored there
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf

	movl	$0, 28(%esp)    # store 0 in variable i
	jmp	.L2
.L3:
	movl	$.LC2, %eax    
	movl	28(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	addl	$1, 28(%esp)
.L2:
	movl	24(%esp), %eax   # store a in register eax 
	cmpl	%eax, 28(%esp)   # compare a and i 
	                       # apparently it compares second with first
	jl	.L3
	movl	$0, %eax
	leave
	ret
	.size	main, .-main

	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
