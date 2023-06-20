.section .note.GNU-stack, "", @progbits

.text
.globl run_switches
.type run_switches, @function
.intel_syntax noprefix

run_switches:
        xor  rax, rax            # res = 0
        b    loop
p:
        sub  rax, 2
s:
        add  rax, 1
        inc  rdi                 # input++
loop:                            # while (true) {
        inc  rdi                 #   input++
        mov  r8b, BYTE PTR [rdi] #   char c = *input
        cmp  r8b, 0x70           #   if (c == 'p')
        je   p                   #     goto p
        cmp  r8b, 0x73           #   if (c == 's')
        je   s                   #     goto s
        test r8b, r8b            #   if (c == '\0')
        je   ret                 #     return
        inc  rdi                 #   input++
        jmp  loop                # }
ret:
        ret