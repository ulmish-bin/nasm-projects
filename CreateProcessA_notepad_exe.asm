global main
extern ExitProcess
extern CreateProcessA
default rel

section .bss

section .data
	name db 0
	args db "notepad.exe",0
	process times 32 db 0
	startup times 104 db 0
section .text
main:
	sub rsp, 88

	mov dword [startup], 104

	xor rcx, rcx
	lea rdx, [args]
	xor r8, r8
	xor r9, r9
	mov qword [rsp + 32], 0
	mov qword [rsp + 40], 0
	mov qword [rsp + 48], 0
	mov qword [rsp + 56], 0
	lea rax, [startup]
	mov qword [rsp + 64], rax
	lea rax, [process]
	mov qword [rsp + 72], rax
	call CreateProcessA

exit:
	xor rcx, rcx
	call ExitProcess
