.section .note.GNU-stack, "", @progbits

.text
.global run_switches
.type run_switches, @function
.intel_syntax noprefix

# Changes: 
# * Move s: block to the top
# * Fall through s: into the loop
# * Jump into the loop from the initial function block

run_switches:
  xor     eax, eax
  jmp     loop
s:
  inc     eax
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
