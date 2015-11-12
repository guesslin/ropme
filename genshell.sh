#!/bin/bash
gcc shell.c
a=`objdump -d a.out | sed -n '/needle0/,/needle1/p'|head -n1|awk '{print $1}'`
l=`echo $a| wc | awk '{print $3}'`
n=`echo ${a:($l-4):$l}`
xxd -s0x$n -l32 -p a.out shellcode
rm -rf a.out
