.section .note.GNU-stack, "", @progbits

.text
.global run_switches
.type run_switches, @function
.intel_syntax noprefix

# Changes: 
# * Use cmov to eliminate some branches

# rdi: char *input
# eax: ouput
# r8:  1
# edx: -1
# ecx: char c
# esi: n

run_switches:
        xor   eax, eax             # res = 0
        mov   r8d, 1               # need  1 in a register later
        mov   edx, -1              # need -1 in a register later
loop:                              # while (true) {
        movsx ecx, byte ptr [rdi]  #   char c = *input
        test  ecx, ecx             #   if (c == '\0')
        je    ret                  #     return
        inc   rdi                  #   input++
        mov   esi, 0               #   n = 0
        cmp   ecx, 'p'             #   if (c == 'p')
        cmove esi, edx             #     n = -1
        cmp   ecx, 's'             #   c == 's'?
        cmove esi, r8d             #     n = 1
        add   eax, esi             #   res += n
        jmp   loop                 # }
ret:
        ret
