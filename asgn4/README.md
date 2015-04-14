C# Lexer (Assignment 4)

## Group Members
Jaikishan Rupani			12308
Peeyush Agarwal				12475
Sanil Jain					12616

## How to build and run?
cd asgn4
make
bin/codegen test/prog1.cs

This outputs the mips code on standard output along with compilation status (errors if any and success if none).
The mips code is also saved in a file.
Example:
On running
	bin/codegen test/prog1.cs
mips code is saved in
	test/prog1.asm
It can be run using
	spim -file test/prog1.asm

## How many test files are available?
We have tested our code extensively using test programs numbered from prog1 to prog11.
Some of these programs perform useful things like bubble sort, merge sort, tower of hanoi, power, gcd, factorial, segment tree, prime sieve etc.

## Note
1. Install ply on your system if not present.
	sudo apt-get install python-ply
2. Use 
	python bin/codegen.py test/prog1.cs 
   if
	bin/codegen test/prog1.cs
   is not working on your system.

## Language Specifications
Language specifications are present in "specs.md" file.