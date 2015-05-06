# C# Compiler

A compiler for compiling code from C# to MIPS, implemented in Python.

## Usage

    python codegen.py <filename>

This outputs the MIPS code on standard output along with compilation status (errors if any and success if none). The mips code is also saved in a file.

Example : On running

    python codegen.py test/prog1.cs

mips code is saved in `test/prog1.asm`. It can be run using

    spim -file test/prog1.asm

## Tests
The compiler is tested using test programs numbered from prog1 to prog10 present in test folder. Some of these programs perform useful things like bubble sort, merge sort, tower of hanoi, power, gcd, factorial, segment tree, prime sieve etc.

# Language Specifications

## Language Features

- Data Types - int, bool, char, string(of size <= 200), arrays, objects
- Operators
    - int
        - Unary -> !,-,~,+
        - Relational ->  <, >, <=, >=, ==, !=
        - Arithmetic -> +,-,/,%
        - Bitwise -> <<,>>,&,|,^
        - Logical ops -> &&,||
        - Assignment -> =,+=,-=,*=,/=,%=,^=,&=,|= (only work for identifiers,not member/element access)
    - bool
        - Unary-> !
        - Logical -> &&,||
        - Assignment -> =
    - Objects
        - Assignment -> = (make reference to object, assign something to object data member)
    - String
        - Initialization and Assignment -> = (assign string constants to string variables)
    - Arrays
        - Unary -> !,-,~,+
        - Relational ->  <, >, <=, >=, ==, !=
        - Arithmetic -> +,-,/,%
        - Bitwise -> <<,>>,&,|,^
        - Logical ops -> &&,||
        - Assignment -> =
    - Char
        - Only read,assign,write operations on non-escape characters
- Loops -> for, while, do-while
- Selection Statements -> if-else, switch, conditional (c = expression ? a : b)
- Jump Statements -> return, continue, break
- Arrays -> 1-D arrays of types - {int,bool}
- Classes
    - Inheritance (from a chain of parents as well)
    - Structural Checl : Exactly one class must have a function Main(), this class does not have variables as class members(only methods allowed although method may have any variables/arrays/objects). Execution begins from Main()
    - scope modifiers- {public,private} for data members of class only(not functions)
    - Data members can only be of simple or array of simple types.
- Functions
    - Allowed return types -> int, bool, void, char
    - Allowed argument types -> int, bool, objects, char (no arrays or strings)
    - Function width is decided optimally in case of nested scopes.
- Scoping
    - Lexical scoping has been implemented which allows us to support nested scopes. The width for a block with nested blocks is determined optimally.
    - In our scoping, we don't allow redeclaration of variables sharing name with container function arguments or container class data members.
- Short-circuiting of boolean expressions
- Return statements supported within blocks as well; garbage/void value returned if no return statement according to return type
- Read and Write
    - Our write statement can take expression with different type in the same statement(int,char,bool and string)
    - Read statement takes one variable in which you want to read(int,char,bool,string)
- Multiple Declarations and Sequential Assignments
    - Multiple Declarations  -> int a,b,c=3;
    - Sequential Assignments -> a=b=c=3;
- Type Checking
    - Language is strictly typed and type checking is done for validating every expression and to check that the operator is operating on valid types.
    - In if-else, while, do-while etc., it is checked that the expression has bool type
    - Type checking has also been implemented at other places as required
- Dynamic Memory Allocation
    - Objects are allocated dynamically from heap

NOTE: Braces required in blocks (even if single statement) for if, else, while, for etc.

## Features not supported
- pre & post increment/decrement
- escape character not supported in char type (supported via string)
- array size is restricted to 8189 (because element access requires using loading "immediate" in registers which is only 16-bit long)
- Assigning one string variable to another (It is permitted but not recommended as it's behaviour may appear inconsistent - It passes the pointer at the time of assignment).
- float and double type
- multidimensional arrays, object data member