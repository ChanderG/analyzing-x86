#Simplified assembly code
  .file	"hw.c"
	.section	.rodata
.LC0:
	.string	"Hello World"
	.text
	.globl	main
	.type	main, @function
main:
	pushl	%ebp      #push base pointer original value into the stack
	movl	%esp, %ebp  # mov long source => dest meaning store stack p into base ptr
	#stores original value in stack pointer to the base pointer
	#$ indicates literal value
	andl	$-16, %esp   #round off to the nearest 16 byte addr
	subl	$16, %esp    #needed to align with 16 byte # for some SIMD instructions in main to work properly
	movl	$.LC0, (%esp)  #TODO: why ()?
	                     # it actually means 0 steps from esp, like 4(%esp)
	call	puts
	leave #resets stack and base pointer value from initally saved one
	ret # returns control by popping instruction pointer
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
