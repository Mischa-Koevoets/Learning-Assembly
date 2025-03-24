.text
prompt1: .asciz "Please type a number\n"
prompt2: .asciz "Please type another number\n"
input1: .asciz "%Id"
input2: .asciz "%Id2"


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

    subq $16, %rsp
    movq $0, %rax
    movq $input1, %rdi
    leaq -16(%rbp), %rsi
    call scanf

    movq -16(%rbp), %rsi

#This shit below WILL NOT work (i think) because of memory stuff
    subq $16, %rsp
    movq $0, %rax
    movq $input2, %rdi
    leaq -16(%rbp)
    call scanf
    movq -16(%rbp), %rsi


    
