.section .note.GNU-stack, "", @progbits

.text
.global run_switches
.type run_switches, @function
.intel_syntax noprefix

# Changes: 
# * Use replace a cmov with a sete

run_switches:
        xor   eax, eax                           # res = 0
loop:                                            # while (true) {
        movsx rcx, byte ptr [rdi]                #   char c = *input
        test  rcx, rcx                           #   if (c == '\0')
        je    ret                                #     return
        add   eax, dword ptr [add_arr + rcx * 4] #   res += arr[c]
        add   rdi, 1                             #   input++
        jmp   loop                               # }
ret:    ret

.data
add_arr:
        .fill 'p', 4, 0
        .long -1, 0, 0, 1
        .fill (256 - 's'), 4, 0
