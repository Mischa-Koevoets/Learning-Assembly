.text
prompt1: .asciz "Please type a number\n"
prompt2: .asciz "Please type another number\n"
input_format: .asciz "%Id"
output: .asciz "Result: %Id\n"

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

    movq num1, %rdi     
    movq num2, %rsi 

    call pow

    movq $output, %rdi
    movq %rax, %rsi      
    call printf

    movq $0, %rdi
    call exit

pow:

    pushq %rbp
    movq %rsp, %rbp

    movq $1, %rax        
    cmpq $0, %rsi        
    je done              

loop:
    imulq %rdi, %rax     
    decq %rsi            
    jnz loop       

done:
    popq %rbp
    ret
