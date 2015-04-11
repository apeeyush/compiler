C# Lexer (Assignment 3)

## Group Members
Jaikishan Rupani			12308
Peeyush Agarwal				12475
Sanil Jain					12616

## How to build and run?
cd asgn3
make
bin/irgen test/prog1.cs

## How many test files are available?
We have tested our code extensively using test programs numbered from prog1 to prog9.

## Note
1. Install ply on your system if not present.
	sudo apt-get install python-ply
2. Use 
	python bin/parser.py test/prog1.cs 
   if
	bin/parser test/prog1.cs
   is not working on your system.

Support Overview
As of now we support the following features in C# in our grammar
1. Classes, Functions
2. Simple types like int,double,char,bool
3. Loops(For,While,Do while)
4. If-else,switch-case
5. Expressions(Relational and Arithmetic), variable declarations, assignment and other statements.
6. Multi-declaration, Object creation
7. "public" and "private" modifiers for variables and methods.
8. Inheritance for classes
9. Array declaration and initialization
10.Type Checking
