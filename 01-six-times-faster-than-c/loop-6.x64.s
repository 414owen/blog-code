.section .note.GNU-stack, "", @progbits

.text
.global run_switches
.type run_switches, @function
.intel_syntax noprefix

# Changes: 
# * Unrolled loop

run_switches:
        xor    eax, eax            # res = 0
        mov    r8d, 1              # need  1 in a register later
        mov    edx, -1             # need -1 in a register later
loop:
        movsx  ecx, byte ptr [rdi]
        test   ecx, ecx
        je     ret
        inc    rdi
        mov    esi, 0
        cmp    ecx, 'p'
        cmove  esi, edx
        cmp    ecx, 's'
        cmove  esi, r8d
        add    eax, esi
        jmp    loop
ret:
        ret
