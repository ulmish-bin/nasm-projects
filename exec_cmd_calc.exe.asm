global main
default rel
extern ExitProcess
extern ShellExecuteA
extern GetStdHandle

section .data
	cmd db "/k start calc.exe",0
	cmdfile db "cmd.exe",0

section .text
main:
	sub rsp, 40

getHandle:
	mov rcx, -11
	call GetStdHandle
	mov r14, rax

execute:
	mov rcx, r14
	xor rdx, rdx
	lea r8, [cmdfile]
	lea r9, [cmd]
	mov qword [rsp + 32], 0
	mov qword [rsp + 40], 5
	call ShellExecuteA

exit:
	xor rcx, rcx
	call ExitProcess
