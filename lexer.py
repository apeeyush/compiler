#!/usr/bin/python
#########################################
########## Lexer for C#  ################
#########################################
import ply.lex as lex
from ply.lex import TOKEN
from sys import argv

# Reserved keywords
# https://msdn.microsoft.com/en-us/library/x53a06bb.aspx
# https://msdn.microsoft.com/en-us/library/aa664671(v=vs.71).aspx
# Contextual keywords not included in this list as they are used to provide a specific meaning in the code, but are not a reserved word in C#.
reserved_keywords = [
    'ABSTRACT', 'AS', 'BASE', 'BOOL', 'BREAK', 'BYTE', 
    'CASE', 'CATCH', 'CHAR', 'CHECKED', 'CLASS', 'CONST', 'CONTINUE', 
    'DECIMAL', 'DEFAULT', 'DELEGATE', 'DO', 'DOUBLE', 'ELSE', 'ENUM', 
    'EVENT', 'EXPLICIT', 'EXTERN', 'FALSE', 'FINALLY', 'FIXED', 'FLOAT', 
    'FOR', 'FOREACH', 'GOTO', 'IF', 'IMPLICIT', 'IN', 'INT', 
    'INTERFACE', 'INTERNAL', 'IS', 'LOCK', 'LONG', 'NAMESPACE', 
    'NEW', 'NULL', 'OBJECT', 'OPERATOR', 'OUT', 'OVERRIDE', 
    'PARAMS', 'PRIVATE', 'PROTECTED', 'PUBLIC', 'READONLY', 'REF', 
    'RETURN', 'SBYTE', 'SEALED', 'SHORT', 'SIZEOF', 'STACKALLOC', 'STATIC', 
    'STRING', 'STRUCT', 'SWITCH', 'THIS', 'THROW', 'TRUE', 'TRY', 'TYPEOF', 
    'UINT', 'ULONG', 'UNCHECKED', 'UNSAFE', 'USHORT', 'USING', 'VIRTUAL', 
    'VOID', 'VOLATILE', 'WHILE'
]

# Operators and punctuators
# https://msdn.microsoft.com/en-us/library/aa691093(v=vs.71).aspx
operators_or_punctuators = [
    # +,-,*,/,%,&,|,^ ,!,~
    'PLUS', 'MINUS', 'TIMES', 'DIVIDE', 'MOD',
    'AND', 'OR', 'XOR', 'LNOT', 'NOT',

    # ?
    'CONDOP',

    # &&,||,<<,>>
    # <, <=, >, >=, ==, !=
    'LAND', 'LOR', 'LSHIFT', 'RSHIFT',
    'LT', 'LE', 'GT', 'GE', 'EQ', 'NE',

    # =, +=,-=,*=,/=,%=,&=, <<=,>>=, ^=, |=
    'EQUALS', 'PLUSEQUAL', 'MINUSEQUAL', 'TIMESEQUAL', 'DIVEQUAL', 'MODEQUAL',
    'ANDEQUAL', 'LSHIFTEQUAL', 'RSHIFTEQUAL', 'XOREQUAL', 'OREQUAL',

    # ++,--
    'PLUSPLUS', 'MINUSMINUS',

    # ->
    'ARROW',

    # { } [ ] ( ) . , : ;
    'LBRACE', 'RBRACE',
    'LBRACKET', 'RBRACKET',
    'LPAREN', 'RPAREN',
    'PERIOD', 'COMMA', 'COLON', 'SEMI'
]

# https://msdn.microsoft.com/en-us/library/aa664672(v=vs.71).aspx
# A literal is a source code representation of a value (TODO)
constants = [
    # Integer literals
    # https://msdn.microsoft.com/en-us/library/aa664674(v=vs.71).aspx
    'ICONST',
    # Real literals
    # https://msdn.microsoft.com/en-us/library/aa691085(v=vs.71).aspx
    'FCONST',
    # Character literals
    # https://msdn.microsoft.com/en-us/library/aa691087(v=vs.71).aspx
    'CCONST',
    # String Literals
    # https://msdn.microsoft.com/en-us/library/aa691090(v=vs.71).aspx
    'SCONST'

    # NULL literal
    # https://msdn.microsoft.com/en-us/library/aa691092(v=vs.71).aspx
    # null ; Already in keyword

    # Boolean literals
    # https://msdn.microsoft.com/en-us/library/aa664673(v=vs.71).aspx
    # true | false ; Already a keyword
]

# Identifiers
# https://msdn.microsoft.com/en-us/library/aa664670(v=vs.71).aspx
identifiers = [
    'ID'
]

# # Unicode character escape sequences
# # https://msdn.microsoft.com/en-us/library/aa664669(v=vs.71).aspx
uni_esc_sequence = ['HEXDIGIT']

# Tokens
# https://msdn.microsoft.com/en-us/library/aa664668(v=vs.71).aspx
tokens = reserved_keywords + operators_or_punctuators + identifiers + constants + uni_esc_sequence

# Newlines
def t_NEWLINE(t):
    r'\n+'
    t.lexer.lineno += t.value.count("\n")

# Completely ignored charactes (space and tab)
t_ignore = ' \t'

# Operators
t_PLUS             = r'\+'
t_MINUS            = r'-'
t_TIMES            = r'\*'
t_DIVIDE           = r'/'
t_MOD              = r'%'
t_AND              = r'&'
t_OR               = r'\|'
t_XOR              = r'\^'
t_NOT              = r'~'
t_LNOT             = r'!'

# ?
t_CONDOP           = r'\?'

t_LAND             = r'&&'
t_LOR              = r'\|\|'
t_LSHIFT           = r'<<'
t_RSHIFT           = r'>>'
t_LT               = r'<'
t_LE               = r'<='
t_GT               = r'>'
t_GE               = r'>='
t_EQ               = r'=='
t_NE               = r'!='

# Assignment operators
t_EQUALS           = r'='
t_PLUSEQUAL        = r'\+='
t_MINUSEQUAL       = r'-='
t_TIMESEQUAL       = r'\*='
t_DIVEQUAL         = r'/='
t_MODEQUAL         = r'%='
t_ANDEQUAL         = r'&='
t_LSHIFTEQUAL      = r'<<='
t_RSHIFTEQUAL      = r'>>='
t_XOREQUAL         = r'^='
t_OREQUAL          = r'\|='

# Increment/decrement
t_PLUSPLUS         = r'\+\+'
t_MINUSMINUS       = r'--'

# ->
t_ARROW            = r'->'

# Delimeters
t_LBRACKET         = r'\['
t_RBRACKET         = r'\]'
t_LBRACE           = r'\{'
t_RBRACE           = r'\}'
t_LPAREN           = r'\('
t_RPAREN           = r'\)'
t_PERIOD           = r'\.'
t_COMMA            = r','
t_COLON            = r':'
t_SEMI             = r';'

# Hex Digit
t_HEXDIGIT = r'\\u[0-9a-fA-F]+'

# Identifiers and reserved words
reserved_map = { }
for r in reserved_keywords:
    reserved_map[r.lower()] = r

def t_ID(t):
    r'@?[A-Za-z_][\w_]*'
    t.type = reserved_map.get(t.value,"ID")
    return t

# Real literals
decimal_digits = r'([0-9]+)'
exponent_part = r'([eE][+-]?\d+)'
real_suffix = r'([fFdDmM])'
literal1 = r'\d*'+ r'\.'+decimal_digits+exponent_part+r'?'+real_suffix+r'?'
literal2 = decimal_digits + exponent_part + real_suffix + r'?'
literal3 = decimal_digits + real_suffix
fconst = literal1 + r'|' + literal2 + r'|' + literal3
@TOKEN(fconst)
def t_FCONST(t):
    t.type = 'FCONST'
    t.value = float(t.value)
    return t

# Integer Literals
decimal_integer_literal = r'\d+([uU]|[lL]|[uU][lL]|[lL][uU])?'
hexadecimal_integer_literal = r'0[Xx][0-9a-fA-F]+([uU]|[lL]|[uU][lL]|[lL][uU])?'
iconst = hexadecimal_integer_literal + r'|' + decimal_integer_literal
@TOKEN(iconst)
def t_ICONST(t):
    t.type = 'ICONST'
    t.value = int(t.value, 0)
    return t

# Character literals
single_character = r'[^\'\\\n]'
simple_escape_sequence = r'\\[\'\"\\0abfnrtv]'
hex_digit = r'[0-9a-fA-F]'
hex_digit_opt = r'[0-9a-fA-F]?'
hexadecimal_escape_sequence = r'\\x' + hex_digit + hex_digit_opt + hex_digit_opt + hex_digit_opt
unicode_escape_sequence_small = r'\\u' + 4*hex_digit
unicode_escape_sequence_large = r'\\U' + 8*hex_digit
unicode_escape_sequence = unicode_escape_sequence_small + r'|' + unicode_escape_sequence_large
cconst = single_character + r'|' + simple_escape_sequence + r'|' + hexadecimal_escape_sequence + r'|' + unicode_escape_sequence
@TOKEN(r'\'(' + cconst + r')\'')
def t_CCONST(t):
    t.type = 'CCONST'
    return t

# String Literals
single_scharacter = r'[^\"\\\n]'
scconst = single_scharacter + r'|' + simple_escape_sequence + r'|' + hexadecimal_escape_sequence + r'|' + unicode_escape_sequence
scconsts = r'(' + scconst + r')' + r'*'
regular_string_literal = r'\"' + scconsts + '\"'
vconsts = r'([^\"]|[\"][\"])*'
verbatim_string_literal = r'@\"' + vconsts + '\"'
sconst = regular_string_literal + r'|' + verbatim_string_literal
@TOKEN(sconst)
def t_SCONST(t):
    t.type = 'SCONST'
    return t

# Comments
comment = r'/\*(.|\n)*?\*/' + r'|' + r'//(.)*'
@TOKEN(comment)
def t_comment(t):
    t.lexer.lineno += t.value.count('\n')

# Ignore Preprocessor
def t_preprocessor(t):
    r'\#(.)*?\n'
    t.lexer.lineno += 1

def t_error(t):
    print("Illegal character %s" % repr(t.value[0]))
    t.lexer.skip(1)

lexer = lex.lex()

def file_len(fname):
    with open(fname) as f:
        for i, l in enumerate(f):
            pass
    return i + 1

def runLexer(inputFile):
    program = open(inputFile).read()
    file_length = file_len(inputFile)
    lexer.input(program)
    # for tok in iter(lexer.token, None):
    #     print tok.type, tok.value, tok.lineno, tok.lexpos
    token = lexer.token()
    token_line_number = token.lineno if token else -1
    with open(inputFile) as f:
        for i, l in enumerate(f):
            print l.rstrip(),
            print '\t\t\t\t\t// ',
            if i+1 == token_line_number:
                print token.type,
                token = lexer.token()
                token_line_number = token.lineno if token else -1
                while token_line_number == i+1 :
                    print token.type,
                    token = lexer.token()
                    token_line_number = token.lineno if token else -1
            print ''

if __name__ == "__main__":
    # lex.runmain(lexer)
    inputFile = argv[1]
    runLexer(inputFile)
