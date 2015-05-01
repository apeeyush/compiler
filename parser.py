import sys
import ply.lex as lex
import ply.yacc as yacc
import lexer
from sys import argv
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

def getWidthForArgtypelist(argtypelist, uppertypelist):
    dic = {"int":4,"double":8,"bool":4,"char":4}
    widthlist = []
    width = 0
    for i in range(len(argtypelist)):
        item = argtypelist[i]
        widthlist.append(width)
        if uppertypelist[i] != 'simple':
            width+=4
        else:
            width+=dic.get('item',4)
    return widthlist

def p_compilation_unit(p):
    ''' compilation-unit :         class-declarations-opt
             ''' #remove method declaration from statement-list at the end
    mainclass, mainmethod, mainCount = ST.mainClass()
    if mainCount > 1:
        error('badStructure', 'Main function defined more that once', str(p.lexer.lineno))
    if mainclass:
        if bool(mainclass.varlist):
            error('badStructure', 'Class with main method cannot have data members', str(p.lexer.lineno))
        if mainmethod.argtypelist:
            error('badStructure', 'Arguments not allowed in main method', str(p.lexer.lineno))
    else:
        error('badStructure', 'Main function not found', str(p.lexer.lineno))

def p_semi_opt(p):
    ''' semi-opt :         DELIM
             |         empty
             '''
    p[0] = p[1]

def p_class_declarations_opt(p):
    ''' class-declarations-opt :         class-declarations
             |         empty
             '''
    p[0]=p[1]

def p_class_declarations(p):
    ''' class-declarations :         class-declaration
             |         class-declarations class-declaration
             '''
    p[0]=p[1]

def p_class_declaration(p):
    ''' class-declaration :          class-header class-body semi-opt
             '''
    ST.end_scope()

def p_class_header(p):
    ''' class-header : CLASS IDENTIFIER COLON class-type
             |         CLASS IDENTIFIER
             '''
    dic = {"int":4,"double":8,"bool":4,"char":4}
    if ST.searchClass(p[2]):
        error('Class error','Class already declared',str(p.lexer.lineno))
    else:
        if len(p) == 5:
            if ST.searchClass(p[4]['type']):
                ST.begin_scope(p[2],'classType',parentClass=p[4]['type'])
                parentclass=ST.searchClass(p[4]['type'])
                for varname in parentclass.varlist:
                    width=parentclass.varlist[varname]['width']
                    if parentclass.varlist[varname]['uppertype'] == 'array':
                        width=width/dic[parentclass.varlist[varname]['type']]
                    var = ST.addvar(varname, parentclass.varlist[varname]['type'],parentclass.varlist[varname]['uppertype'],width)
                    var['modifier'] = parentclass.varlist[varname].get('modifier','public')
            else:
                error('Class error','Base class not declared',str(p.lexer.lineno)) 
        else:
            ST.begin_scope(p[2],'classType')

def p_class_type(p):
    ''' class-type :         IDENTIFIER
             '''
    p[0] = {}
    p[0]['type']=p[1]
    p[0]['uppertype']='class'

def p_class_body(p):
    ''' class-body :         BLOCK_BEGIN class-member-declarations-opt BLOCK_END
             '''
    p[0]={}

def p_class_member_declarations_opt(p):
    ''' class-member-declarations-opt :         class-member-declarations
             |         empty
             '''
    p[0]={}

def p_class_member_declarations(p):
    ''' class-member-declarations :         class-member-declaration
             |         class-member-declarations class-member-declaration
             '''
    p[0]={}

def p_class_member_declaration(p):
    ''' class-member-declaration :         constant-declaration
             |         field-declaration
             |         method-declaration
             '''
    p[0]=p[1]

def p_constant_declaration(p):
    ''' constant-declaration :         CONST simple-type constant-declarators DELIM
             '''
    for identifier in p[3]:
        if ST.lookupvar_curr(identifier['identifier_name']):
            error('alreadyDeclared','Constant already declared', str(p.lexer.lineno))
        elif ST.searchFunc(identifier['identifier_name']):
            error('alreadyDeclared','A function of the same name exists',str(p.lexer.lineno))
        else:
            if identifier.get('uppertype','simple') != 'simple':
                error('type Error','Constants have to be simple type',str(p.lexer.lineno))
            elif identifier['type']==p[2]['type']:
                newVar = ST.addvar(identifier['identifier_name'], p[2]['type'])
                newVar['isConstant']=True
                TAC.emit(newVar['place'], identifier['place'],'', '=')
            else:
                error('typeError','Type mismatch in constant declaration', str(p.lexer.lineno))
    

def p_constant_declaration_mod(p):
    ''' constant-declaration :         modifier CONST simple-type constant-declarators DELIM
             '''
    for identifier in p[4]:
        if ST.lookupvar_curr(identifier['identifier_name']):
            error('alreadyDeclared','Constant already declared', str(p.lexer.lineno))
        elif ST.searchFunc(identifier['identifier_name']):
            error('alreadyDeclared','A function of the same name exists',str(p.lexer.lineno))
        else:
            if identifier.get('uppertype','simple') != 'simple':
                error('type Error','Constants have to be simple type',str(p.lexer.lineno))
            elif identifier['type']==p[3]['type']:
                newVar = ST.addvar(identifier['identifier_name'], p[3]['type'])
                newVar['isConstant']=True
                newVar['modifier']=p[1]
                TAC.emit(newVar['place'], identifier['place'], '', '=')
            else:
                error('typeError','Type mismatch in constant declaration', str(p.lexer.lineno))
    
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
             |         CHAR
             |         STRING
             '''
    p[0] = {'type' : p[1], 'uppertype': 'simple'}

def p_array_type(p):
    ''' array-type :         simple-type OPEN_BRACKET ICONST CLOSE_BRACKET
             '''
    p[0] = p[1]
    p[0]['uppertype'] = 'array'
    p[0]['array'] = True
    p[0]['size'] = p[3]
    if int(p[3]) < 0:
        error('badDeclaration', 'Array index cannot be negative', str(p.lexer.lineno))

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
            p[0]['place']=ST.gentmp(p[3]['type'])
            p[0]['type']=p[3]['type']
            nextquad=TAC.getNextQuad()
            TAC.emit(p[1]['place'],0,nextquad+3,'cond_goto')
            TAC.emit(p[0]['place'],p[3]['place'],'','=')
            nextquad=TAC.getNextQuad()
            TAC.emit('','',nextquad+2,'goto')
            TAC.emit(p[0]['place'],p[5]['place'],'','=')

def p_conditional_or_expression(p):
    ''' conditional-or-expression :         conditional-and-expression
             |         conditional-or-expression M_or LOGOR conditional-and-expression
             '''
    if len(p) == 2:
        p[0] = p[1]
    elif len(p) == 5:
        p[0] = {}
        if p[1]['type'] == p[4]['type'] == 'bool':
            p[0]['type'] = 'bool'
            p[0]['place'] = ST.gentmp('bool')
            TAC.emit(p[0]['place'],p[4]['place'],'','=')
            plc = [TAC.getNextQuad()]
            TAC.emit('','',-1,'goto')
            #place=ST.gentmp('bool')
            TAC.backpatch(p[2],TAC.getNextQuad())
            TAC.emit(p[0]['place'],1,'','=dec')
            TAC.backpatch(plc,TAC.getNextQuad())
        else:
            error('typeError', 'Incorrect type in LOGOR expression', str(p.lexer.lineno))
            p[0]['type'] = 'typeError'

def p_M_or(p):
    ''' M_or : empty
             '''
    place=ST.gentmp('bool')
    TAC.emit(place,1,'','=dec')
    p[0] = [TAC.getNextQuad()]
    TAC.emit(p[-1]['place'],place,-1,'cond_goto')


def p_M_and(p):
    ''' M_and : empty
             '''
    place=ST.gentmp('bool')
    TAC.emit(place,0,'','=dec')
    p[0] = [TAC.getNextQuad()]
    TAC.emit(p[-1]['place'],place,-1,'cond_goto')

def p_conditional_and_expression(p):
    ''' conditional-and-expression :         inclusive-or-expression
             |         conditional-and-expression M_and LOGAND inclusive-or-expression
             '''
    if len(p) == 2:
        p[0] = p[1]
    elif len(p) == 5:
        p[0] = {}
        if p[1]['type'] == p[4]['type'] == 'bool':
            p[0]['type'] = 'bool'
            p[0]['place'] = ST.gentmp('bool')
            TAC.emit(p[0]['place'],p[4]['place'],'','=')
            plc = [TAC.getNextQuad()]
            TAC.emit('','',-1,'goto')
            TAC.backpatch(p[2],TAC.getNextQuad())
            TAC.emit(p[0]['place'],0,'','=dec')
            TAC.backpatch(plc,TAC.getNextQuad())
        else:
            error('typeError', 'Incorrect type in LOGOR expression', str(p.lexer.lineno))
            p[0]['type'] = 'typeError'

def p_inclusive_or_expression(p):
    ''' inclusive-or-expression :         exclusive-or-expression
             |         inclusive-or-expression BITOR exclusive-or-expression
             '''
    if len(p) == 2:
        p[0] = p[1]
    elif len(p) == 4:
        p[0] = {}
        if p[1]['type'] == p[3]['type'] == 'int':
            p[0]['type'] = 'int'
        else:
            p[0]['type'] = 'typeError'
            error('typeError', 'Incorrect type in BITOR expression', str(p.lexer.lineno))
        p[0]['place'] = ST.gentmp(p[0]['type'])
        TAC.emit(p[0]['place'], p[1]['place'], p[3]['place'], p[2])

def p_exclusive_or_expression(p):
    ''' exclusive-or-expression :         and-expression
             |         exclusive-or-expression BITXOR and-expression
             '''
    if len(p) == 2:
        p[0] = p[1]
    elif len(p) == 4:
        p[0] = {}
        if p[1]['type'] == p[3]['type'] == 'int':
            p[0]['type'] = 'int'
        else:
            p[0]['type'] = 'typeError'
            error('typeError', 'Incorrect type in BITXOR expression', str(p.lexer.lineno))
        p[0]['place'] = ST.gentmp(p[0]['type'])
        TAC.emit(p[0]['place'], p[1]['place'], p[3]['place'], p[2])

def p_and_expression(p):
    ''' and-expression :         equality-expression
             |         and-expression BITAND equality-expression
             '''
    if len(p) == 2:
        p[0] = p[1]
    elif len(p) == 4:
        p[0] = {}
        if p[1]['type'] == p[3]['type'] == 'int':
            p[0]['type'] = 'int'
        else:
            p[0]['type'] = 'typeError'
            error('typeError', 'Incorrect type in BITAND expression', str(p.lexer.lineno))
        p[0]['place'] = ST.gentmp(p[0]['type'])
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
        p[0]['place'] = ST.gentmp(p[0]['type'])
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

        p[0]['place'] = ST.gentmp(p[0]['type'])
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

        p[0]['place'] = ST.gentmp(p[0]['type'])
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
        p[0]['place'] = ST.gentmp(p[0]['type'])
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
        if p[1]['type'] == p[3]['type'] == 'int':
            p[0]['type'] = p[1]['type']
        elif p[1]['type'] == p[3]['type'] == 'double' and p[2] in ['*','/']:
            p[0]['type'] = p[1]['type']
        else:
            p[0]['type'] = 'typeError'
            error('typeError', 'Incorrect type in Multiplicative expression', str(p.lexer.lineno))
        p[0]['place'] = ST.gentmp(p[0]['type'])
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
        p[0]['type'] = p[2]['type']
        p[0]['place'] = ST.gentmp(p[0]['type'])
        if p[1] == '~':
            TAC.emit(p[0]['place'],p[2]['place'], '', p[1])
        else:
            TAC.emit(p[0]['place'],p[2]['place'], '', p[1]+'unary')
    elif p[2]['type'] in ['bool'] and p[1] in ['!']:
        p[0] = {}
        p[0]['type'] = p[2]['type']
        p[0]['place'] = ST.gentmp(p[0]['type'])
        TAC.emit(p[0]['place'],p[2]['place'],'',p[1])
    else:
        error('typeError', 'Unary expression type mismatch', str(p.lexer.lineno))

def p_primary_expression(p):
    ''' primary-expression :         primary-no-array-creation-expression
             '''
    p[0] = p[1]

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
    if p[1]['type'] != 'string':
        p[0] = { 'type': p[1]['type']}
        p[0]['place'] = ST.gentmp(p[0]['type'])
        TAC.emit(p[0]['place'], p[1]['value'], '', '=dec')
    else:
        p[0] = { 'type': p[1]['type']}
        p[0]['place'] = ST.genstring()
        ST.addString(p[0]['place'], p[1]['value'])

def p_primary_no_array_creation_expression_identifier(p):
    ''' primary-no-array-creation-expression :         IDENTIFIER
             '''
    var = ST.lookupvar(p[1])
    if not var:
        var=ST.lookupvar_Class(p[1])
        if not var:
            error('undefinedVariable', 'Identifier Used before initialization', str(p.lexer.lineno))
        else:
            p[0]={}
            p[0]['place']=ST.gentmp(var['type'])
            p[0]['type']=var['type']
            TAC.emit(p[0]['place'],var['place'],'','=_derefload')
    else:
        p[0] = var

def p_primary_no_array_creation_expression_element(p):
    ''' primary-no-array-creation-expression :         element-access
             '''
    p[0] = {}
    p[0]['type']=p[1]['var']['type']
    p[0]['place']=ST.gentmp(p[0]['type'])
    if p[1].get('fromclass',False):
        TAC.emit(p[0]['place'],p[1]['var']['place']+'|'+p[1]['exp']['place'],'','=arr_derefload')
    else:
        TAC.emit(p[0]['place'],p[1]['var']['place']+'|'+p[1]['exp']['place'],'','=arr')

def p_primary_no_array_creation_expression_parenthesized(p):
    ''' primary-no-array-creation-expression :         parenthesized-expression
             '''
    p[0] = p[1]

def p_primary_no_array_creation_expression_member(p):
    ''' primary-no-array-creation-expression :         member-access
             '''
    p[0]={}
    var = p[1]['var']
    member = p[1]['member']
    p[0]['place']=ST.gentmp(member['type'])
    p[0]['type']=member['type']
    TAC.emit(p[0]['place'],var['place']+"@"+member['place'], '', '=_obj')

def p_primary_no_array_creation_expression_invocation(p):
    ''' primary-no-array-creation-expression :         invocation-expression
             '''
    p[0] = p[1]


def p_primary_no_array_creation_expression_object(p):
    ''' primary-no-array-creation-expression :        object-creation-expression
             '''
    p[0] = p[1]


def p_object_creation_expression(p):
    ''' object-creation-expression : NEW class-type OPEN_PAREN argument-list-opt CLOSE_PAREN
    '''
    p[0]={}
    classname=ST.searchClass(p[2]['type'])
    if classname:
        place=ST.gentmp('int')
        TAC.emit(place,'',classname.width,'=alloc')
        p[0]['place']=place
        p[0]['type']=classname.name
        p[0]['uppertype']='class'
    else:
        error("Class error","Class not declared",str(p.lexer.lineno))

def p_parenthesized_expression(p):
    ''' parenthesized-expression :         OPEN_PAREN expression CLOSE_PAREN
             '''
    p[0]=p[2]

def p_member_access(p):
    ''' member-access :         IDENTIFIER DOT IDENTIFIER
             '''
    p[0] = {}
    var=ST.lookupvar(p[1])
    if var:
        if var['uppertype']=='class':
            member = ST.isvarinClass(p[3],var['type'])
            if member:
                if member.get('modifier','public')=="public":
                    p[0]['var']=var
                    p[0]['member']=member
                else:
                    error("access error","variable access not permitted",str(p.lexer.lineno))                
            else:
                error('access error', 'Class member not defined', str(p.lexer.lineno))
        else:
            error("access error",p[1]+" not an object type",str(p.lexer.lineno))
    else:
        error("access error",p[1]+" object not found",str(p.lexer.lineno))
        


def p_invocation_expression_1(p):
    ''' invocation-expression :         IDENTIFIER OPEN_PAREN argument-list-opt CLOSE_PAREN
             '''
    if p[1] == 'Main':
        error('badStructure','Main function cannot be called',str(p.lexer.lineno))
    p[0] = {}
    funcEnv = ST.searchFunc(p[1])
    if funcEnv:
        argtypelist = []
        uppertypelist = []
        for argument in p[3]:
            argtypelist.append(argument['type'])
            uppertypelist.append(argument.get('uppertype','simple'))
        if funcEnv.argtypelist == argtypelist and uppertypelist == funcEnv.uppertypelist:
            # Print function parameters
            TAC.emit("@self",'',str(funcEnv.Class)+'_'+p[1],'param')
            widthlist = getWidthForArgtypelist(argtypelist, uppertypelist)
            for i in range(len(p[3])):
                argument = p[3][i]
                TAC.emit(argument['place'],widthlist[i],str(funcEnv.Class)+'_'+p[1],'param')
            # Jump to function
            TAC.emit('', '', str(funcEnv.Class)+'_'+p[1], 'jumplabel')
            p[0]['type'] = funcEnv.returnType
            if (funcEnv.returnType != 'void'):
                p[0]['place'] = ST.gentmp(p[0]['type'])
                TAC.emit('','',p[0]['place'],'getreturn')
        else:
            error('incorrectArgumentTypeList', 'Incorrect argument types in function call', str(p.lexer.lineno))
    else:
        error('undefinedFunction', 'Function not defined', str(p.lexer.lineno))

def p_invocation_expression_2(p):
    ''' invocation-expression :         IDENTIFIER DOT IDENTIFIER OPEN_PAREN argument-list-opt CLOSE_PAREN
             '''
    if p[3] == 'Main':
        error('badStructure','Main function cannot be called',str(p.lexer.lineno))
    p[0] = {}
    var=ST.lookupvar(p[1])
    if var:
        if var['uppertype']=='class':
            funcEnv = ST.searchFuncinClass(p[3],var['type'])
            if funcEnv:
                argtypelist = []
                uppertypelist = []
                for argument in p[5]:
                    argtypelist.append(argument['type'])
                    uppertypelist.append(argument.get('uppertype','simple'))
                if funcEnv.argtypelist == argtypelist and uppertypelist == funcEnv.uppertypelist:
                    # Print function parameters
                    TAC.emit("@object",var['place'],str(funcEnv.Class)+'_'+p[3],'param')
                    widthlist = getWidthForArgtypelist(argtypelist, uppertypelist)
                    for i in range(len(p[5])):
                        argument = p[5][i]
                        TAC.emit(argument['place'],widthlist[i],str(funcEnv.Class)+'_'+p[3],'param')
                    # Jump to function
                    TAC.emit('', '', str(funcEnv.Class)+'_'+p[3], 'jumplabel')
                    p[0]['type'] = funcEnv.returnType
                    if (funcEnv.returnType != 'void'):
                        p[0]['place'] = ST.gentmp(p[0]['type'])
                        TAC.emit('','',p[0]['place'],'getreturn')
                else:
                    error('incorrectArgumentTypeList', 'Incorrect argument types in function call', str(p.lexer.lineno))
            else:
                error('undefinedFunction', 'Function not defined', str(p.lexer.lineno))
        else:
            error("Function error",p[1]+" not an object type",str(p.lexer.lineno))
    else:
        error("Function error",p[1]+" object not found",str(p.lexer.lineno))
        

def p_argument_list_opt(p):
    ''' argument-list-opt :         expression-list
             |         empty
             '''
    p[0] = p[1]

def p_element_access(p):
    ''' element-access :         IDENTIFIER OPEN_BRACKET expression CLOSE_BRACKET
             '''
    p[0]={}
    var = ST.lookupvar(p[1])
    if var:
        if var.get('uppertype','simple')!='array':
            error("Array error","Array access through non array element",str(p.lexer.lineno))
        elif p[3]['type']!='int':
            error('Non integer index','Array indice not an integer',p.lexer.lineno())
        else:
            p[0]['var']=var
            p[0]['exp']=p[3]
    else:
        var=ST.lookupvar_Class(p[1])
        if var:
            if p[3]['type']=='int':
                p[0]['var']=var
                p[0]['exp']=p[3]
                p[0]['fromclass']=True
        else:
            error('undefinedVariable','Array not defined',p.lexer.lineno())

def p_element_access_member(p):
    ''' element-access :         member-access OPEN_BRACKET expression CLOSE_BRACKET
             '''
    p[0]={}
    var=p[1]['var']
    member=p[1]['member']
    if member.get('uppertype','simple')!='array':
        error("Array error","Array access through non array element",str(p.lexer.lineno))
    else:
        if p[3]['type']=="int":
            p[0]['var']={}
            p[0]['var']['type']=member['type']
            p[0]['var']['place']=var['place']+"@"+member['place']
            p[0]['exp']=p[3]
        else:
            error('Non integer index','Array indice not an integer',p.lexer.lineno())

def p_assignment_identifier(p):
    ''' assignment :         IDENTIFIER assignment-operator expression
             '''
    p[0]={}
    var = ST.lookupvar(p[1])
    if var:
        if not var.get('isConstant',False):
            if var['type']!=p[3]['type']:
                error('typeError', 'Type mismatch in assignment', str(p.lexer.lineno))
            else:
                # If string assignment
                if var['type']=='string':
                    if p[2] == '=':
                        TAC.emit(var['place'],p[3]['place'],'','=str')
                    else:
                        error('unsupportedOperation', 'Operation '+p[2]+' not supported on string datatype.')
                # If not string
                else:
                    TAC.emit(var['place'], p[3]['place'], '', p[2])
                    p[0]['place']=var['place']
                    p[0]['type']=var['type']
        else:
            error('constantAssignment','Cannont assign constant', str(p.lexer.lineno))
    else:
        var=ST.lookupvar_Class(p[1])
        if var:
            if not var.get('isConstant', False):
                if p[2] != '=':
                    error('unsupportedOperation', 'Operation'+p[2]+'not supported here.', str(p.lexer.lineno))
                TAC.emit(var['place'],p[3]['place'],'',p[2]+'_derefstore')
                p[0]['place']=var['place']
                p[0]['type']=var['type']
            else:
                error('constantAssignment','Cannont assign constant', str(p.lexer.lineno))
        else:
            error('undefinedVariable','Variable not declared', str(p.lexer.lineno))


def p_assignment_member(p):
    ''' assignment :         member-access assignment-operator expression
             '''
    p[0]={}
    var = p[1]['var']
    member = p[1]['member']
    if member['type']!=p[3]['type']:
        error('typeError', 'Type mismatch in assignment', str(p.lexer.lineno))
    elif member.get('isConstant',False):
        error('constantError',"Cannot assign value to constant",str(p.lexer.lineno))
    else:
        if p[2] != '=':
            error('unsupportedOperation', 'Operation'+p[2]+'not supported here.', str(p.lexer.lineno))
        TAC.emit(var['place']+"@"+member['place'], p[3]['place'], '', p[2]+'_obj')
        p[0]['place']=ST.gentmp(member['type'])
        p[0]['type']=member['type']
        TAC.emit(p[0]['place'],var['place']+"@"+member['place'], '', p[2]+'_obj')
        
def p_assignment_element(p):
    ''' assignment :         element-access assignment-operator expression
             '''
    p[0]={}
    var = p[1]['var']
    if var:
        if var['type']!=p[3]['type']:
            error('typeError', 'Type mismatch in assignment', str(p.lexer.lineno))
        else:
            p[0]['type']=var['type']
            p[0]['place']=ST.gentmp(p[0]['type'])
            if p[1].get('fromclass',False):
                if p[2] != '=':
                    error('unsupportedOperation', 'Operation'+p[2]+'not supported here.', str(p.lexer.lineno))
                TAC.emit(var['place']+'|'+p[1]['exp']['place'], p[3]['place'], '', p[2]+'arr_derefstore')
                TAC.emit( p[0]['place'], var['place']+'|'+p[1]['exp']['place'],'', p[2]+'arr_derefload')
            else:
                if p[2] != '=':
                    error('unsupportedOperation', 'Operation'+p[2]+'not supported here.', str(p.lexer.lineno))
                TAC.emit(var['place']+'|'+p[1]['exp']['place'], p[3]['place'], '', p[2]+'arr')
                TAC.emit( p[0]['place'], var['place']+'|'+p[1]['exp']['place'],'', p[2]+'arr')
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

def p_field_declaration_mod(p):
    ''' field-declaration :         modifier type variable-declarators DELIM
             '''
    if p[2]['type'] == 'string':
        error('unsupportedType','String type not supported on field declaration', str(p.lexer.lineno))
    for identifier in p[3]:
        if ST.lookupvar_curr(identifier['identifier_name']):
            error('alreadyDeclared','Class field already declared', str(p.lexer.lineno))
        elif ST.searchFunc(identifier['identifier_name']):
            error('alreadyDeclared','A function of the same name exists',str(p.lexer.lineno))
        else:
            if not identifier.get('initializer'):     # If not initialized
                if p[2].get('array', False):
                    newVar = ST.addvar(identifier['identifier_name'], p[2]['type'], 'array', p[2]['size'])
                else:
                    newVar = ST.addvar(identifier['identifier_name'], p[2]['type'])
            else:       # Variable initialized
                if p[2].get('array', False):
                    newVar = ST.addvar(identifier['identifier_name'], p[2]['type'], 'array', p[2]['size'])
                    for index, initializer in enumerate(identifier['initializer']):
                        TAC.emit(newVar['place'] + '|' + str(index), initializer['place'], '','=arr')
                else:
                    if identifier['initializer']['type']==p[2]['type']:
                        newVar = ST.addvar(identifier['identifier_name'], p[2]['type'])
                        TAC.emit(newVar['place'], identifier['initializer']['place'], '', '=')
                    else:
                        error('typeError','Type mismatch in declaration', str(p.lexer.lineno))
            newVar['modifier']=p[1]
                        
def p_field_declaration(p):
    ''' field-declaration :         type variable-declarators DELIM
             '''
    if p[1]['type'] == 'string':
        error('unsupportedType','String type not supported on field declaration', str(p.lexer.lineno))
    for identifier in p[2]:
        if ST.lookupvar_curr(identifier['identifier_name']):
            error('alreadyDeclared','Class field already declared', str(p.lexer.lineno))
        elif ST.searchFunc(identifier['identifier_name']):
            error('alreadyDeclared','A function of the same name exists',str(p.lexer.lineno))
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
                        TAC.emit(newVar['place'] + '|' + str(index), initializer['place'], '','=arr')
                else:
                    if identifier['initializer']['type']==p[1]['type']:
                        newVar = ST.addvar(identifier['identifier_name'], p[1]['type'])
                        TAC.emit(newVar['place'], identifier['initializer']['place'], '', '=')
                    else:
                        error('typeError','Type mismatch in declaration', str(p.lexer.lineno))

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
    elif len(p) == 4:
        p[0] = { 'identifier_name' : p[1], 'initializer' : p[3]}

def p_method_declaration(p):
    ''' method-declaration :         method-header method-body
             '''
    p[0] = {} 
    ST.end_scope()

def p_method_header_type(p):
    ''' method-header :         type IDENTIFIER OPEN_PAREN formal-parameter-list-opt CLOSE_PAREN
             '''
    classname=None
    if ST.curr_env:
        classname=ST.curr_env.name
    ST.begin_scope(p[2],'methodType',p[1]['type'],Class=classname)
    TAC.emit('','',str(classname)+'_'+p[2],'Label')
    TAC.emit('','','','storereturn')
    argtypelist = []
    uppertypelist = []
    ST.addvar("@returnVar","int")
    ST.addvar("@self","int")
    for parameter in p[4]:
        if parameter.get('uppertype','simple') != 'simple':
            ST.addvar(parameter['identifier_name'], parameter['type'], parameter.get('uppertype','simple'),4)
        else:
            ST.addvar(parameter['identifier_name'], parameter['type'])
        argtypelist.append(parameter['type'])
        uppertypelist.append(parameter['uppertype'])
        if parameter['uppertype'] == 'array':
            error('unsupportedType', 'Array passing not supported on method', str(p.lexer.lineno))
    ST.addargtypelist(argtypelist)
    ST.adduppertypelist(uppertypelist)

def p_method_header_void(p):
    ''' method-header :         VOID IDENTIFIER OPEN_PAREN formal-parameter-list-opt CLOSE_PAREN
             '''
    classname=None
    if ST.curr_env:
        classname=ST.curr_env.name
    TAC.emit('','',str(classname)+'_'+p[2],'Label')
    TAC.emit('','','','storereturn')
    ST.begin_scope(p[2],'methodType','void',Class=classname)
    argtypelist = []
    uppertypelist = []
    ST.addvar("@returnVar","int")
    ST.addvar("@self","int")
    for parameter in p[4]:
        if parameter.get('uppertype','simple') != 'simple':
            ST.addvar(parameter['identifier_name'], parameter['type'], parameter.get('uppertype','simple'),4)
        else:
            ST.addvar(parameter['identifier_name'], parameter['type'])
        argtypelist.append(parameter['type'])
        uppertypelist.append(parameter['uppertype'])
        if parameter['uppertype'] == 'array':
            error('unsupportedType', 'Array passing not supported on method', str(p.lexer.lineno))
    ST.addargtypelist(argtypelist)
    ST.adduppertypelist(uppertypelist)

def p_formal_parameter_list_opt(p):
    ''' formal-parameter-list-opt :         formal-parameter-list
             |         empty
             '''
    p[0] = p[1]

def p_formal_parameter_list(p):
    ''' formal-parameter-list :         fixed-parameters
             '''
    p[0] = p[1]

def p_fixed_parameters(p):
    ''' fixed-parameters :         fixed-parameter
             |         fixed-parameters COMMA fixed-parameter
             '''
    if len(p) == 2:
        p[0] = [p[1]]
    elif len(p) == 4:
        p[0] = p[1] + [p[3]]

def p_fixed_parameter(p):
    ''' fixed-parameter :          type IDENTIFIER
             '''
    p[0] = {'type' : p[1]['type'], 'identifier_name' : p[2], 'uppertype' : p[1].get('uppertype','simple')}

def p_method_body(p):
    ''' method-body :         method-block
             '''
    p[0] = p[1]

def p_method_block(p):
    ''' method-block : BLOCK_BEGIN statement-list-opt BLOCK_END
             '''
    p[0] = {}

    TAC.emit('','','','jumpback')
    p[0]['loopBeginList'] = p[2].get('loopBeginList', [])
    p[0]['loopEndList'] = p[2].get('loopEndList', [])


def p_block(p):
    ''' block :         BLOCK_BEGIN M_bstart statement-list-opt BLOCK_END
             '''
    p[0] = {}

    p[0]['loopBeginList'] = p[3].get('loopBeginList', [])
    p[0]['loopEndList'] = p[3].get('loopEndList', [])
    ST.end_scope()

def p_M_bstart(p):
    ''' M_bstart : empty
             '''
    ST.begin_scope()

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
             |         method-declaration
             '''
    p[0] = {}

    p[0]['loopBeginList'] = p[1].get('loopBeginList', [])
    p[0]['loopEndList'] = p[1].get('loopEndList', [])

def p_write_statement(p):
    ''' write-statement :         CONSOLE DOT WRITELINE OPEN_PAREN print-list CLOSE_PAREN DELIM
             '''
    for dic in p[5]:
        if dic['type'] == 'int':
            TAC.emit('','',dic['place'],'PrintInt')
        elif dic['type'] == 'double':
            TAC.emit('','',dic['place'],'PrintDouble')
        elif dic['type'] == 'char':
            TAC.emit('','',dic['place'],'PrintChar')
        elif dic['type'] == 'string':
            TAC.emit('','',dic['place'],'PrintString')
        elif dic['type'] == 'bool':
            TAC.emit('','',dic['place'],'PrintBool')
        else:
            TAC.emit('','',dic['place'],'Print')
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
    p[0] = {}
    var = ST.lookupvar(p[5])    #Modify(managing read address)
    if var:
        if not var.get('isConstant',False):
            if var['type'] == 'int':
                TAC.emit('',var['place'],var['width'],'ReadInt')
            elif var['type'] == 'double':
                TAC.emit('',var['place'],var['width'],'ReadDouble')
            elif var['type'] == 'char':
                TAC.emit('',var['place'],var['width'],'ReadChar')
            elif var['type'] == 'string':
                TAC.emit('',var['place'],var['width'],'ReadString')
            else:
                TAC.emit('',var['place'],var['width'],'Read')
        else:
            error('constantAssignment','Cannont read constant', str(p.lexer.lineno))
    else:
        var=ST.lookupvar_Class(p[5])
        if var:
            if not var.get('isConstant', False):
                TAC.emit('',var['place'],var['width'],'Read_deref')
            else:
                error('constantAssignment','Cannont read constant', str(p.lexer.lineno))
        else:
            error('undefinedVariable','Variable not declared', str(p.lexer.lineno))

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
    for identifier in p[2]:
        if ST.lookupvar_curr(identifier['identifier_name']):
            error('alreadyDeclared','Variable already declared', str(p.lexer.lineno))
        elif ST.searchFunc(identifier['identifier_name']):
            error('alreadyDeclared','A function of the same name exists',str(p.lexer.lineno))
        else:
            # If class type
            if p[1].get('uppertype',None)=='class':
                if p[2][0]['initializer']['type']==p[1]['type']:
                    newVar = ST.addvar(identifier['identifier_name'], p[1]['type'], 'class', 4)
                    TAC.emit(newVar['place'],p[2][0]['initializer']['place'],'','=')
                else:
                    error("Class error","Class doesn't match",str(p.lexer.lineno))
            # If string type
            elif p[1]['type'] == 'string':
                newVar = ST.addvar(identifier['identifier_name'], 'string')
                ST.addString(newVar['place'],'')
                if identifier.get('initializer'):
                    TAC.emit(newVar['place'],identifier['initializer']['place'],'','=str')
            # If variable is not initialized
            elif not identifier.get('initializer'):
                if p[1].get('array', False):
                    newVar = ST.addvar(identifier['identifier_name'], p[1]['type'], 'array', p[1]['size'])
                else:
                    newVar = ST.addvar(identifier['identifier_name'], p[1]['type'])
            # If variable is initialized
            else:
                # If array
                if p[1].get('array', False):
                    newVar = ST.addvar(identifier['identifier_name'], p[1]['type'], 'array', p[1]['size'])
                    if int(p[1]['size']) == len(identifier['initializer']):
                        for index, initializer in enumerate(identifier['initializer']):
                            TAC.emit(newVar['place'] + '|' + str(index), initializer['place'], '','=arr')
                    else:
                        error('badInitialization','Array not fully initialized',str(p.lexer.lineno))
                # If not array
                else:
                    if identifier['initializer']['type']==p[1]['type']:
                        newVar = ST.addvar(identifier['identifier_name'], p[1]['type'])
                        TAC.emit(newVar['place'], identifier['initializer']['place'], '', '=')
                    else:
                        error('typeError','Type mismatch in declaration', str(p.lexer.lineno))

def p_local_constant_declaration(p):
    ''' local-constant-declaration :         CONST simple-type constant-declarators
             '''
    for identifier in p[3]:
        if ST.lookupvar_curr(identifier['identifier_name']):
            error('alreadyDeclared','Constant already declared', str(p.lexer.lineno))
        elif ST.searchFunc(identifier['identifier_name']):
            error('alreadyDeclared','A function of the same name exists',str(p.lexer.lineno))
        else:
            if identifier.get('uppertype','simple') != 'simple':
                error('type Error','Constants have to be simple type',str(p.lexer.lineno))
            elif identifier['type']==p[2]['type']:
                newVar = ST.addvar(identifier['identifier_name'], p[2]['type'])
                newVar['isConstant'] = True
                TAC.emit(newVar['place'], identifier['place'], '', '=')
            else:
                error('typeError','Type mismatch in constant declaration', str(p.lexer.lineno))


def p_empty_statement(p):
    ''' empty-statement :         DELIM
             '''
    p[0]={}

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

        TAC.backpatch(p[0]['nextList'],TAC.getNextQuad())

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
        TAC.backpatch(p[5]['falseList'],p[8]['start'])
        p[0]['nextList'] = p[8]['nextList'] + p[0].get('nextList',[])

        TAC.backpatch(p[0]['nextList'],TAC.getNextQuad())

        p[0]['loopBeginList'] = p[6].get('loopBeginList',[]) + p[9].get('loopBeginList',[])
        p[0]['loopEndList'] = p[6].get('loopEndList',[]) + p[9].get('loopEndList',[])
    else:
        error('typeError','If else expression not bool', str(p.lexer.lineno))

def p_M_if(p):
    ''' M_if : empty
             '''
    p[0] = {'falseList' : [TAC.getNextQuad()]}
    TAC.emit(p[-2]['place'],0,-1,'cond_goto')

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
    ''' switch-statement :         SWITCH OPEN_PAREN expression M_switch CLOSE_PAREN M_quad switch-block
             '''
    p[0]={}
    TAC.backpatch(p[4],TAC.getNextQuad())
    for var in p[7]['cases']:
        if var['value']:
            if var['type']==p[3]['type']:
                place=ST.gentmp(var['type'])
                TAC.emit(place,var['value'],'','=dec')
                TAC.emit(p[3]['place'],place,var['addr'],'cond_goto')
            else:
                error('Switch Error','Switch Value type mismatch with case type',p.lexer.lineno)
        else:
            TAC.emit('','',var['addr'],'goto')
    TAC.backpatch(p[7]['nextList'],TAC.getNextQuad())

    p[0]['loopBeginList'] = p[7].get('loopBeginList', [])

def p_M_switch(p):
    ''' M_switch :        empty
             '''
    p[0]=[TAC.getNextQuad()]
    TAC.emit('','',-1,'goto')

def p_switch_block(p):
    ''' switch-block :         BLOCK_BEGIN M_bstart switch-sections BLOCK_END
             '''
    p[0]=p[3]
    ST.end_scope()
    p[0]['loopBeginList'] = p[3].get('loopBeginList', [])
    p[0]['loopEndList'] = p[3].get('loopEndList', [])

def p_switch_sections(p):
    ''' switch-sections :         switch-section
             |         switch-sections switch-section
             '''
    if len(p)==2:
        p[0]=p[1]
        p[0]['loopBeginList'] = p[1].get('loopBeginList', [])
        p[0]['loopEndList'] = p[1].get('loopEndList', [])
    else:
        p[0]={}
        p[0]['cases']=p[1]['cases']+p[2]['cases']
        p[0]['nextList']=p[1]['nextList']+p[2]['nextList']

        p[0]['loopBeginList'] = p[1].get('loopBeginList', []) + p[2].get('loopBeginList', [])
        p[0]['loopEndList'] = p[1].get('loopEndList', []) + p[2].get('loopEndList', [])

def p_switch_section(p):
    ''' switch-section :         switch-label M_quad statement-list 
             '''
    p[0]={}
    p[0]['cases']=[{'value':p[1]['value'],'type':p[1]['type'],'addr':p[2]}]
    if p[3]['loopEndList']!=[]:
        p[0]['nextList']=p[3]['loopEndList']
    else:
        error('Switch Error','Switch case does not have a break statement',p.lexer.lineno)

    p[0]['loopBeginList'] = p[3].get('loopBeginList', [])
    p[0]['loopEndList'] = p[3].get('loopEndList', [])

def p_switch_label(p):
    ''' switch-label :         CASE literal COLON
             |         DEFAULT COLON
             '''
    if len(p)==4:
        p[0]=p[2]
    else:
        p[0]={'value':None,'type':None}

def p_iteration_statement(p):
    ''' iteration-statement :         while-statement M_quad
             |         for-statement M_quad
             |         do-statement M_quad
             '''
    p[0] = p[1]
    if len(p)==3:
        TAC.backpatch(p[0]['nextList'],p[2])

def p_while_statement(p):
    ''' while-statement :         WHILE M_quad OPEN_PAREN expression CLOSE_PAREN M_while block
             '''
    p[0] = {}
    if p[4]['type'] == 'bool':
        TAC.backpatch(p[7].get('loopBeginList',[]), p[2])
        TAC.emit('','',p[2],'goto')
        p[0]['nextList'] = p[6]['falseList'] + p[7].get('loopEndList', [])
    else:
        error('typeError','While expression not bool', str(p.lexer.lineno))

def p_M_while(p):
    ''' M_while : empty
             '''
    p[0] = {'falseList' : [TAC.getNextQuad()]}
    TAC.emit(p[-2]['place'],0,-1,'cond_goto')

def p_do_statement(p):
    ''' do-statement :         DO M_quad block WHILE OPEN_PAREN M_quad expression CLOSE_PAREN DELIM
             '''
    p[0] = {}
    if p[7]['type'] == 'bool':
        TAC.backpatch(p[3]['loopBeginList'],p[6])
        p[0]['nextList']=[TAC.getNextQuad()]+p[3]['loopEndList']
        TAC.emit(p[7]['place'], 0, -1, 'cond_goto')
        TAC.emit('','',p[2], 'goto')
    else:
        error('typeError','Do-While expression not bool', str(p.lexer.lineno))

def p_for_statement(p):
    ''' for-statement :         FOR OPEN_PAREN for-initializer-opt DELIM M_quad for-condition DELIM M_quad for-iterator-opt CLOSE_PAREN M_quad block 
             '''
    p[0] = {}
    if p[6]['type']=='bool':
        p[0]['nextList']=p[6]['falseList']+p[12]['loopEndList']
        TAC.backpatch(p[6]['trueList'],p[11])
        TAC.backpatch(p[12]['loopBeginList'],p[8])
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
    TAC.emit(p[1]['place'],0,-1,'cond_goto')
    p[0]['trueList'] = [TAC.getNextQuad()]
    TAC.emit('','',-1,'goto')

def p_for_condition_empty(p):
    ''' for-condition :         empty
             '''
    p[0] = p[1]
    p[0]['falseList'] = [TAC.getNextQuad()]
    TAC.emit('','','','')
    p[0]['trueList'] = [TAC.getNextQuad()]
    p[0]['type']='bool';

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
             |         return-statement
             '''
    p[0] = p[1]

def p_break_statement(p):
    ''' break-statement :         BREAK DELIM
             '''
    p[0]={}
    TAC.emit('','',-1,'goto')
    p[0]['loopEndList'] = [TAC.getcurrentquad()]

def p_continue_statement(p):
    ''' continue-statement :         CONTINUE DELIM
             '''
    p[0] = {}
    TAC.emit('','',-1,'goto')
    p[0]['loopBeginList'] = [TAC.getcurrentquad()]

def p_return_statement(p):
    ''' return-statement :         RETURN expression DELIM
             |                      RETURN DELIM
             '''
    p[0] = {}
    if len(p) == 4:
        if p[2]:
            if p[2]['type'] == ST.lookupFuncType():
                TAC.emit('','',p[2]['place'],'setreturn')
                TAC.emit('','','','jumpback')
            else:
                error('incorrectReturnType', 'Incorrect return type. Shoud be ' + ST.lookupFuncType(), str(p.lexer.lineno))
    elif len(p) == 3:
        if 'void' == ST.lookupFuncType():
            TAC.emit('','','','jumpback')
        else:
            error('incorrectReturnType', 'Incorrect return type. Shoud be void', str(p.lexer.lineno))

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

def p_literal_char(p):
    ''' literal :    CCONST
             '''
    p[0] = {}
    p[0]['type'] = 'char'
    p[0]['value'] = p[1]

def p_literal_string(p):
    ''' literal :    SCONST
             '''
    p[0] = {}
    p[0]['type'] = 'string'
    p[0]['value'] = p[1]

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

parser = yacc.yacc()

def runParser(inputFile):
    program = open(inputFile).read()
    result = parser.parse(program,lexer=lexer, debug=False, tracking=True)
    return result

def getIR(filename):
    inputFile = filename
    parse = runParser(inputFile)
    showCompilationStatus()
    return errorFlag, ST, TAC

if __name__ == "__main__":
    # lex.runmain(lexer)
    inputFile = argv[1]
    parse = runParser(inputFile)
    # # filename = inputFile.split('.')[0] + '.dot'
    # # png_filename = inputFile.split('.')[0] + '.png'
    # # createdot.createFile(parse, filename)
    # # from subprocess import call
    # # call(["dot ", "-Tpng", filename, "-o", png_filename])
    # ST.printTable()
    TAC.printCode()
    showCompilationStatus()
