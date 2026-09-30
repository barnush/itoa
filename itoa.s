.intel_syntax noprefix
.global itoa
itoa:
xor rdx, rdx /*div*/
xor rcx, rcx /*div*/
xor r10, r10 /*Loop*/

mov rax, rdi
cmp rax, 0
je itoa_zero

mov rcx, 10

itoa_loop:
inc r10

div rcx

add rdx, 0x30
push rdx
xor rdx, rdx
cmp rax, 0
jne itoa_loop

mov rax, r10
mov rcx, r10

itoa_done:
pop rdx
mov [rsi], dl
inc rsi
dec rcx
jnz itoa_done
ret

itoa_zero:
add rax, 0x30
mov [rsi], al
mov rax, 1
ret
