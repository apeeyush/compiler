C# Lexer (Assignment 2)

## Group Members
Jaikishan Rupani			12308
Peeyush Agarwal				12475
Sanil Jain					12616

## How to build and run?
cd asgn2
make
bin/parser test/test1.cs 				# This command produces test1.dot in the same folder as test1.cs (test folder)
dot -Tpng test/test1.dot -o test1.png 	# This gives better output than dotty. test1.png is the image for parse tree

## How many test files are available?
We have tested our code extensively using test programs numbered from test1 to test14.

## Note
1. Install ply on your system if not present.
	sudo apt-get install python-ply
2. Install dot on your system if not present. It comes when you install graphviz (which is also needed for dotty).
3. Use 
	python bin/parser.py test/test1.cs 
   if
	bin/parser test/test1.cs
   is not working on your system.
4. In our parser, we have printed lexemes for the tokens(terminals) instead of token name in the leaf nodes(e.g 3 is created as leaf node instead of ICONST) as it helped us in better debugging and understanding of the parse tree.

Support Overview
As of now we support the following features in C# in our grammar
1.Classes, Functions
2.Simple types like int,float,double,char,bool
3.Loops(For,While,Do while,Foreach)
4.If-else,switch-case,jump,goto
5.Expressions(Relational and Arithmetic), variable declarations, assignment and other statements.
6.Multi-declaration, Object creation
7."public" and "private" modifiers for variables and methods.
8.Inheritance for classes
9.Array creation ,declaration and initialization
