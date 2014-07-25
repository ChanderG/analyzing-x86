# simplified x86 of name.c
  .file	"name.c"
	.section	.rodata
.LC0:
	.string	"Enter your name: "
.LC1:
	.string	"%c"
.LC2:
	.string	"Your name: %c\n"

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
	call	printf
	movl	$.LC1, %eax
	leal	31(%esp), %edx  # moves addr of 31(esp) to edx
                        # apparently 31(esp) contains variable a
                        # now address is in edx
                        # now address is also in 4(esp) 
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf
	movzbl	31(%esp), %eax  # eax has returned value
	                        # movsbl - move with sign extension from byte to longword
	movsbl	%al, %edx
	movl	$.LC2, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	$0, %eax
	leave
	ret
	.size	main, .-main

	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
