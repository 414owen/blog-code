.section .note.GNU-stack, "", @progbits

.text
.global run_switches
.type run_switches, @function
.intel_syntax noprefix

# Changes: 
# * Move p: block above s: block
# * Fall through p: into s:
# * Change p: action from decrement to subtract 2

run_switches:
  xor     eax, eax
  jmp     loop
p:
  sub     eax, 2
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
