import sys
import ply.lex as lex
import ply.yacc as yacc
import lexer
from sys import argv
import createdot

variables = { }       # Dictionary of stored variables
errors_list = []
tokens = lexer.tokens

lexer = lexer.lexer

precedence = (
('left', 'CLOSE_PAREN'),
('right', 'ELSE'),
)


def p_compilation_unit(p):
    ''' compilation-unit :         class-declarations-opt
             '''
    p[0]=['compilation_unit']+[p[i] for i in range(1,len(p))]

def p_semi_opt(p):
    ''' semi-opt :         DELIM
             |         empty
             '''
    p[0]=['semi_opt']+[p[i] for i in range(1,len(p))]

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
    p[0]=['class_type']+[p[i] for i in range(1,len(p))]

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
             |         class-declaration
             '''
    p[0]=['class_member_declaration']+[p[i] for i in range(1,len(p))]

def p_constant_declaration(p):
    ''' constant-declaration :         modifier CONST simple-type constant-declarators DELIM
             |         CONST simple-type constant-declarators DELIM
             '''
    p[0]=['constant_declaration']+[p[i] for i in range(1,len(p))]

def p_type(p):
    ''' type :         simple-type
             |         class-type
             |         array-type
             '''
    p[0]=['type']+[p[i] for i in range(1,len(p))]

def p_simple_type(p):
    ''' simple-type :         numeric-type
             |         BOOL
             '''
    p[0]=['simple_type']+[p[i] for i in range(1,len(p))]

def p_numeric_type(p):
    ''' numeric-type :         integral-type
             |         floating-point-type
             '''
    p[0]=['numeric_type']+[p[i] for i in range(1,len(p))]

def p_integral_type(p):
    ''' integral-type :         INT
             |         UINT
             |         LONG
             |         ULONG
             |         CHAR
             '''
    p[0]=['integral_type']+[p[i] for i in range(1,len(p))]

def p_floating_point_type(p):
    ''' floating-point-type :         FLOAT
             |         DOUBLE
             '''
    p[0]=['floating_point_type']+[p[i] for i in range(1,len(p))]

def p_array_type(p):
    ''' array-type :         simple-type rank-specifier
             '''
    p[0]=['array_type']+[p[i] for i in range(1,len(p))]

def p_rank_specifier(p):
    ''' rank-specifier :         OPEN_BRACKET dim-separators-opt CLOSE_BRACKET
             '''
    p[0]=['rank_specifier']+[p[i] for i in range(1,len(p))]

def p_dim_separators_opt(p):
    ''' dim-separators-opt :         dim-separators
             |         empty
             '''
    p[0]=['dim_separators_opt']+[p[i] for i in range(1,len(p))]

def p_dim_separators(p):
    ''' dim-separators :         COMMA
             |         dim-separators COMMA
             '''
    p[0]=['dim_separators']+[p[i] for i in range(1,len(p))]

def p_constant_declarators(p):
    ''' constant-declarators :         constant-declarator
             |         constant-declarators COMMA constant-declarator
             '''
    p[0]=['constant_declarators']+[p[i] for i in range(1,len(p))]

def p_constant_declarator(p):
    ''' constant-declarator :         IDENTIFIER ASSIGN expression
             '''
    p[0]=['constant_declarator']+[p[i] for i in range(1,len(p))]

def p_expression(p):
    ''' expression :         conditional-expression
             |         assignment
             '''
    p[0]=['expression']+[p[i] for i in range(1,len(p))]

def p_conditional_expression(p):
    ''' conditional-expression :         conditional-or-expression
             |         conditional-or-expression CONDOP expression COLON expression
             '''
    p[0]=['conditional_expression']+[p[i] for i in range(1,len(p))]

def p_conditional_or_expression(p):
    ''' conditional-or-expression :         conditional-and-expression
             |         conditional-or-expression LOGOR conditional-and-expression
             '''
    p[0]=['conditional_or_expression']+[p[i] for i in range(1,len(p))]

def p_conditional_and_expression(p):
    ''' conditional-and-expression :         inclusive-or-expression
             |         conditional-and-expression LOGAND inclusive-or-expression
             '''
    p[0]=['conditional_and_expression']+[p[i] for i in range(1,len(p))]

def p_inclusive_or_expression(p):
    ''' inclusive-or-expression :         exclusive-or-expression
             |         inclusive-or-expression BITOR exclusive-or-expression
             '''
    p[0]=['inclusive_or_expression']+[p[i] for i in range(1,len(p))]

def p_exclusive_or_expression(p):
    ''' exclusive-or-expression :         and-expression
             |         exclusive-or-expression BITXOR and-expression
             '''
    p[0]=['exclusive_or_expression']+[p[i] for i in range(1,len(p))]

def p_and_expression(p):
    ''' and-expression :         equality-expression
             |         and-expression BITAND equality-expression
             '''
    p[0]=['and_expression']+[p[i] for i in range(1,len(p))]

def p_equality_expression(p):
    ''' equality-expression :         relational-expression
             |         equality-expression EQ relational-expression
             |         equality-expression NE relational-expression
             '''
    p[0]=['equality_expression']+[p[i] for i in range(1,len(p))]

def p_relational_expression(p):
    ''' relational-expression :         shift-expression
             |         relational-expression LT shift-expression
             |         relational-expression GT shift-expression
             |         relational-expression LE shift-expression
             |         relational-expression GE shift-expression
             '''
    p[0]=['relational_expression']+[p[i] for i in range(1,len(p))]

def p_shift_expression(p):
    ''' shift-expression :         additive-expression
             |         shift-expression LSHIFT additive-expression
             |         shift-expression RSHIFT additive-expression
             '''
    p[0]=['shift_expression']+[p[i] for i in range(1,len(p))]

def p_additive_expression(p):
    ''' additive-expression :         multiplicative-expression
             |         additive-expression PLUS multiplicative-expression
             |         additive-expression MINUS multiplicative-expression
             '''
    p[0]=['additive_expression']+[p[i] for i in range(1,len(p))]

def p_multiplicative_expression(p):
    ''' multiplicative-expression :         unary-expression
             |         multiplicative-expression TIMES unary-expression
             |         multiplicative-expression DIV unary-expression
             |         multiplicative-expression MOD unary-expression
             '''
    p[0]=['multiplicative_expression']+[p[i] for i in range(1,len(p))]

def p_unary_expression(p):
    ''' unary-expression :         primary-expression
             |         PLUS unary-expression
             |         MINUS unary-expression
             |         BITNOT unary-expression
             |         BITCOMP unary-expression
             |         TIMES unary-expression
             |         pre-increment-expression
             |         pre-decrement-expression
             '''
    p[0]=['unary_expression']+[p[i] for i in range(1,len(p))]

def p_primary_expression(p):
    ''' primary-expression :         array-creation-expression
             |         primary-no-array-creation-expression
             '''
    p[0]=['primary_expression']+[p[i] for i in range(1,len(p))]

def p_array_creation_expression(p):
    ''' array-creation-expression :         NEW simple-type OPEN_BRACKET expression-list CLOSE_BRACKET array-initializer-opt
             '''
    p[0]=['array_creation_expression']+[p[i] for i in range(1,len(p))]

def p_array_initializer_opt(p):
    ''' array-initializer-opt :         array-initializer
             |         empty
             '''
    p[0]=['array_initializer_opt']+[p[i] for i in range(1,len(p))]

def p_expression_list(p):
    ''' expression-list :         expression
             |         expression-list COMMA expression
             '''
    p[0]=['expression_list']+[p[i] for i in range(1,len(p))]

def p_array_initializer(p):
    ''' array-initializer :         BLOCK_BEGIN variable-initializer-list-opt BLOCK_END
             '''
    p[0]=['array_initializer']+[p[i] for i in range(1,len(p))]

def p_variable_initializer_list_opt(p):
    ''' variable-initializer-list-opt :         variable-initializer-list
             |         empty
             '''
    p[0]=['variable_initializer_list_opt']+[p[i] for i in range(1,len(p))]

def p_variable_initializer_list(p):
    ''' variable-initializer-list :         variable-initializer
             |         variable-initializer-list COMMA variable-initializer
             '''
    p[0]=['variable_initializer_list']+[p[i] for i in range(1,len(p))]

def p_variable_initializer(p):
    ''' variable-initializer :         expression
             |         array-initializer
             '''
    p[0]=['variable_initializer']+[p[i] for i in range(1,len(p))]

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
             '''
    p[0]=['primary_no_array_creation_expression']+[p[i] for i in range(1,len(p))]

def p_parenthesized_expression(p):
    ''' parenthesized-expression :         OPEN_PAREN expression CLOSE_PAREN
             '''
    p[0]=['parenthesized_expression']+[p[i] for i in range(1,len(p))]

def p_member_access(p):
    ''' member-access :         primary-expression DOT IDENTIFIER
             '''
    p[0]=['member_access']+[p[i] for i in range(1,len(p))]

def p_invocation_expression(p):
    ''' invocation-expression :         primary-expression OPEN_PAREN argument-list-opt CLOSE_PAREN
             '''
    p[0]=['invocation_expression']+[p[i] for i in range(1,len(p))]

def p_argument_list_opt(p):
    ''' argument-list-opt :         argument-list
             |         empty
             '''
    p[0]=['argument_list_opt']+[p[i] for i in range(1,len(p))]

def p_argument_list(p):
    ''' argument-list :         argument
             |         argument-list COMMA argument
             '''
    p[0]=['argument_list']+[p[i] for i in range(1,len(p))]

def p_argument(p):
    ''' argument :         expression
             |         OUT variable-reference
             '''
    p[0]=['argument']+[p[i] for i in range(1,len(p))]

def p_variable_reference(p):
    ''' variable-reference :         expression
             '''
    p[0]=['variable_reference']+[p[i] for i in range(1,len(p))]

def p_element_access(p):
    ''' element-access :         primary-no-array-creation-expression OPEN_BRACKET expression-list CLOSE_BRACKET
             '''
    p[0]=['element_access']+[p[i] for i in range(1,len(p))]

def p_this_access(p):
    ''' this-access :         THIS
             '''
    p[0]=['this_access']+[p[i] for i in range(1,len(p))]

def p_base_access(p):
    ''' base-access :         BASE DOT IDENTIFIER
             |         BASE OPEN_BRACKET expression-list CLOSE_BRACKET
             '''
    p[0]=['base_access']+[p[i] for i in range(1,len(p))]

def p_post_increment_expression(p):
    ''' post-increment-expression :         primary-expression INCRE
             '''
    p[0]=['post_increment_expression']+[p[i] for i in range(1,len(p))]

def p_post_decrement_expression(p):
    ''' post-decrement-expression :         primary-expression DECRE
             '''
    p[0]=['post_decrement_expression']+[p[i] for i in range(1,len(p))]

def p_object_creation_expression(p):
    ''' object-creation-expression :         NEW type OPEN_PAREN argument-list-opt CLOSE_PAREN
             '''
    p[0]=['object_creation_expression']+[p[i] for i in range(1,len(p))]

def p_pre_increment_expression(p):
    ''' pre-increment-expression :         INCRE unary-expression
             '''
    p[0]=['pre_increment_expression']+[p[i] for i in range(1,len(p))]

def p_pre_decrement_expression(p):
    ''' pre-decrement-expression :         DECRE unary-expression
             '''
    p[0]=['pre_decrement_expression']+[p[i] for i in range(1,len(p))]

def p_assignment(p):
    ''' assignment :         primary-expression assignment-operator expression
             '''
    p[0]=['assignment']+[p[i] for i in range(1,len(p))]

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
    p[0]=['assignment_operator']+[p[i] for i in range(1,len(p))]

def p_field_declaration(p):
    ''' field-declaration :         modifier type variable-declarators DELIM
             |         type variable-declarators DELIM
             '''
    p[0]=['field_declaration']+[p[i] for i in range(1,len(p))]

def p_modifier(p):
    ''' modifier :         PUBLIC
             |         PRIVATE
             '''
    p[0]=['modifier']+[p[i] for i in range(1,len(p))]

def p_variable_declarators(p):
    ''' variable-declarators :         variable-declarator
             |         variable-declarators COMMA variable-declarator
             '''
    p[0]=['variable_declarators']+[p[i] for i in range(1,len(p))]

def p_variable_declarator(p):
    ''' variable-declarator :         IDENTIFIER
             |         IDENTIFIER ASSIGN variable-initializer
             '''
    p[0]=['variable_declarator']+[p[i] for i in range(1,len(p))]

def p_method_declaration(p):
    ''' method-declaration :         method-header method-body
             '''
    p[0]=['method_declaration']+[p[i] for i in range(1,len(p))]

def p_method_header(p):
    ''' method-header :         modifier type member-name OPEN_PAREN formal-parameter-list-opt CLOSE_PAREN
             |         modifier VOID member-name OPEN_PAREN formal-parameter-list-opt CLOSE_PAREN
             |         type member-name OPEN_PAREN formal-parameter-list-opt CLOSE_PAREN
             |         VOID member-name OPEN_PAREN formal-parameter-list-opt CLOSE_PAREN
             '''
    p[0]=['method_header']+[p[i] for i in range(1,len(p))]

def p_formal_parameter_list_opt(p):
    ''' formal-parameter-list-opt :         formal-parameter-list
             |         empty
             '''
    p[0]=['formal_parameter_list_opt']+[p[i] for i in range(1,len(p))]

def p_member_name(p):
    ''' member-name :         IDENTIFIER
             '''
    p[0]=['member_name']+[p[i] for i in range(1,len(p))]

def p_formal_parameter_list(p):
    ''' formal-parameter-list :         fixed-parameters
             '''
    p[0]=['formal_parameter_list']+[p[i] for i in range(1,len(p))]

def p_fixed_parameters(p):
    ''' fixed-parameters :         fixed-parameter
             |         fixed-parameters COMMA fixed-parameter
             '''
    p[0]=['fixed_parameters']+[p[i] for i in range(1,len(p))]

def p_fixed_parameter(p):
    ''' fixed-parameter :         parameter-modifier-opt type IDENTIFIER
             '''
    p[0]=['fixed_parameter']+[p[i] for i in range(1,len(p))]

def p_parameter_modifier_opt(p):
    ''' parameter-modifier-opt :         parameter-modifier
             |         empty
             '''
    p[0]=['parameter_modifier_opt']+[p[i] for i in range(1,len(p))]

def p_parameter_modifier(p):
    ''' parameter-modifier :         OUT
             '''
    p[0]=['parameter_modifier']+[p[i] for i in range(1,len(p))]

def p_method_body(p):
    ''' method-body :         block
             |         DELIM
             '''
    p[0]=['method_body']+[p[i] for i in range(1,len(p))]

def p_block(p):
    ''' block :         BLOCK_BEGIN statement-list-opt BLOCK_END
             '''
    p[0]=['block']+[p[i] for i in range(1,len(p))]

def p_statement_list_opt(p):
    ''' statement-list-opt :         statement-list
             |         empty
             '''
    p[0]=['statement_list_opt']+[p[i] for i in range(1,len(p))]

def p_statement_list(p):
    ''' statement-list :         statement
             |         statement-list statement
             '''
    p[0]=['statement_list']+[p[i] for i in range(1,len(p))]

def p_statement(p):
    ''' statement :         labeled-statement
             |         declaration-statement
             |         embedded-statement
             '''
    p[0]=['statement']+[p[i] for i in range(1,len(p))]

def p_labeled_statement(p):
    ''' labeled-statement :         IDENTIFIER COLON statement
             '''
    p[0]=['labeled_statement']+[p[i] for i in range(1,len(p))]

def p_declaration_statement(p):
    ''' declaration-statement :         local-variable-declaration DELIM
             |         local-constant-declaration DELIM
             '''
    p[0]=['declaration_statement']+[p[i] for i in range(1,len(p))]

def p_local_variable_declaration(p):
    ''' local-variable-declaration :         type local-variable-declarators
             '''
    p[0]=['local_variable_declaration']+[p[i] for i in range(1,len(p))]

def p_local_variable_declarators(p):
    ''' local-variable-declarators :         local-variable-declarator
             |         local-variable-declarators COMMA local-variable-declarator
             '''
    p[0]=['local_variable_declarators']+[p[i] for i in range(1,len(p))]

def p_local_variable_declarator(p):
    ''' local-variable-declarator :         IDENTIFIER
             |         IDENTIFIER ASSIGN local-variable-initializer
             '''
    p[0]=['local_variable_declarator']+[p[i] for i in range(1,len(p))]

def p_local_variable_initializer(p):
    ''' local-variable-initializer :         expression
             |         array-initializer
             '''
    p[0]=['local_variable_initializer']+[p[i] for i in range(1,len(p))]

def p_local_constant_declaration(p):
    ''' local-constant-declaration :         CONST type constant-declarators
             '''
    p[0]=['local_constant_declaration']+[p[i] for i in range(1,len(p))]

def p_embedded_statement(p):
    ''' embedded-statement :         block
             |         empty-statement
             |         expression-statement
             |         selection-statement
             |         iteration-statement
             |         jump-statement
             '''
    p[0]=['embedded_statement']+[p[i] for i in range(1,len(p))]

def p_empty_statement(p):
    ''' empty-statement :         DELIM
             '''
    p[0]=['empty_statement']+[p[i] for i in range(1,len(p))]

def p_expression_statement(p):
    ''' expression-statement :         statement-expression DELIM
             '''
    p[0]=['expression_statement']+[p[i] for i in range(1,len(p))]

def p_statement_expression(p):
    ''' statement-expression :         invocation-expression
             |         object-creation-expression
             |         assignment
             |         post-increment-expression
             |         post-decrement-expression
             |         pre-increment-expression
             |         pre-decrement-expression
             '''
    p[0]=['statement_expression']+[p[i] for i in range(1,len(p))]

def p_selection_statement(p):
    ''' selection-statement :         if-statement
             |         switch-statement
             '''
    p[0]=['selection_statement']+[p[i] for i in range(1,len(p))]

def p_if_statement(p):
    ''' if-statement :         IF OPEN_PAREN boolean-expression CLOSE_PAREN embedded-statement
             |         IF OPEN_PAREN boolean-expression CLOSE_PAREN embedded-statement ELSE embedded-statement
             '''
    p[0]=['if_statement']+[p[i] for i in range(1,len(p))]

def p_boolean_expression(p):
    ''' boolean-expression :         expression
             '''
    p[0]=['boolean_expression']+[p[i] for i in range(1,len(p))]

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
    ''' iteration-statement :         while-statement
             |         for-statement
             |         foreach-statement
             |         do-statement
             '''
    p[0]=['iteration_statement']+[p[i] for i in range(1,len(p))]

def p_while_statement(p):
    ''' while-statement :         WHILE OPEN_PAREN boolean-expression CLOSE_PAREN embedded-statement
             '''
    p[0]=['while_statement']+[p[i] for i in range(1,len(p))]

def p_do_statement(p):
    ''' do-statement :         DO embedded-statement WHILE OPEN_PAREN boolean-expression CLOSE_PAREN DELIM
             '''
    p[0]=['do_statement']+[p[i] for i in range(1,len(p))]

def p_for_statement(p):
    ''' for-statement :         FOR OPEN_PAREN for-initializer-opt DELIM for-condition-opt DELIM for-iterator-opt CLOSE_PAREN embedded-statement
             '''
    p[0]=['for_statement']+[p[i] for i in range(1,len(p))]

def p_for_initializer_opt(p):
    ''' for-initializer-opt :         for-initializer
             |         empty
             '''
    p[0]=['for_initializer_opt']+[p[i] for i in range(1,len(p))]

def p_for_initializer(p):
    ''' for-initializer :         local-variable-declaration
             |         statement-expression-list
             '''
    p[0]=['for_initializer']+[p[i] for i in range(1,len(p))]

def p_for_condition_opt(p):
    ''' for-condition-opt :         for-condition
             |         empty
             '''
    p[0]=['for_condition_opt']+[p[i] for i in range(1,len(p))]

def p_for_condition(p):
    ''' for-condition :         boolean-expression
             '''
    p[0]=['for_condition']+[p[i] for i in range(1,len(p))]

def p_for_iterator_opt(p):
    ''' for-iterator-opt :         for-iterator
             |         empty
             '''
    p[0]=['for_iterator_opt']+[p[i] for i in range(1,len(p))]

def p_for_iterator(p):
    ''' for-iterator :         statement-expression-list
             '''
    p[0]=['for_iterator']+[p[i] for i in range(1,len(p))]

def p_statement_expression_list(p):
    ''' statement-expression-list :         statement-expression
             |         statement-expression-list COMMA statement-expression
             '''
    p[0]=['statement_expression_list']+[p[i] for i in range(1,len(p))]

def p_foreach_statement(p):
    ''' foreach-statement :         FOREACH OPEN_PAREN type IDENTIFIER IN expression CLOSE_PAREN embedded-statement
             '''
    p[0]=['foreach_statement']+[p[i] for i in range(1,len(p))]

def p_jump_statement(p):
    ''' jump-statement :         break-statement
             |         continue-statement
             |         goto-statement
             |         return-statement
             '''
    p[0]=['jump_statement']+[p[i] for i in range(1,len(p))]

def p_break_statement(p):
    ''' break-statement :         BREAK DELIM
             '''
    p[0]=['break_statement']+[p[i] for i in range(1,len(p))]

def p_continue_statement(p):
    ''' continue-statement :         CONTINUE DELIM
             '''
    p[0]=['continue_statement']+[p[i] for i in range(1,len(p))]

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
    p[0]=['expression_opt']+[p[i] for i in range(1,len(p))]

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
             |     TRUE
             |     FALSE             '''
    p[0]=['literal']+[p[i] for i in range(1,len(p))]




def p_empty(p):
    'empty :'
    pass

def p_error(p):
    if p:
        print "Syntax error at line " + str(p.lineno)
        print 'Token : {}'.format(p)
    else:
        print("Syntax error!")
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
    filename = inputFile.split('.')[0] + '.dot'
    png_filename = inputFile.split('.')[0] + '.png'
    createdot.createFile(parse, filename)
    # from subprocess import call
    # call(["dot ", "-Tpng", filename, "-o", png_filename])
