.section .note.GNU-stack, "", @progbits

.text
.global run_switches
.type run_switches, @function
.intel_syntax noprefix

# Starting point: clang's output
# Changes: 
# * Move check for '\0' to last place in the loop

run_switches:
  xor     eax, eax
loop:
  movsx   ecx, byte ptr [rdi]
  inc     rdi
  cmp     ecx, 'p'
  je      p
  cmp     ecx, 's'
  je      s
  test    ecx, ecx
  jne     loop
  ret
p:
  dec     eax
  jmp     loop
s:
  inc     eax
  jmp     loop
