import sys
import ply.lex as lex
import ply.yacc as yacc
import lexer

variables = { }       # Dictionary of stored variables

tokens = lexer.tokens

lexer = lexer.lexer

precedence = (
    ('left','PLUS','MINUS'),
)

def p_statement_assign(p):
    'statement : IDENTIFIER ASSIGN expression'
    p[0] = ('ASSIGN', p[1], p[3])
    # variables[p[1]] = p[3]
    # p[0] = None

def p_statement_expr(p):
    'statement : expression'
    p[0] = p[1]

def p_expression_binop(p):
    '''expression : expression PLUS expression
                  | expression MINUS expression'''
    if p[2] == '+'  : p[0] = ('+', p[1], p[3])
    elif p[2] == '-': p[0] = ('-', p[1], p[3])
    # if p[2] == '+'  : p[0] = p[1] + p[3]
    # elif p[2] == '-': p[0] = p[1] - p[3]

def p_expression_number(p):
    "expression : ICONST"
    p[0] = p[1]

def p_expression_name(p):
    "expression : IDENTIFIER"
    try:
        p[0] = variables[p[1]]
    except LookupError:
        print("Undefined name '%s'" % p[1])
        p[0] = 0

def p_error(p):
    if p:
        print("Syntax error at '%s'" % p.value)
    else:
        print("Syntax error at EOF")

parser = yacc.yacc()

def input(text):
    result = parser.parse(text,lexer=lexer)
    return result

while True:
    try:
        s = raw_input("calc > ")
    except EOFError:
        break
    r = input(s)
    if r:
        print(r)
