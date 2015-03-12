idnum=0
f1 = open("graph1.gv","wb")
f1.write("digraph G{\n")
def createdotfile(var):
	global idnum
	if not isinstance(var,list):
		f1.write("id"+str(idnum)+"[label=\""+str(var)+"\"];\n")
		idnum=idnum+1
	else:
		ids=[]
		for i in range(len(var)):
			ids.append(idnum)
			createdotfile(var[i])
		for i in range(1,len(ids)):
			f1.write("id"+str(ids[0])+"->id"+str(ids[i])+";\n")

var=['compilation_unit', ['namespace_member_declarations_opt', ['namespace_member_declarations', ['namespace_member_declaration', ['namespace_declaration', 'namespace', 'Program', ['namespace_body', '{', ['namespace_member_declarations_opt', ['namespace_member_declarations', ['namespace_member_declaration', ['type_declaration', ['class_declaration', 'class', 'HelloWorld', ['class_base_opt', None], ['class_body', '{', ['class_member_declarations_opt', ['class_member_declarations', ['class_member_declaration', ['method_declaration', ['method_header', ['modifiers_opt', ['modifiers', ['modifier', 'static']]], ['return_type', 'void'], ['member_name', 'Main'], '(', ['formal_parameter_list_opt', None], ')'], ['method_body', ['block', '{', ['statement_list_opt', ['statement_list', ['statement_list', ['statement', ['embedded_statement', ['expression_statement', ['statement_expression', ['invocation_expression', ['primary_expression', ['primary_no_array_creation_expression', ['member_access', ['primary_expression', ['primary_no_array_creation_expression', 'Console']], '.', 'WriteLine']]], '(', ['argument_list_opt', ['argument_list', ['argument', ['expression', ['conditional_expression', ['conditional_or_expression', ['conditional_and_expression', ['inclusive_or_expression', ['exclusive_or_expression', ['and_expression', ['equality_expression', ['relational_expression', ['shift_expression', ['additive_expression', ['multiplicative_expression', ['unary_expression', ['primary_expression', ['primary_no_array_creation_expression', ['literal', '"Hello World"']]]]]]]]]]]]]]]]]]], ')']], ';']]]], ['statement', ['embedded_statement', ['expression_statement', ['statement_expression', ['invocation_expression', ['primary_expression', ['primary_no_array_creation_expression', ['member_access', ['primary_expression', ['primary_no_array_creation_expression', 'Console']], '.', 'ReadKey']]], '(', ['argument_list_opt', None], ')']], ';']]]]], '}']]]]]], '}'], ['semi_opt', None]]]]]], '}'], ['semi_opt', None]]]]]]
createdotfile(var)
f1.write("}")
f1.close()

