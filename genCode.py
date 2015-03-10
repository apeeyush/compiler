import sys
f=open(sys.argv[1])

rule=[]

code=''

def addCode():
	global code
	if len(rule)==0:
		return
	rule[0]=rule[0][:-2]
	name=rule[0].replace('-','_')
	code+="def p_"+name+'(p):'
	code+="\n\t\'\'\' "+rule[0]+" : "+rule[1]
	for i in range(2,len(rule)):
		code+="\t\t\t | "+rule[i]
	code+="\t\t\t \'\'\'"
	code+="\n"

for l in f:
	if l[0]=='\t' or l[0]==' ':
		rule.append(l)
	else:
		addCode()
		rule=[l]
addCode()

print code
