import sys
import ply.lex as lex
import ply.yacc as yacc
import lexer
from sys import argv
import createdot
from symbol_table import *
from threeAddressCode import *
from termcolor import colored, cprint


ST = SymbolTable()
TAC = ThreeAddressCode()

variables = { }       # Dictionary of stored variables
errors_list = []

tokens = lexer.tokens
lexer = lexer.lexer

errorFlag = False

precedence = (
('left', 'CLOSE_PAREN'),
('right', 'ELSE'),
)


def error(errorType, errorMessage, errorLine=None):
    global errorFlag
    errorFlag = True
    cprint('Error:', 'red', end= ' ')
    if errorLine:
        cprint(str(errorLine), 'red', end= ' ')
    cprint(' ::', 'red', end= ' ')
    cprint(errorMessage, 'red')

def warning(warningType, warningMessage, warningLine=None):
    cprint('Warning:', 'yellow', end= ' ')
    if warningLine:
        cprint(str(warningLine), 'yellow', end=' ')
    cprint(warningMessage, 'yellow')

def showCompilationStatus():
    if errorFlag:
        cprint('Compilation Failed', 'red')
    else:
        cprint('Compilation Successful', 'green')

def p_compilation_unit(p):
    ''' compilation-unit :         class-declarations-opt
             |         statement-list
             '''
    p[0]=['compilation_unit']+[p[i] for i in range(1,len(p))]

def p_semi_opt(p):
    ''' semi-opt :         DELIM
             |         empty
             '''
    p[0] = p[1]

def p_class_declarations_opt(p):
    ''' class-declarations-opt :         class-declarations
             |         empty
             '''
    p[0]=['class_declarations_opt']+[p[i] for i in range(1,len(p))]

def p_class_declarations(p):
    ''' class-declarations :         class-declaration
             |         class-declarations class-declaration
             '''
    p[0]=['class_declarations']+[p[i] for i in range(1,len(p))]

def p_class_declaration(p):
    ''' class-declaration :         CLASS IDENTIFIER class-base-opt class-body semi-opt
             '''
    p[0]=['class_declaration']+[p[i] for i in range(1,len(p))]

def p_class_base_opt(p):
    ''' class-base-opt :         class-base
             |         empty
             '''
    p[0]=['class_base_opt']+[p[i] for i in range(1,len(p))]

def p_class_base(p):
    ''' class-base :         COLON class-type
             '''
    p[0]=['class_base']+[p[i] for i in range(1,len(p))]

def p_class_type(p):
    ''' class-type :         IDENTIFIER
             '''
    p[0] = p[1]

def p_class_body(p):
    ''' class-body :         BLOCK_BEGIN class-member-declarations-opt BLOCK_END
             '''
    p[0]=['class_body']+[p[i] for i in range(1,len(p))]

def p_class_member_declarations_opt(p):
    ''' class-member-declarations-opt :         class-member-declarations
             |         empty
             '''
    p[0]=['class_member_declarations_opt']+[p[i] for i in range(1,len(p))]

def p_class_member_declarations(p):
    ''' class-member-declarations :         class-member-declaration
             |         class-member-declarations class-member-declaration
             '''
    p[0]=['class_member_declarations']+[p[i] for i in range(1,len(p))]

def p_class_member_declaration(p):
    ''' class-member-declaration :         constant-declaration
             |         field-declaration
             |         method-declaration
             |         constructor-declaration
             |         destructor-declaration
             '''
    p[0]=['class_member_declaration']+[p[i] for i in range(1,len(p))]

def p_constant_declaration(p):
    ''' constant-declaration :         modifier CONST simple-type constant-declarators DELIM
             |         CONST simple-type constant-declarators DELIM
             '''
    p[0]=['constant_declaration']+[p[i] for i in range(1,len(p))]

# simple-type : {'type' : }
# array-type  : {'type' : , 'array' : True, size : ''}
# class-type  : { }
def p_type(p):
    ''' type :         simple-type
             |         class-type
             |         array-type
             '''
    p[0] = p[1]

def p_simple_type(p):
    ''' simple-type :         BOOL
             |         INT
             |         UINT
             |         CHAR
             |         DOUBLE
             '''
    p[0] = {'type' : p[1]}

def p_array_type(p):
    ''' array-type :         simple-type OPEN_BRACKET ICONST CLOSE_BRACKET
             '''
    p[0] = p[1]
    p[0]['array'] = True
    p[0]['size'] = p[3]

def p_constant_declarators(p):
    ''' constant-declarators :         constant-declarator
             |         constant-declarators COMMA constant-declarator
             '''
    if len(p) == 2:
        p[0] = [p[1]]
    elif len(p) == 4:
        p[0] = p[1] + [p[3]]

def p_constant_declarator(p):
    ''' constant-declarator :         IDENTIFIER ASSIGN expression
             '''
    p[0] = { 'identifier_name' : p[1], 'place' : p[3]['place'], 'type' : p[3]['type']}

# {'type' : , 'place' : }
def p_expression(p):
    ''' expression :         conditional-expression
             |         assignment
             '''
    p[0] = p[1]

def p_conditional_expression(p):
    ''' conditional-expression :         conditional-or-expression
             |         conditional-or-expression CONDOP expression COLON expression
             '''
    if len(p) == 2:
        p[0] = p[1]
    elif len(p) == 6:   #Condop implemented
        if p[1]['type']!='bool':
            error('typeError', 'condop should have boolean expression', str(p.lexer.lineno))
        elif p[3]['type']!=p[5]['type']:
            error('typeError', 'condop should have same type in both expressions', str(p.lexer.lineno))
        else:
            p[0]={}
            p[0]['place']=ST.gentmp()
            p[0]['type']=p[3]['type']
            nextquad=TAC.getNextQuad()
            TAC.emit(p[1]['place'],'',nextquad+3,'cond_goto')
            TAC.emit(p[0]['place'],p[3]['place'],'','=')
            nextquad=TAC.getNextQuad()
            TAC.emit('','',nextquad+2,'goto')
            TAC.emit(p[0]['place'],p[5]['place'],'','=')

def p_conditional_or_expression(p):
    ''' conditional-or-expression :         conditional-and-expression
             |         conditional-or-expression LOGOR conditional-and-expression
             '''
    if len(p) == 2:
        p[0] = p[1]
    elif len(p) == 4:   # TODO : Implement backpatching
        p[0] = {}
        if p[1]['type'] == p[4]['type'] == 'bool':
            p[0]['type'] = 'bool'
        else:
            error('typeError', 'Incorrect type in LOGOR expression', str(p.lexer.lineno))
            p[0]['type'] = 'typeError'
        p[0]['place'] = ST.gentmp()
        TAC.emit(p[0]['place'], p[1]['place'], p[3]['place'], p[2])

def p_conditional_and_expression(p):
    ''' conditional-and-expression :         inclusive-or-expression
             |         conditional-and-expression LOGAND inclusive-or-expression
             '''
    if len(p) == 2:
        p[0] = p[1]
    elif len(p) == 4:   # TODO : Implement backpatching
        p[0] = {}
        if p[1]['type'] == p[4]['type'] == 'bool':
            p[0]['type'] = 'bool'
        else:
            p[0]['type'] = 'typeError'
            error('typeError', 'Incorrect type in LOGAND expression', str(p.lexer.lineno))
        p[0]['place'] = ST.gentmp()
        TAC.emit(p[0]['place'], p[1]['place'], p[3]['place'], p[2])

def p_inclusive_or_expression(p):
    ''' inclusive-or-expression :         exclusive-or-expression
             |         inclusive-or-expression BITOR exclusive-or-expression
             '''
    if len(p) == 2:
        p[0] = p[1]
    elif len(p) == 4:
        p[0] = {}
        if p[1]['type'] == p[4]['type'] == 'int':
            p[0]['type'] = 'int'
        else:
            p[0]['type'] = 'typeError'
            error('typeError', 'Incorrect type in BITOR expression', str(p.lexer.lineno))
        p[0]['place'] = ST.gentmp()
        TAC.emit(p[0]['place'], p[1]['place'], p[3]['place'], p[2])

def p_exclusive_or_expression(p):
    ''' exclusive-or-expression :         and-expression
             |         exclusive-or-expression BITXOR and-expression
             '''
    if len(p) == 2:
        p[0] = p[1]
    elif len(p) == 4:
        p[0] = {}
        if p[1]['type'] == p[4]['type'] == 'int':
            p[0]['type'] = 'int'
        else:
            p[0]['type'] = 'typeError'
            error('typeError', 'Incorrect type in BITXOR expression', str(p.lexer.lineno))
        p[0]['place'] = ST.gentmp()
        TAC.emit(p[0]['place'], p[1]['place'], p[3]['place'], p[2])

def p_and_expression(p):
    ''' and-expression :         equality-expression
             |         and-expression BITAND equality-expression
             '''
    if len(p) == 2:
        p[0] = p[1]
    elif len(p) == 4:
        p[0] = {}
        if p[1]['type'] == p[4]['type'] == 'int':
            p[0]['type'] = 'int'
        else:
            p[0]['type'] = 'typeError'
            error('typeError', 'Incorrect type in BITAND expression', str(p.lexer.lineno))
        p[0]['place'] = ST.gentmp()
        TAC.emit(p[0]['place'], p[1]['place'], p[3]['place'], p[2])

def p_equality_expression(p):
    ''' equality-expression :         relational-expression
             |         equality-expression EQ relational-expression
             |         equality-expression NE relational-expression
             '''
    if len(p) == 2:
        p[0] = p[1]
    elif len(p) == 4:
        p[0] = {}
        if p[1]['type'] == p[3]['type'] and p[1]['type'] in ['int', 'double']:
            p[0]['type'] = 'bool'
        else:
            p[0]['type'] = 'typeError'
            error('typeError', 'Incorrect type in Equality expression', str(p.lexer.lineno))
        p[0]['place'] = ST.gentmp()
        TAC.emit(p[0]['place'], p[1]['place'], p[3]['place'], p[2])

def p_relational_expression(p):
    ''' relational-expression :         shift-expression
             |         relational-expression LT shift-expression
             |         relational-expression GT shift-expression
             |         relational-expression LE shift-expression
             |         relational-expression GE shift-expression
             '''
    if len(p) == 2:
        p[0] = p[1]
    elif len(p) == 4:
        p[0] = {}
        if p[1]['type'] == p[3]['type'] and p[1]['type'] in ['int', 'double']:
            p[0]['type'] = 'bool'
        else:
            p[0]['type'] = 'typeError'
            error('typeError', 'Incorrect type in Relational expression', str(p.lexer.lineno))

        p[0]['place'] = ST.gentmp()
        TAC.emit(p[0]['place'], p[1]['place'], p[3]['place'], p[2])

def p_shift_expression(p):
    ''' shift-expression :         additive-expression
             |         shift-expression LSHIFT additive-expression
             |         shift-expression RSHIFT additive-expression
             '''
    if len(p) == 2:
        p[0] = p[1]
    elif len(p) == 4:
        p[0] = {}
        if p[1]['type'] == p[3]['type'] == 'int':
            p[0]['type'] = 'int'
        else:
            p[0]['type'] = 'typeError'
            error('typeError', 'Incorrect type in Shift expression', str(p.lexer.lineno))

        p[0]['place'] = ST.gentmp()
        TAC.emit(p[0]['place'], p[1]['place'], p[3]['place'], p[2])

def p_additive_expression(p):
    ''' additive-expression :         multiplicative-expression
             |         additive-expression PLUS multiplicative-expression
             |         additive-expression MINUS multiplicative-expression
             '''
    if len(p) == 2:
        p[0] = p[1]
    elif len(p) == 4:
        p[0] = {}
        if p[1]['type'] == p[3]['type'] and p[1]['type'] in ['int', 'double']:
            p[0]['type'] = p[1]['type']
        else:
            p[0]['type'] = 'typeError'
            error('typeError', 'Incorrect type in Additive expression', str(p.lexer.lineno))
        p[0]['place'] = ST.gentmp()
        TAC.emit(p[0]['place'], p[1]['place'], p[3]['place'], p[2])

def p_multiplicative_expression(p):
    ''' multiplicative-expression :         unary-expression
             |         multiplicative-expression TIMES unary-expression
             |         multiplicative-expression DIV unary-expression
             |         multiplicative-expression MOD unary-expression
             '''
    if len(p) == 2:
        p[0] = p[1]
    elif len(p) == 4:
        p[0] = {}

        print p[1] , '1'
        print p[3] , '3'

        if p[1]['type'] == p[3]['type'] == 'int':
            p[0]['type'] = p[1]['type']
        elif p[1]['type'] == p[3]['type'] == 'double' and p[2] in ['*','/']:
            p[0]['type'] = p[1]['type']
        else:
            p[0]['type'] = 'typeError'
            error('typeError', 'Incorrect type in Multiplicative expression', str(p.lexer.lineno))
        p[0]['place'] = ST.gentmp()
        TAC.emit(p[0]['place'], p[1]['place'], p[3]['place'], p[2])

def p_unary_expression_prim(p):
    ''' unary-expression :         primary-expression
             '''
    p[0] = p[1]

def p_unary_expression_op(p):
    ''' unary-expression :         PLUS unary-expression
             |         MINUS unary-expression
             |         BITNOT unary-expression
             |         BITCOMP unary-expression
             '''
    if p[2]['type'] in ['int', 'double'] and p[1] == '+':
        p[0] = p[2]
    elif p[2]['type'] in ['int', 'double'] and p[1] in ['~', '-']:
        p[0] = {}
        p[0]['place'] = ST.gentmp()
        p[0]['type'] = p[2]['type']
        TAC.emit(p[0]['place'],p[2]['place'], '', p[1])
    elif p[2]['type'] in ['bool'] and p[1] in ['!']:
        p[0] = {}
        p[0]['place'] = ST.gentmp()
        p[0]['type'] = p[2]['type']
        TAC.emit(p[0]['place'],p[2]['place'],'',p[1])
    else:
        error('typeError', 'Unary expression type mismatch', str(p.lexer.lineno))

def p_primary_expression(p):
    ''' primary-expression :         array-creation-expression
             |         primary-no-array-creation-expression
             '''
    p[0] = p[1]

def p_array_creation_expression(p):
    ''' array-creation-expression :         NEW simple-type OPEN_BRACKET ICONST CLOSE_BRACKET array-initializer-opt
             '''
    # TODO

def p_array_initializer_opt(p):
    ''' array-initializer-opt :         array-initializer
             |         empty
             '''
    # TODO

def p_expression_list(p):
    ''' expression-list :         expression
             |         expression-list COMMA expression
             '''
    if len(p) == 2:
        p[0] = [p[1]]
    elif len(p) == 4:
        p[0] = p[1] + [p[3]]

def p_array_initializer(p):
    ''' array-initializer :         BLOCK_BEGIN variable-initializer-list-opt BLOCK_END
             '''
    p[0] = p[2]

def p_variable_initializer_list_opt(p):
    ''' variable-initializer-list-opt :         expression-list
             |         empty
             '''
    p[0] = p[1]

def p_variable_initializer(p):
    ''' variable-initializer :         expression
             |         array-initializer
             '''
    p[0] = p[1]

def p_primary_no_array_creation_expression_literal(p):
    ''' primary-no-array-creation-expression :         literal
             '''
    p[0] = { 'type': p[1]['type']}
    p[0]['place'] = ST.gentmp()
    TAC.emit(p[0]['place'], p[1]['value'], '', '=dec')

def p_primary_no_array_creation_expression_identifier(p):
    ''' primary-no-array-creation-expression :         IDENTIFIER
             '''
    var = ST.lookupvar(p[1])
    if not var:
        error('undefinedVariable', 'Used before initialization', str(p.lexer.lineno))
    else:
        p[0] = var

def p_primary_no_array_creation_expression_element(p):
    ''' primary-no-array-creation-expression :         element-access
             '''
    p[0] = {}
    p[0]['place']=ST.gentmp()
    p[0]['type']=p[1]['var']['type']
    TAC.emit(p[0]['place'],p[1]['var']['place']+'['+p[1]['exp']['place']+']','','=arr')

def p_primary_no_array_creation_expression_parenthesized(p):
    ''' primary-no-array-creation-expression :         parenthesized-expression
             '''
    p[0] = p[1]

def p_primary_no_array_creation_expression(p):
    ''' primary-no-array-creation-expression :         member-access
             |         invocation-expression
             '''
    p[0] = {}
    # TODO

def p_parenthesized_expression(p):
    ''' parenthesized-expression :         OPEN_PAREN expression CLOSE_PAREN
             '''
    print 'haha'
    print p[2]
    p[0]=p[2]

def p_member_access(p):
    ''' member-access :         IDENTIFIER DOT IDENTIFIER
             |                  member-access DOT IDENTIFIER
             '''

def p_invocation_expression_1(p):
    ''' invocation-expression :         IDENTIFIER OPEN_PAREN argument-list-opt CLOSE_PAREN
             '''
    p[0] = {}
    # Print function parameters
    for argument in p[3]:
        TAC.emit(argument['place'],'','','PARAM')
    # Jump to function
    TAC.emit('', '', p[1], 'JUMPLABEL')

    p[0]['type'] = 'void'   # TODO set return type
    p[0]['place'] = ST.gentmp()
    TAC.emit(p[0]['place'],'','','SETRETURN')

def p_invocation_expression_2(p):
    ''' invocation-expression :         member-access OPEN_PAREN argument-list-opt CLOSE_PAREN
             '''
    # TODO

def p_argument_list_opt(p):
    ''' argument-list-opt :         expression-list
             |         empty
             '''
    p[0] = p[1]

def p_element_access(p):
    ''' element-access :         IDENTIFIER OPEN_BRACKET expression CLOSE_BRACKET
             |         member-access OPEN_BRACKET expression CLOSE_BRACKET
             '''
    p[0]={}
    var = ST.lookupvar(p[1])
    if var:
        if p[3]['type']=='int':
            p[0]['var']=var
            p[0]['exp']=p[3]
        else:
            error('Non integer index','Array indice not an integer',p.lexer.lineno())
    else:
        error('undefinedVariable','Array not defined',p.lexer.lineno())

def p_assignment_identifier(p):
    ''' assignment :         IDENTIFIER assignment-operator expression
             '''
    p[0]={}
    var = ST.lookupvar(p[1])
    if var:
        if var['type']!=p[3]['type']:
            error('typeError', 'Type mismatch in assignment', str(p.lexer.lineno))
        else:
            TAC.emit(var['place'], p[3]['place'], '', p[2])
            p[0]['place']=var['place']
            p[0]['type']=var['type']
    else:
        error('undefinedVariable','Variable not declared', str(p.lexer.lineno))


def p_assignment_member(p):
    ''' assignment :         member-access assignment-operator expression
             '''
    # TODO

def p_assignment_element(p):
    ''' assignment :         element-access assignment-operator expression
             '''
    #Duno(may need to check for returning var[place])
    p[0]={}
    var = p[1]['var']
    if var:
        if var['type']!=p[3]['type']:
            error('typeError', 'Type mismatch in assignment', str(p.lexer.lineno))
        else:
            TAC.emit(var['place']+'['+p[1]['exp']['place']+']', p[3]['place'], '', p[2]+'arr')
            p[0]['place']=ST.gentmp()
            p[0]['type']=var['type']
            TAC.emit( p[0]['place'], var['place']+'['+p[1]['exp']['place']+']','', p[2]+'arr')
            
    else:
        error('undefinedVariable','Variable not declared', str(p.lexer.lineno))

def p_assignment_operator(p):
    ''' assignment-operator :         ASSIGN
             |         PLUSEQUAL
             |         MINUSEQUAL
             |         TIMESEQUAL
             |         DIVEQUAL
             |         MODEQUAL
             |         BITANDEQUAL
             |         BITOREQUAL
             |         BITXOREQUAL
             |         LSHIFTEQUAL
             |         RSHIFTEQUAL
             '''
    p[0]=p[1]

def p_field_declaration(p):
    ''' field-declaration :         modifier type variable-declarators DELIM
             |         type variable-declarators DELIM
             '''
    p[0]=['field_declaration']+[p[i] for i in range(1,len(p))]

def p_modifier(p):
    ''' modifier :         PUBLIC
             |         PRIVATE
             '''
    p[0] = p[1]

def p_variable_declarators(p):
    ''' variable-declarators :         variable-declarator
             |         variable-declarators COMMA variable-declarator
             '''
    if len(p) == 2:
        p[0] = [p[1]]
    elif len(p) == 4:
        p[0] = p[1] + [p[3]]

def p_variable_declarator(p):
    ''' variable-declarator :         IDENTIFIER
             |         IDENTIFIER ASSIGN variable-initializer
             '''
    if len(p) == 2:
        p[0] = {'identifier_name' : p[1]}
    elif len(p) == 4:   # Handle initialization
        p[0] = { 'identifier_name' : p[1], 'initializer' : p[3]}

def p_method_declaration(p):
    ''' method-declaration :         method-header method-body
             '''

def p_method_header(p):
    ''' method-header :         modifier type member-name OPEN_PAREN formal-parameter-list-opt CLOSE_PAREN
             |         modifier VOID member-name OPEN_PAREN formal-parameter-list-opt CLOSE_PAREN
             |         type member-name OPEN_PAREN formal-parameter-list-opt CLOSE_PAREN
             |         VOID member-name OPEN_PAREN formal-parameter-list-opt CLOSE_PAREN
             '''

def p_formal_parameter_list_opt(p):
    ''' formal-parameter-list-opt :         formal-parameter-list
             |         empty
             '''

def p_member_name(p):
    ''' member-name :         IDENTIFIER
             '''

def p_formal_parameter_list(p):
    ''' formal-parameter-list :         fixed-parameters
             '''

def p_fixed_parameters(p):
    ''' fixed-parameters :         fixed-parameter
             |         fixed-parameters COMMA fixed-parameter
             '''

def p_fixed_parameter(p):
    ''' fixed-parameter :          type IDENTIFIER
             '''

def p_method_body(p):
    ''' method-body :         block
             |         DELIM
             '''

def p_block(p):
    ''' block :         BLOCK_BEGIN M_bstart statement-list-opt BLOCK_END
             '''
    p[0] = {}

    p[0]['loopBeginList'] = p[3].get('loopBeginList', [])
    p[0]['loopEndList'] = p[3].get('loopEndList', [])
    ST.deletebscope()

def p_M_bstart(p):
    ''' M_bstart : empty
             '''
    ST.addbscope()

def p_statement_list_opt(p):
    ''' statement-list-opt :         statement-list
             |         empty
             '''
    p[0] = {}
    if p[1]:
        p[0]['loopBeginList'] = p[1].get('loopBeginList', [])
        p[0]['loopEndList'] = p[1].get('loopEndList', [])

def p_statement_list(p):
    ''' statement-list :         statement
             |         statement-list statement
             '''
    p[0] = {}

    if len(p) == 2:
        p[0]['loopBeginList'] = p[1].get('loopBeginList',[])
        p[0]['loopEndList'] = p[1].get('loopEndList',[])
    elif len(p) == 3:
        p[0]['loopBeginList'] = p[1].get('loopBeginList',[]) + p[2].get('loopBeginList',[])
        p[0]['loopEndList'] = p[1].get('loopEndList',[]) + p[2].get('loopEndList',[])

def p_statement(p):
    ''' statement :         labeled-statement
             |         declaration-statement
             |         block
             |         empty-statement
             |         expression-statement
             |         selection-statement
             |         iteration-statement
             |         jump-statement
             |         write-statement
             |         read-statement
             '''
    p[0] = {}

    p[0]['loopBeginList'] = p[1].get('loopBeginList', [])
    p[0]['loopEndList'] = p[1].get('loopEndList', [])

def p_write_statement(p):
    ''' write-statement :         CONSOLE DOT WRITELINE OPEN_PAREN print-list CLOSE_PAREN DELIM
             '''
    for dic in p[5]:
        TAC.emit('','',dic['place'],'Print') #Modify(check for type)
    p[0] = {}

def p_print_list(p):
    ''' print-list :         expression
             |         expression COMMA print-list
             '''
    if len(p) == 2:
        p[0] = [ { 'place': p[1]['place'], 'type' : p[1]['type'] } ]
    elif len(p) == 4:
        p[0] = [ { 'place': p[1]['place'], 'type' : p[1]['type'] } ] + p[3]

def p_read_statement(p):
    ''' read-statement :         CONSOLE DOT READLINE OPEN_PAREN IDENTIFIER CLOSE_PAREN DELIM
             '''
    var = ST.lookupvar(p[5])    #Modify(managing read address)
    if var:
        TAC.emit('',var['place'],var['width'],'Read')
    else:
        error('undefinedVariable','Variable not declared', str(p.lexer.lineno))
    p[0] = {}

def p_labeled_statement(p):
    ''' labeled-statement :         IDENTIFIER COLON statement
             '''
    p[0] = {}

def p_declaration_statement(p):
    ''' declaration-statement :         local-variable-declaration DELIM
             |         local-constant-declaration DELIM
             '''
    p[0] = {}       # Return void

def p_local_variable_declaration(p):
    ''' local-variable-declaration :         type variable-declarators
             '''
    for identifier in p[2]:     #Implemented type checking in declaration
        if ST.lookupvar_curr(identifier['identifier_name']):
            error('alreadyDeclared','Variable already declared', str(p.lexer.lineno))
        else:
            if not identifier.get('initializer'):     # If not initialized
                if p[1].get('array', False):
                    newVar = ST.addvar(identifier['identifier_name'], p[1]['type'], 'array', p[1]['size'])
                else:
                    newVar = ST.addvar(identifier['identifier_name'], p[1]['type'])
            else:       # Variable initialized
                if p[1].get('array', False):
                    newVar = ST.addvar(identifier['identifier_name'], p[1]['type'], 'array', p[1]['size'])
                    for index, initializer in enumerate(identifier['initializer']):
                        TAC.emit(newVar['place'] + '[' + str(index) + ']', initializer['place'], '','=arr')
                else:
                    if identifier['initializer']['type']==p[1]['type']:
                        newVar = ST.addvar(identifier['identifier_name'], p[1]['type'])
                        TAC.emit(newVar['place'], identifier['initializer']['place'], '', '=')
                    else:
                        error('typeError','Type mismatch in declaration', str(p.lexer.lineno))

def p_local_constant_declaration(p):
    ''' local-constant-declaration :         CONST type constant-declarators
             '''
    for identifier in p[3]:
        if ST.lookupvar_curr(identifier['identifier_name']):
            error('alreadyDeclared','Constant already declared', str(p.lexer.lineno))
        else:
            if identifier['type']==p[2]['type']:
                newVar = ST.addvar(identifier['identifier_name'], p[2]['type'])
                TAC.emit(newVar['place'], identifier['place'], '', '=')
            else:
                error('typeError','Type mismatch in constant declaration', str(p.lexer.lineno))

def p_empty_statement(p):
    ''' empty-statement :         DELIM
             '''
    p[0]=['empty_statement']+[p[i] for i in range(1,len(p))]

def p_expression_statement(p):
    ''' expression-statement :         statement-expression DELIM
             '''
    p[0] = p[1]

def p_statement_expression(p):
    ''' statement-expression :         invocation-expression
             |         assignment
             '''
    p[0] = p[1]

def p_selection_statement(p):
    ''' selection-statement :         if-statement
             |         switch-statement
             '''
    p[0] = p[1]

def p_if_statement(p):
    ''' if-statement :         IF OPEN_PAREN expression CLOSE_PAREN M_if block
             '''
    p[0] = {}
    if p[3]['type']=="bool":
        p[0]['nextList'] = p[5]['falseList'] + p[0].get('nextList',[])

        TAC.backPatch(p[0]['nextList'],TAC.getNextQuad())

        p[0]['loopBeginList'] = p[6].get('loopBeginList',[])
        p[0]['loopEndList'] = p[6].get('loopEndList',[])
    else:
        error('typeError','If else expression not bool', str(p.lexer.lineno))

def p_if_else_statement(p):
    ''' if-statement :         IF OPEN_PAREN expression CLOSE_PAREN M_if block ELSE M_else block
            | IF OPEN_PAREN expression CLOSE_PAREN M_if block ELSE M_else if-statement M_quad
             '''
    p[0] = {}
    if p[3]['type']=="bool":
        TAC.backPatch(p[5]['falseList'],p[8]['start'])
        p[0]['nextList'] = p[8]['nextList'] + p[0].get('nextList',[])

        TAC.backPatch(p[0]['nextList'],TAC.getNextQuad())

        p[0]['loopBeginList'] = p[6].get('loopBeginList',[]) + p[9].get('loopBeginList',[])
        p[0]['loopEndList'] = p[6].get('loopEndList',[]) + p[9].get('loopEndList',[])
    else:
        error('typeError','If else expression not bool', str(p.lexer.lineno))

def p_M_if(p):
    ''' M_if : empty
             '''
    p[0] = {'falseList' : [TAC.getNextQuad()]}
    TAC.emit(p[-2]['place'],'',-1,'cond_goto')

def p_M_else(p):
    ''' M_else : empty
             '''
    p[0] = {'nextList' : [TAC.getNextQuad()]}
    TAC.emit('','',-1,'goto')
    p[0]['start']=TAC.getNextQuad()

def p_M_quad(p):
    ''' M_quad : empty
             '''
    p[0] = TAC.getNextQuad()

def p_switch_statement(p):
    ''' switch-statement :         SWITCH OPEN_PAREN expression CLOSE_PAREN switch-block
             '''
    p[0]=['switch_statement']+[p[i] for i in range(1,len(p))]

def p_switch_block(p):
    ''' switch-block :         BLOCK_BEGIN switch-sections-opt BLOCK_END
             '''
    p[0]=['switch_block']+[p[i] for i in range(1,len(p))]

def p_switch_sections_opt(p):
    ''' switch-sections-opt :         switch-sections
             |         empty
             '''
    p[0]=['switch_sections_opt']+[p[i] for i in range(1,len(p))]

def p_switch_sections(p):
    ''' switch-sections :         switch-section
             |         switch-sections switch-section
             '''
    p[0]=['switch_sections']+[p[i] for i in range(1,len(p))]

def p_switch_section(p):
    ''' switch-section :         switch-labels statement-list
             '''
    p[0]=['switch_section']+[p[i] for i in range(1,len(p))]

def p_switch_labels(p):
    ''' switch-labels :         switch-label
             |         switch-labels switch-label
             '''
    p[0]=['switch_labels']+[p[i] for i in range(1,len(p))]

def p_switch_label(p):
    ''' switch-label :         CASE expression COLON
             |         DEFAULT COLON
             '''
    p[0]=['switch_label']+[p[i] for i in range(1,len(p))]

def p_iteration_statement(p):
    ''' iteration-statement :         while-statement M_quad
             |         for-statement M_quad
             |         do-statement M_quad
             '''
    p[0] = p[1]
    if len(p)==3:
        TAC.backPatch(p[0]['nextList'],p[2])

def p_while_statement(p):
    ''' while-statement :         WHILE M_quad OPEN_PAREN expression CLOSE_PAREN M_while block
             '''
    p[0] = {}
    if p[4]['type'] == 'bool':
        TAC.backPatch(p[7].get('loopBeginList',[]), p[2])
        TAC.emit('','',p[2],'goto')
        p[0]['nextList'] = p[6]['falseList'] + p[7].get('loopEndList', [])
    else:
        error('typeError','While expression not bool', str(p.lexer.lineno))

def p_M_while(p):
    ''' M_while : empty
             '''
    p[0] = {'falseList' : [TAC.getNextQuad()]}
    TAC.emit(p[-2]['place'],'',-1,'cond_goto')

def p_do_statement(p):
    ''' do-statement :         DO M_quad block WHILE OPEN_PAREN M_quad expression CLOSE_PAREN DELIM
             '''
    p[0] = {}
    if p[7]['type'] == 'bool':
        TAC.backPatch(p[3]['loopBeginList'],p[6])
        p[0]['nextList']=[TAC.getNextQuad()]+p[3]['loopEndList']
        TAC.emit(p[7]['place'], '', -1, 'cond_goto')
        TAC.emit('','',p[2], 'goto')
    else:
        error('typeError','Do-While expression not bool', str(p.lexer.lineno))

def p_for_statement(p):
    ''' for-statement :         FOR OPEN_PAREN for-initializer-opt DELIM M_quad for-condition DELIM M_quad for-iterator-opt CLOSE_PAREN M_quad block 
             '''
    #12
    p[0] = {}
    if p[6]['type']=='bool':
        p[0]['nextList']=p[6]['falseList']+p[12]['loopEndList']
        TAC.backPatch(p[6]['trueList'],p[11])
        TAC.backPatch(p[12]['loopBeginList'],p[8])
        TAC.emit('','',p[8],'goto')
    else:
        error('typeError','For condition not bool', str(p.lexer.lineno))


def p_for_initializer_opt(p):
    ''' for-initializer-opt :         for-initializer
             |         empty
             '''
    p[0] = p[1]

def p_for_initializer(p):
    ''' for-initializer :             statement-expression-list
             '''
    p[0] = p[1]

def p_for_condition(p):
    ''' for-condition :         expression
             '''
    p[0] = p[1]
    p[0]['falseList'] = [TAC.getNextQuad()]
    TAC.emit(p[1]['place'],'',-1,'cond_goto')
    p[0]['trueList'] = [TAC.getNextQuad()]
    TAC.emit('','',-1,'goto')

def p_for_iterator_opt(p):
    ''' for-iterator-opt :         for-iterator
             |         empty
             '''
    p[0]={}
    TAC.emit('','',p[-4],'goto')


def p_for_iterator(p):
    ''' for-iterator :         statement-expression-list
             '''
    p[0]=p[1]

def p_statement_expression_list(p):
    ''' statement-expression-list :         statement-expression
             |         statement-expression-list COMMA statement-expression
             '''
    p[0]=p[1]

def p_jump_statement(p):
    ''' jump-statement :         break-statement
             |         continue-statement
             |         goto-statement
             |         return-statement
             '''
    p[0] = p[1]

def p_break_statement(p):
    ''' break-statement :         BREAK DELIM
             '''
    p[0]={}
    TAC.emit('','',-1,'goto')
    p[0]['loopEndList'] = [TAC.getCurrentQuad()]

def p_continue_statement(p):
    ''' continue-statement :         CONTINUE DELIM
             '''
    p[0] = {}
    TAC.emit('','',-1,'goto')
    p[0]['loopBeginList'] = [TAC.getCurrentQuad()]

def p_goto_statement(p):
    ''' goto-statement :         GOTO IDENTIFIER DELIM
             '''
    p[0]=['goto_statement']+[p[i] for i in range(1,len(p))]

def p_return_statement(p):
    ''' return-statement :         RETURN expression-opt DELIM
             '''
    p[0]=['return_statement']+[p[i] for i in range(1,len(p))]

def p_expression_opt(p):
    ''' expression-opt :         expression
             |         empty
             '''
    p[0] = p[1]

def p_constructor_declaration(p):
    ''' constructor-declaration :         constructor-declarator constructor-body
             '''
    p[0]=['constructor_declaration']+[p[i] for i in range(1,len(p))]

def p_constructor_declarator(p):
    ''' constructor-declarator :         IDENTIFIER OPEN_PAREN formal-parameter-list-opt CLOSE_PAREN 
             '''
    p[0]=['constructor_declarator']+[p[i] for i in range(1,len(p))]

def p_constructor_body(p):
    ''' constructor-body :         block
             |         DELIM
             '''
    p[0]=['constructor_body']+[p[i] for i in range(1,len(p))]

def p_destructor_declaration(p):
    ''' destructor-declaration :         BITCOMP IDENTIFIER OPEN_PAREN CLOSE_PAREN destructor-body
             '''
    p[0]=['destructor_declaration']+[p[i] for i in range(1,len(p))]

def p_destructor_body(p):
    ''' destructor-body :         block
             |         DELIM
             '''
    p[0]=['destructor_body']+[p[i] for i in range(1,len(p))]

def p_literal_int(p):
    ''' literal :     ICONST
             '''
    p[0] = {}
    p[0]['type'] = 'int'
    p[0]['value'] = int(p[1])

def p_literal_double(p):
    ''' literal :     DCONST
             '''
    p[0] = {}
    p[0]['type'] = 'double'
    p[0]['value'] = float(p[1])

def p_literal_bool(p):
    ''' literal :    TRUE
             |     FALSE
             '''
    p[0] = {}
    p[0]['type'] = 'bool'
    if p[1] == 'true':
        p[0]['value'] = 1
    elif p[1] == 'false':
        p[0]['value'] = 0

def p_empty(p):
    'empty :'
    p[0] = {}
    pass

def p_error(p):
    if p:
        error('SyntaxError', "Syntax error", str(p.lineno))
        print 'Token : {}'.format(p)
    else:
        error('SyntaxError', "Syntax error")
    # while True:
    #     tok = yacc.token()
    #     if not tok or tok.type == 'DELIM': break
    # yacc.restart()
    flag = 0
    while 1:
        token = yacc.token()
        if not token:
            break
        elif token.type in ['DELIM']:
            flag = 1
            break
    if flag == 1:
        yacc.errok()
        return token
    # if flag:
    #     yacc.errok()
    #     return token
    # # global flag_for_error
    # # flag_for_error = 1
    # # if p is not None:
    # #     errors_list.append("Error %s"%(p.lineno))
    # #     yacc.errok()
    # # else:
    # #     print("Unexpected end of input")

parser = yacc.yacc()

def runParser(inputFile):
    program = open(inputFile).read()
    result = parser.parse(program,lexer=lexer, debug=False, tracking=True)
    return result

if __name__ == "__main__":
    # lex.runmain(lexer)
    inputFile = argv[1]
    parse = runParser(inputFile)
    showCompilationStatus()

    filename = inputFile.split('.')[0] + '.dot'
    png_filename = inputFile.split('.')[0] + '.png'
    createdot.createFile(parse, filename)

    ST.printTable()
    TAC.printCode()
    # from subprocess import call
    # call(["dot ", "-Tpng", filename, "-o", png_filename])
