.section .note.GNU-stack, "", @progbits

# This is basically just gcc's output, with
# the data section filled in

.global run_switches
.type run_switches, @function
.intel_syntax noprefix

.section .rodata
add_arr:
        .fill 'p', 4, 0
        .long -1, 0, 0, 1
        .fill (256 - 's'), 4, 0

.text
run_switches:
        movzx  eax, byte ptr [rdi] # eax = *input
        lea    rdx, [rdi+0x1]      # rdx = input + 1
        xor    ecx, ecx            # ecx = result
        lea    rsi, [add_arr]
        test   rax, rax
        je     ret
        nop    dword ptr [rax]

loop:   add    rdx, 0x1
        add    ecx, dword ptr [rsi+rax*4]
        movzx  eax, byte ptr [rdx-0x1]
        test   rax, rax
        jne    loop

ret:    mov    eax, ecx
        ret
