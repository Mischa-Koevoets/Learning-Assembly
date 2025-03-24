.text
prompt1: .asciz "Please type a number\n"
prompt2: .asciz "Please type another number\n"
input1: .asciz "%Id"
input2: .asciz "%Id2"
output: .asciz "Result: %Id3\n"


.global main

main:

    pushq %rbp
    movq %rsp, %rbp

    call pow

    movq %rbp, %rsp
    popq %rbp

pow:

    pushq %rbp
    movq %rsp, %rbp

    movq $0, %rax
    movq $prompt1, %rdi
    call printf

#read num1
    subq $16, %rsp
    movq $0, %rax
    movq $input1, %rdi
    call scanf

    movq -16(%rbp), %rsi

#read num2
    subq $16, %rsp
    movq $0, %rax
    movq $input2, %rdi
    call scanf

    movq -24(%rbp), %rdx

#do num1^num2
    movq $1, %rax
    loop:
           
        
    end:
