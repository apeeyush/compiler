# Used to generate python parser code from grammar (gram.txt)
# Example usage : python genCode.py gram.txt
import sys

def addCode(rule):
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
	code+="\n\tp[0]=[" + "\'"+name+"\'" + "]" + "+" + "[p[i] for i in range(1,len(p))]\n\n"
	return

if __name__ == '__main__':
	rule=[]
	code=''
	f=open(sys.argv[1])
	for line in f:
		if line[0]=='\t' or line[0]==' ':
			rule.append(line)
		else:
			addCode(rule)
			rule=[line]
	addCode(rule)
	print code
