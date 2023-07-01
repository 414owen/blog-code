.section .note.GNU-stack, "", @progbits

.text
.global run_switches
.type run_switches, @function
.intel_syntax noprefix

# This is basically just gcc's output
# Changes: 
# * It has a .align directive

run_switches:
        xor   eax, eax                           # res = 0

        movzx  eax,BYTE PTR [rdi]    # eax = *input
        lea    rdx,[rdi+0x1]         # rdx = input + 1
        xor    ecx,ecx               # ecx = result
        lea    rsi,[add_arr]
        test   rax,rax
        je     ret
        nop    DWORD PTR [rax]
        .align 16
loop:
         add    rdx,0x1
         add    ecx,DWORD PTR [rsi+rax*4]
         movzx  eax,BYTE PTR [rdx-0x1]
         test   rax,rax
         jne    loop

ret:    mov    eax,ecx
        ret

.data
add_arr:
        .fill 'p', 4, 0
        .long -1, 0, 0, 1
        .fill (256 - 's'), 4, 0
