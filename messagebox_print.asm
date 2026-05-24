global main
extern ExitProcess
extern GetStdHandle
extern WriteConsoleA
extern MessageBoxA

section .bss
	written resw 1

section .data
	msg db "Hello world!",10,0
	msg_len equ $ - msg

section .text
main:
	sub rsp, 40h

	mov ecx, -11
	call GetStdHandle
	mov rbx, rax

	call show
	call print

	jmp exit

show:
	mov rcx, 0
	lea rdx, [rel msg]
	lea r8, [rel msg]
	mov r9d, 0x0
	call MessageBoxA
	ret

print:
	mov rcx, rbx ; handle
	lea rdx, [rel msg] ; buffer
	mov r8d, msg_len
	lea r9d, [rel written]
	mov qword [rsp+20], 0
	call WriteConsoleA
	ret

exit:
	xor ecx, ecx
	call ExitProcess
