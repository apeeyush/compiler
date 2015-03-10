import sys
import ply.lex as lex
import ply.yacc as yacc
import lexer
from sys import argv

variables = { }       # Dictionary of stored variables

tokens = lexer.tokens

lexer = lexer.lexer

def p_compilation_unit(p):
    ''' compilation-unit :         namespace-member-declarations-opt
             '''
def p_namespace_member_declarations_opt(p):
    ''' namespace-member-declarations-opt :         namespace-member-declarations
             |         empty
             '''
def p_namespace_member_declarations(p):
    ''' namespace-member-declarations :         namespace-member-declaration
             |         namespace-member-declarations namespace-member-declaration
             '''
def p_namespace_member_declaration(p):
    ''' namespace-member-declaration :         namespace-declaration
             |         type-declaration
             '''
def p_namespace_declaration(p):
    ''' namespace-declaration :         NAMESPACE IDENTIFIER namespace-body semi-opt
             '''
def p_semi_opt(p):
    ''' semi-opt :         DELIM
             |         empty
             '''
def p_namespace_body(p):
    ''' namespace-body :         BLOCK_BEGIN namespace-member-declarations-opt BLOCK_END
             '''
def p_type_declaration(p):
    ''' type-declaration :         class-declaration
             '''
def p_class_declaration(p):
    ''' class-declaration :         CLASS IDENTIFIER class-base-opt class-body semi-opt
             '''
def p_class_base_opt(p):
    ''' class-base-opt :         class-base
             |         empty
             '''
def p_class_base(p):
    ''' class-base :         COLON class-type
             '''
def p_class_type(p):
    ''' class-type :         IDENTIFIER
             |         OBJECT
             |         STRING
             '''
def p_class_body(p):
    ''' class-body :         BLOCK_BEGIN class-member-declarations-opt BLOCK_END
             '''
def p_class_member_declarations_opt(p):
    ''' class-member-declarations-opt :         class-member-declarations
             |         empty
             '''
def p_class_member_declarations(p):
    ''' class-member-declarations :         class-member-declaration
             |         class-member-declarations class-member-declaration
             '''
def p_class_member_declaration(p):
    ''' class-member-declaration :         constant-declaration
             |         field-declaration
             |         method-declaration
             |         constructor-declaration
             |         destructor-declaration
             |         type-declaration
             '''
def p_constant_declaration(p):
    ''' constant-declaration :         modifiers-opt CONST type constant-declarators DELIM
             '''
def p_type(p):
    ''' type :         simple-type
             |         class-type
             |         array-type
             '''
def p_simple_type(p):
    ''' simple-type :         numeric-type
             |         BOOL
             '''
def p_numeric_type(p):
    ''' numeric-type :         integral-type
             |         floating-point-type
             |         DECIMAL
             '''
def p_integral_type(p):
    ''' integral-type :         SBYTE
             |         BYTE
             |         SHORT
             |         USHORT
             |         INT
             |         UINT
             |         LONG
             |         ULONG
             |         CHAR
             '''
def p_floating_point_type(p):
    ''' floating-point-type :         FLOAT
             |         DOUBLE
             '''
def p_array_type(p):
    ''' array-type :         non-array-type rank-specifier
             '''
def p_non_array_type(p):
    ''' non-array-type :         simple-type
             |         class-type
             '''
def p_rank_specifier(p):
    ''' rank-specifier :         OPEN_BRACKET dim-separators-opt CLOSE_BRACKET
             '''
def p_dim_separators_opt(p):
    ''' dim-separators-opt :         dim-separators
             |         empty
             '''
def p_dim_separators(p):
    ''' dim-separators :         COMMA
             |         dim-separators COMMA
             '''
def p_constant_declarators(p):
    ''' constant-declarators :         constant-declarator
             |         constant-declarators COMMA constant-declarator
             '''
def p_constant_declarator(p):
    ''' constant-declarator :         IDENTIFIER ASSIGN constant-expression
             '''
def p_constant_expression(p):
    ''' constant-expression :         expression
             '''
def p_expression(p):
    ''' expression :         conditional-expression
             |         assignment
             '''
def p_conditional_expression(p):
    ''' conditional-expression :         conditional-or-expression
             |         conditional-or-expression CONDOP expression COLON expression
             '''
def p_conditional_or_expression(p):
    ''' conditional-or-expression :         conditional-and-expression
             |         conditional-or-expression LOGOR conditional-and-expression
             '''
def p_conditional_and_expression(p):
    ''' conditional-and-expression :         inclusive-or-expression
             |         conditional-and-expression LOGAND inclusive-or-expression
             '''
def p_inclusive_or_expression(p):
    ''' inclusive-or-expression :         exclusive-or-expression
             |         inclusive-or-expression BITOR exclusive-or-expression
             '''
def p_exclusive_or_expression(p):
    ''' exclusive-or-expression :         and-expression
             |         exclusive-or-expression BITXOR and-expression
             '''
def p_and_expression(p):
    ''' and-expression :         equality-expression
             |         and-expression BITAND equality-expression
             '''
def p_equality_expression(p):
    ''' equality-expression :         relational-expression
             |         equality-expression EQ relational-expression
             |         equality-expression NE relational-expression
             '''
def p_relational_expression(p):
    ''' relational-expression :         shift-expression
             |         relational-expression LT shift-expression
             |         relational-expression GT shift-expression
             |         relational-expression LE shift-expression
             |         relational-expression GE shift-expression
             '''
def p_shift_expression(p):
    ''' shift-expression :         additive-expression
             |         shift-expression LSHIFT additive-expression
             |         shift-expression RSHIFT additive-expression
             '''
def p_additive_expression(p):
    ''' additive-expression :         multiplicative-expression
             |         additive-expression PLUS multiplicative-expression
             |         additive-expression MINUS multiplicative-expression
             '''
def p_multiplicative_expression(p):
    ''' multiplicative-expression :         unary-expression
             |         multiplicative-expression TIMES unary-expression
             |         multiplicative-expression DIV unary-expression
             |         multiplicative-expression MOD unary-expression
             '''
def p_unary_expression(p):
    ''' unary-expression :         primary-expression
             |         PLUS unary-expression
             |         MINUS unary-expression
             |         BITNOT unary-expression
             |         BITCOMP unary-expression
             |         TIMES unary-expression
             |         pre-increment-expression
             |         pre-decrement-expression
             |         cast-expression
             '''
def p_primary_expression(p):
    ''' primary-expression :         array-creation-expression
             |         primary-no-array-creation-expression
             '''
def p_array_creation_expression(p):
    ''' array-creation-expression :         NEW non-array-type OPEN_BRACKET expression-list CLOSE_BRACKET array-initializer-opt
             |         NEW array-type array-initializer
             '''
def p_array_initializer_opt(p):
    ''' array-initializer-opt :         array-initializer
             |         empty
             '''
def p_expression_list(p):
    ''' expression-list :         expression
             |         expression-list COMMA expression
             '''
def p_array_initializer(p):
    ''' array-initializer :         BLOCK_BEGIN variable-initializer-list-opt BLOCK_END
             |         BLOCK_BEGIN variable-initializer-list COMMA BLOCK_END
             '''
def p_variable_initializer_list_opt(p):
    ''' variable-initializer-list-opt :         variable-initializer-list
             |         empty
             '''
def p_variable_initializer_list(p):
    ''' variable-initializer-list :         variable-initializer
             |         variable-initializer-list COMMA variable-initializer
             '''
def p_variable_initializer(p):
    ''' variable-initializer :         expression
             |         array-initializer
             '''
def p_primary_no_array_creation_expression(p):
    ''' primary-no-array-creation-expression :         literal
             |         IDENTIFIER
             |         parenthesized-expression
             |         member-access
             |         invocation-expression
             |         element-access
             |         this-access
             |         base-access
             |         post-increment-expression
             |         post-decrement-expression
             |         object-creation-expression
             |         typeof-expression
             '''
def p_parenthesized_expression(p):
    ''' parenthesized-expression :         OPEN_PAREN expression CLOSE_PAREN
             '''
def p_member_access(p):
    ''' member-access :         primary-expression DOT IDENTIFIER
             |         predefined-type DOT IDENTIFIER
             '''
def p_predefined_type(p):
    ''' predefined-type :         BOOL
             |         BYTE
             |         CHAR
             |         DECIMAL
             |         DOUBLE
             |         FLOAT
             |         INT
             |         LONG
             |         OBJECT
             |         SBYTE
             |         SHORT
             |         STRING
             |         UINT
             |         ULONG
             |         USHORT
             '''
def p_invocation_expression(p):
    ''' invocation-expression :         primary-expression OPEN_PAREN argument-list-opt CLOSE_PAREN
             '''
def p_argument_list_opt(p):
    ''' argument-list-opt :         argument-list
             |         empty
             '''
def p_argument_list(p):
    ''' argument-list :         argument
             |         argument-list COMMA argument
             '''
def p_argument(p):
    ''' argument :         expression
             |         REF variable-reference
             |         OUT variable-reference
             '''
def p_variable_reference(p):
    ''' variable-reference :         expression
             '''
def p_element_access(p):
    ''' element-access :         primary-no-array-creation-expression OPEN_BRACKET expression-list CLOSE_BRACKET
             '''
def p_this_access(p):
    ''' this-access :         THIS
             '''
def p_base_access(p):
    ''' base-access :         BASE DOT IDENTIFIER
             |         BASE OPEN_BRACKET expression-list CLOSE_BRACKET
             '''
def p_post_increment_expression(p):
    ''' post-increment-expression :         primary-expression INCRE
             '''
def p_post_decrement_expression(p):
    ''' post-decrement-expression :         primary-expression DECRE
             '''
def p_object_creation_expression(p):
    ''' object-creation-expression :         NEW type OPEN_PAREN argument-list-opt CLOSE_PAREN
             '''
def p_typeof_expression(p):
    ''' typeof-expression :         TYPEOF OPEN_PAREN type CLOSE_PAREN
             |         TYPEOF OPEN_PAREN VOID CLOSE_PAREN
             '''
def p_pre_increment_expression(p):
    ''' pre-increment-expression :         INCRE unary-expression
             '''
def p_pre_decrement_expression(p):
    ''' pre-decrement-expression :         DECRE unary-expression
             '''
def p_cast_expression(p):
    ''' cast-expression :         OPEN_PAREN type CLOSE_PAREN unary-expression
             '''
def p_assignment(p):
    ''' assignment :         unary-expression assignment-operator expression
             '''
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
def p_field_declaration(p):
    ''' field-declaration :         modifiers-opt type variable-declarators DELIM
             '''
def p_modifiers_opt(p):
    ''' modifiers-opt :         modifiers
             |         empty
             '''
def p_modifiers(p):
    ''' modifiers :         modifier
             |         modifiers modifier
             '''
def p_modifier(p):
    ''' modifier :         NEW
             |         PUBLIC
             |         PROTECTED
             |         PRIVATE
             |         STATIC
             '''
def p_variable_declarators(p):
    ''' variable-declarators :         variable-declarator
             |         variable-declarators COMMA variable-declarator
             '''
def p_variable_declarator(p):
    ''' variable-declarator :         IDENTIFIER
             |         IDENTIFIER ASSIGN variable-initializer
             '''
def p_method_declaration(p):
    ''' method-declaration :         method-header method-body
             '''
def p_method_header(p):
    ''' method-header :         modifiers-opt return-type member-name OPEN_PAREN formal-parameter-list-opt CLOSE_PAREN
             '''
def p_formal_parameter_list_opt(p):
    ''' formal-parameter-list-opt :         formal-parameter-list
             |         empty
             '''
def p_return_type(p):
    ''' return-type :         type
             |         VOID
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
    ''' fixed-parameter :         parameter-modifier-opt type IDENTIFIER
             '''
def p_parameter_modifier_opt(p):
    ''' parameter-modifier-opt :         parameter-modifier
             |         empty
             '''
def p_parameter_modifier(p):
    ''' parameter-modifier :         REF
             |         OUT
             '''
def p_method_body(p):
    ''' method-body :         block
             |         DELIM
             '''
def p_block(p):
    ''' block :         BLOCK_BEGIN statement-list-opt BLOCK_END
             '''
def p_statement_list_opt(p):
    ''' statement-list-opt :         statement-list
             |         empty
             '''
def p_statement_list(p):
    ''' statement-list :         statement
             |         statement-list statement
             '''
def p_statement(p):
    ''' statement :         labeled-statement
             |         declaration-statement
             |         embedded-statement
             '''
def p_labeled_statement(p):
    ''' labeled-statement :         IDENTIFIER COLON statement
             '''
def p_declaration_statement(p):
    ''' declaration-statement :         local-variable-declaration DELIM
             |         local-constant-declaration DELIM
             '''
def p_local_variable_declaration(p):
    ''' local-variable-declaration :         type local-variable-declarators
             '''
def p_local_variable_declarators(p):
    ''' local-variable-declarators :         local-variable-declarator
             |         local-variable-declarators COMMA local-variable-declarator
             '''
def p_local_variable_declarator(p):
    ''' local-variable-declarator :         IDENTIFIER
             |         IDENTIFIER ASSIGN local-variable-initializer
             '''
def p_local_variable_initializer(p):
    ''' local-variable-initializer :         expression
             |         array-initializer
             '''
def p_local_constant_declaration(p):
    ''' local-constant-declaration :         CONST type constant-declarators
             '''
def p_embedded_statement(p):
    ''' embedded-statement :         block
             |         empty-statement
             |         expression-statement
             |         selection-statement
             |         iteration-statement
             |         jump-statement
             '''
def p_empty_statement(p):
    ''' empty-statement :         DELIM
             '''
def p_expression_statement(p):
    ''' expression-statement :         statement-expression DELIM
             '''
def p_statement_expression(p):
    ''' statement-expression :         invocation-expression
             |         object-creation-expression
             |         assignment
             |         post-increment-expression
             |         post-decrement-expression
             |         pre-increment-expression
             |         pre-decrement-expression
             '''
def p_selection_statement(p):
    ''' selection-statement :         if-statement
             |         switch-statement
             '''
def p_if_statement(p):
    ''' if-statement :         IF OPEN_PAREN boolean-expression CLOSE_PAREN embedded-statement
             |         IF OPEN_PAREN boolean-expression CLOSE_PAREN embedded-statement ELSE embedded-statement
             '''
def p_boolean_expression(p):
    ''' boolean-expression :         expression
             '''
def p_switch_statement(p):
    ''' switch-statement :         SWITCH OPEN_PAREN expression CLOSE_PAREN switch-block
             '''
def p_switch_block(p):
    ''' switch-block :         BLOCK_BEGIN switch-sections-opt BLOCK_END
             '''
def p_switch_sections_opt(p):
    ''' switch-sections-opt :         switch-sections
             |         empty
             '''
def p_switch_sections(p):
    ''' switch-sections :         switch-section
             |         switch-sections switch-section
             '''
def p_switch_section(p):
    ''' switch-section :         switch-labels statement-list
             '''
def p_switch_labels(p):
    ''' switch-labels :         switch-label
             |         switch-labels switch-label
             '''
def p_switch_label(p):
    ''' switch-label :         CASE constant-expression COLON
             |         DEFAULT COLON
             '''
def p_iteration_statement(p):
    ''' iteration-statement :         while-statement
             |         for-statement
             |         foreach-statement
             '''
def p_while_statement(p):
    ''' while-statement :         WHILE OPEN_PAREN boolean-expression CLOSE_PAREN embedded-statement
             '''
def p_for_statement(p):
    ''' for-statement :         FOR OPEN_PAREN for-initializer-opt DELIM for-condition-opt DELIM for-iterator-opt CLOSE_PAREN embedded-statement
             '''
def p_for_initializer_opt(p):
    ''' for-initializer-opt :         for-initializer
             |         empty
             '''
def p_for_initializer(p):
    ''' for-initializer :         local-variable-declaration
             |         statement-expression-list
             '''
def p_for_condition_opt(p):
    ''' for-condition-opt :         for-condition
             |         empty
             '''
def p_for_condition(p):
    ''' for-condition :         boolean-expression
             '''
def p_for_iterator_opt(p):
    ''' for-iterator-opt :         for-iterator
             |         empty
             '''
def p_for_iterator(p):
    ''' for-iterator :         statement-expression-list
             '''
def p_statement_expression_list(p):
    ''' statement-expression-list :         statement-expression
             |         statement-expression-list COMMA statement-expression
             '''
def p_foreach_statement(p):
    ''' foreach-statement :         FOREACH OPEN_PAREN type IDENTIFIER IN expression CLOSE_PAREN embedded-statement
             '''
def p_jump_statement(p):
    ''' jump-statement :         break-statement
             |         continue-statement
             |         goto-statement
             |         return-statement
             '''
def p_break_statement(p):
    ''' break-statement :         BREAK DELIM
             '''
def p_continue_statement(p):
    ''' continue-statement :         CONTINUE DELIM
             '''
def p_goto_statement(p):
    ''' goto-statement :         GOTO IDENTIFIER DELIM
             '''
def p_return_statement(p):
    ''' return-statement :         RETURN expression-opt DELIM
             '''
def p_expression_opt(p):
    ''' expression-opt :         expression
             |         empty
             '''
def p_constructor_declaration(p):
    ''' constructor-declaration :         constructor-declarator constructor-body
             '''
def p_constructor_declarator(p):
    ''' constructor-declarator :         IDENTIFIER OPEN_PAREN formal-parameter-list-opt CLOSE_PAREN 
             '''
def p_constructor_body(p):
    ''' constructor-body :         block
             |         DELIM
             '''
def p_destructor_declaration(p):
    ''' destructor-declaration :         BITCOMP IDENTIFIER OPEN_PAREN CLOSE_PAREN destructor-body
             '''
def p_destructor_body(p):
    ''' destructor-body :         block
             |         DELIM
             '''
def p_literal(p):
    ''' literal :     ICONST
             |     UICONST
             |     LICONST
             |     ULICONST
             |     FCONST
             |     DCONST
             |     MCONST
             |     CCONST
             |     SCONST
             |     VSCONST
             '''



def p_empty(p):
    'empty :'
    pass

parser = yacc.yacc(debug=True)

# def input(text):
#     result = parser.parse(text,lexer=lexer)
#     return result

# while True:
#     try:
#         s = raw_input("calc > ")
#     except EOFError:
#         break
#     r = input(s)
#     if r:
#         print(r)

def runParser(inputFile):
    program = open(inputFile).read()
    result = parser.parse(program,lexer=lexer, debug=True, tracking=True)
    return result

if __name__ == "__main__":
    # lex.runmain(lexer)
    inputFile = argv[1]
    print runParser(inputFile)

