# Used to reformat the code generated for parser using grammar.
# Example usage
# 	python genCode.py gram.txt > out
# 	python reformat.py out
import sys
import fileinput

fileToSearch=sys.argv[1]

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

for reserved_keyword in reserved_keywords:
	for line in fileinput.input(fileToSearch, inplace=True):
			print line.replace("\""+reserved_keyword.lower()+"\"", reserved_keyword),

list_1 = ['+','-','*','/','%','&','|','^','!','~']
list_1_transform = ['PLUS', 'MINUS', 'TIMES', 'DIV', 'MOD','BITAND', 'BITOR', 'BITXOR', 'BITNOT', 'BITCOMP']

list_2 = ['?','??']
list_2_transform = ['CONDOP','COALESCE']

list_3 = ['&&','||','<<','>>','<','<=','>','>=','==','!=']
list_3_transform = ['LOGAND', 'LOGOR', 'LSHIFT', 'RSHIFT','LT', 'LE', 'GT', 'GE', 'EQ', 'NE']

list_4 = ['=','+=','-=','*=','/=','%=','&=','<<=','>>=','^=','|=']
list_4_transform = ['ASSIGN', 'PLUSEQUAL', 'MINUSEQUAL', 'TIMESEQUAL', 'DIVEQUAL', 'MODEQUAL',
    'BITANDEQUAL', 'LSHIFTEQUAL', 'RSHIFTEQUAL', 'BITXOREQUAL', 'BITOREQUAL']

list_5 = ['++','--']
list_5_transform = ['INCRE', 'DECRE']

list_6 = ['->','=>']
list_6_transform = ['ARROW','LAMBDA_ARROW']

list_7 = ['{','}','[',']','(',')','.',',',':',';']
list_7_transform = ['BLOCK_BEGIN', 'BLOCK_END',
    'OPEN_BRACKET', 'CLOSE_BRACKET',
    'OPEN_PAREN', 'CLOSE_PAREN',
    'DOT', 'COMMA', 'COLON', 'DELIM']

for index in range(len(list_1)):
	for line in fileinput.input(fileToSearch, inplace=True):
			print line.replace("\""+list_1[index]+"\"", list_1_transform[index]),

for index in range(len(list_2)):
	for line in fileinput.input(fileToSearch, inplace=True):
			print line.replace("\""+list_2[index]+"\"", list_2_transform[index]),

for index in range(len(list_3)):
	for line in fileinput.input(fileToSearch, inplace=True):
			print line.replace("\""+list_3[index]+"\"", list_3_transform[index]),

for index in range(len(list_4)):
	for line in fileinput.input(fileToSearch, inplace=True):
			print line.replace("\""+list_4[index]+"\"", list_4_transform[index]),

for index in range(len(list_5)):
	for line in fileinput.input(fileToSearch, inplace=True):
			print line.replace("\""+list_5[index]+"\"", list_5_transform[index]),

for index in range(len(list_6)):
	for line in fileinput.input(fileToSearch, inplace=True):
			print line.replace("\""+list_6[index]+"\"", list_6_transform[index]),

for index in range(len(list_7)):
	for line in fileinput.input(fileToSearch, inplace=True):
			print line.replace("\""+list_7[index]+"\"", list_7_transform[index]),

for line in fileinput.input(fileToSearch, inplace=True):
		print line.replace("identifier", "IDENTIFIER"),
