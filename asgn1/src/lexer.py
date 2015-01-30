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
    'PLUS', 'MINUS', 'TIMES', 'DIV', 'MOD',
    'BITAND', 'BITOR', 'BITXOR', 'BITNOT', 'BITCOMP',

    # ?,??
    'CONDOP','COALESCE',

    # &&,||,<<,>>
    # <, <=, >, >=, ==, !=
    'LOGAND', 'LOGOR', 'LSHIFT', 'RSHIFT',
    'LT', 'LE', 'GT', 'GE', 'EQ', 'NE',

    # =, +=,-=,*=,/=,%=,&=, <<=,>>=, ^=, |=
    'ASSIGN', 'PLUSEQUAL', 'MINUSEQUAL', 'TIMESEQUAL', 'DIVEQUAL', 'MODEQUAL',
    'BITANDEQUAL', 'LSHIFTEQUAL', 'RSHIFTEQUAL', 'BITXOREQUAL', 'BITOREQUAL',

    # ++,--
    'INCRE', 'DECRE',

    # ->,=>
    'ARROW','LAMBDA_ARROW',

    # { } [ ] ( ) . , : ;
    'BLOCK_BEGIN', 'BLOCK_END',
    'OPEN_BRACKET', 'CLOSE_BRACKET',
    'OPEN_PAREN', 'CLOSE_PAREN',
    'DOT', 'COMMA', 'COLON', 'DELIM','NS_QNTFR'
]

# https://msdn.microsoft.com/en-us/library/aa664672(v=vs.71).aspx
# A literal is a source code representation of a value (TODO)
constants = [
    # Integer literals
    # https://msdn.microsoft.com/en-us/library/aa664674(v=vs.71).aspx
    'ICONST',   # signed integer
    'UICONST',  # unsigned integer
    'LICONST',  # long integer
    'ULICONST', # unsigned long integer
    # Real literals
    # https://msdn.microsoft.com/en-us/library/aa691085(v=vs.71).aspx
    'FCONST',   # float
    'DCONST',   # double 
    'MCONST',   # decimal
    # Character literals
    # https://msdn.microsoft.com/en-us/library/aa691087(v=vs.71).aspx
    'CCONST',
    # String Literals
    # https://msdn.microsoft.com/en-us/library/aa691090(v=vs.71).aspx
    'SCONST',    # regular string
    'VSCONST'   # varbatim string
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
    'IDENTIFIER'
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
t_DIV              = r'/'
t_MOD              = r'%'
t_BITAND           = r'&'
t_BITOR            = r'\|'
t_BITXOR           = r'\^'
t_BITCOMP          = r'~'
t_BITNOT           = r'!'

# ?
t_CONDOP           = r'\?'
t_COALESCE         = r'\?\?'
t_LOGAND             = r'&&'
t_LOGOR              = r'\|\|'
t_LSHIFT           = r'<<'
t_RSHIFT           = r'>>'
t_LT               = r'<'
t_LE               = r'<='
t_GT               = r'>'
t_GE               = r'>='
t_EQ               = r'=='
t_NE               = r'!='

# Assignment operators
t_ASSIGN           = r'='
t_PLUSEQUAL        = r'\+='
t_MINUSEQUAL       = r'-='
t_TIMESEQUAL       = r'\*='
t_DIVEQUAL         = r'/='
t_MODEQUAL         = r'%='
t_BITANDEQUAL         = r'&='
t_LSHIFTEQUAL      = r'<<='
t_RSHIFTEQUAL      = r'>>='
t_BITXOREQUAL      = r'^='
t_BITOREQUAL       = r'\|='

# Increment/decrement
t_INCRE         = r'\+\+'
t_DECRE       = r'--'

# ->,=>
t_ARROW            = r'->'
t_LAMBDA_ARROW          = r'=>'

# Delimeters
t_OPEN_BRACKET         = r'\['
t_CLOSE_BRACKET         = r'\]'
t_BLOCK_BEGIN           = r'\{'
t_BLOCK_END           = r'\}'
t_OPEN_PAREN           = r'\('
t_CLOSE_PAREN           = r'\)'
t_DOT           = r'\.'
t_COMMA            = r','
t_NS_QNTFR         = r'::'
t_COLON            = r':'
t_DELIM             = r';'

# Hex Digit
t_HEXDIGIT = r'\\u[0-9a-fA-F]+'

# Identifiers and reserved words
reserved_map = { }
for r in reserved_keywords:
    reserved_map[r.lower()] = r

def t_IDENTIFIER(t):
    r'@?[A-Za-z_][\w_]*'
    t.type = reserved_map.get(t.value,"IDENTIFIER")
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
    if t.value[-1].lower() == 'd':
        t.type = 'DCONST'
        #t.value = float(t.value[:-1])
    elif t.value[-1].lower() == 'm':
        t.type = 'MCONST'
        #t.value = float(t.value[:-1])
    elif t.value[-1].lower() == 'f':
        t.type = 'FCONST'
        #t.value = float(t.value[:-1])
    else:
        t.type = 'DCONST'
        #t.value = float(t.value)
    return t

# Integer Literals
decimal_integer_literal = r'\d+'
hexadecimal_integer_literal = r'0[Xx][0-9a-fA-F]+'
uliconst = hexadecimal_integer_literal + r'|' + decimal_integer_literal + r'[uU][lL]|[lL][uU]'
uiconst = hexadecimal_integer_literal + r'|' + decimal_integer_literal + r'[Uu]' 
liconst = hexadecimal_integer_literal + r'|' + decimal_integer_literal + r'[Ll]'
iconst = hexadecimal_integer_literal + r'|' + decimal_integer_literal
@TOKEN(uliconst)
def t_ULICONST(t):
    t.type = 'ULICONST'
    #t.value = int(t.value[:-2], 0)
    return t
@TOKEN(liconst)
def t_LICONST(t):
    t.type = 'LICONST'
    #t.value = int(t.value[:-1], 0)
    return t
@TOKEN(uiconst)
def t_UICONST(t):
    t.type = 'UICONST'
    #t.value = int(t.value[:-1], 0)
    return t
@TOKEN(iconst)
def t_ICONST(t):
    t.type = 'ICONST'
    #t.value = int(t.value, 0)
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
#sconst = regular_string_literal + r'|' + verbatim_string_literal
@TOKEN(regular_string_literal)
def t_SCONST(t):
    t.type = 'SCONST'
    t.lexer.lineno += t.value.count('\n')
    return t
@TOKEN(verbatim_string_literal)
def t_VSCONST(t):
    t.type = 'VSCONST'
    t.lexer.lineno += t.value.count('\n')
    return t


# Comments
comment = r'/\*(.|\n)*?\*/' + r'|' + r'//(.)*'
@TOKEN(comment)
def t_comment(t):
    t.lexer.lineno += t.value.count('\n')

# Ignore Preprocessor
def t_preprocessor(t):
    r'\#(.)*?(\n)|\#(.)*?'
    t.lexer.lineno += 1

def t_error(t):
    print("Illegal character %s" % repr(t.value[0])),
    print("line number : %s" % t.lexer.lineno)
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
            #print '\t\t\t\t\t// ',
            print '\n//',
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
