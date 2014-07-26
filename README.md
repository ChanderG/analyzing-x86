#analyzing-x86-examples

###What?
The involves several simple c examples converted to assembly and analyzed to understand x86 (ATAT aka gas method). 

For the safety of the comments, the files starting with c are commented versions of the same file. 

If you build these on a 64 bit machine:

###Build Instructions
The C code can be compiled to assembly as :
```
cc -m32 -S progfile.c
```

To simplify the assembly code:

```
cc -m32 -S -fno-asynchronous-unwind-tables progfile.c
```

To test the assembly code : 
```
cc -m32 progfile.s
```

###List of files

hw.c : A simple hello world c program.
hello.c : A simple hello world c program with a single function
name.c : A simple c program with input and output of a single char 
loop.c : A simple c program with looping structure 
array.c : A simple c program with a one dimensional array 
