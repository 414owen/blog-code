.section .note.GNU-stack, "", @progbits

.text
.globl run_switches
.type run_switches, @function
.intel_syntax noprefix


run_switches:
        xor rax, rax            # res = 0
        mov rsi, 1              # need  1 in a register later
        mov rdx, -1             # need -1 in a register later
loop:                           # while (true) {
        mov r8b, BYTE PTR [rdi] #   char c = *input
        test r8b,r8b            #   if (c == '\0')
        je ret                  #     return
        inc rdi                 #   input++
        mov ecx, 0              #   n = 0
        cmp r8b,0x70            #   if (c == 'p')
        cmove rcx, rdx          #     n = -1
        cmp r8b, 0x73           #   if (c == 's')
        cmove rcx, rsi          #     n = 1
        add rax, rcx            #   res += n
        jmp loop                # }
ret:
        ret
