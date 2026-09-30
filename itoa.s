.intel_syntax noprefix
.global itoa
itoa:
xor rdx, rdx /*div*/
xor rcx, rcx /*div*/
xor r10, r10 /*Loop*/

mov rax, rdi
mov rcx, 10

cmp rax, 0
je itoa_zero
cmp rax, 0
jl itoa_negative_setup

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

itoa_negative_setup:
neg rax
jmp itoa_negative

itoa_negative:
inc r10

div rcx
add rdx, 0x30
push rdx
xor rdx, rdx
cmp rax, 0
jne itoa_negative

add r10, 1
mov rax, r10
dec r10
mov rcx, r10
mov BYTE PTR [rsi + 0], 0x2d

itoa_negativedone:
pop rdx
inc rsi
mov [rsi], dl
dec rcx
jnz itoa_negativedone
ret
