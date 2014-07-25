#simplified x86 for hello.c 
	.file	"hello.c"
	.section	.rodata
.LC0:
	.string	"Hello World"

	.text
#declaration of a function
	.globl	sayHello
	.type	sayHello, @function
sayHello:
	pushl	%ebp
	movl	%esp, %ebp  #notice no aligning, only main requires it
	subl	$24, %esp   #completely independent of length of string .LCO
	                  #and number of similar calls 
										#it seems to be minimum of 16 and then more if required 
	movl	$.LC0, (%esp)
                    #address of .LC0 is stored in esp => maybe 8 bytes???

	call	puts
	leave
	ret
	.size	sayHello, .-sayHello
#function declaration over

#main starts
	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp # notice no subtraction of 16 bytes to make space: 
	                 # not required if nothing happens in main
	call	sayHello   # call can call any function declared  
	movl	$0, %eax   # eax value is what function returns: here 0
	leave
	ret
	.size	main, .-main
#main over
	
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
