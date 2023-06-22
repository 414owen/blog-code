.section .note.GNU-stack, "", @progbits

.text
.global run_switches
.type run_switches, @function
.intel_syntax noprefix

# Changes: 
# * Use replace a cmov with a sete

run_switches:
        xor   eax, eax             # res = 0
        mov   edx, -1              # need -1 in a register later
loop:                              # while (true) {
        movsx ecx, byte ptr [rdi]  #   char c = *input
        test  ecx, ecx             #   if (c == '\0')
        je    ret                  #     return
        inc   rdi                  #   input++
        mov   esi, 0               #   n = 0
        cmp   ecx, 's'             #   c == 's'?
        sete  sil                  #     n = 0|1
        cmp   ecx, 'p'             #   if (c == 'p')
        cmove esi, edx             #     n = -1
        add   eax, esi             #   res += n
        jmp   loop                 # }
ret:
        ret
