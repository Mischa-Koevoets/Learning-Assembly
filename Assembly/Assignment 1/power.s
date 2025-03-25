.text
prompt1: .asciz "Please type a number\n"
prompt2: .asciz "Please type another number\n"
input_format: .asciz "%ld"
output: .asciz "Result: %ld\n"

.section .bss
    num1: .space 8
    num2: .space 8



.global main

main:

    pushq %rbp
    movq %rsp, %rbp

    movq $0, %rax
    movq $prompt1, %rdi
    call printf

    movq $input_format, %rdi
    movq $num1, %rsi
    call scanf

    movq $0, %rax
    movq $prompt2, %rdi
    call printf

    movq $input_format, %rdi
    movq $num2, %rsi
    call scanf

    movq $num1, %rdi     
    movq $num2, %rsi 
    movq %rdi, %rcx

    call pow

    movq $output, %rdi
    movq %rax, %rsi      
    call printf

    movq $0, %rdi
    call exit

pow:
    
    cmpq $1, %rsi        
    je done        

    imulq %rdi, %rcx
    decq %rsi            
    jmp pow       

done:
    movq %rbp, %rsp
    popq %rbp
    ret
