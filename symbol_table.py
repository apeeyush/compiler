from pprint import pprint

class SymbolTable():
	def __init__(self):
		self.symboltable={
			"main":{
				"classname": "main", 
				"funcname": "main",
				"funclist": {}, # to be empty as of now(there is no funclist for functions)
				"varlist": {}, #This stores list of variables in scope
				"addrtable": {} #This stores relative addresses for the 'place'
				}
			}
		self.tablestack=[self.symboltable["main"]]
		self.offstack=[0]
		self.idnum=-1
		
	def gentmp(self):
		self.idnum+=1;
		return "t"+str(self.idnum)

	def getwidth(self,width,vartype):
		if width==-1:
			if vartype=="int":
				return 4
			elif vartype=="double":
				return 8
			elif vartype=="char":
				return 1
			elif vartype=="bool":
				return 1
			else:
				raise Exception("Type not defined")
		
	def addvar(self,varname='',vartype='',varwidth=-1):
		#Set variable width on type
		varwidth=self.getwidth(varwidth,vartype)
		#Get current table and offset
		symboltable=self.tablestack[len(self.tablestack)-1]
		offset=self.offstack[len(self.offstack)-1]
		place=self.gentmp()
		#Add to symboltable
		#assuming variable being added doesn't exist
		symboltable['varlist'][varname]={"type":vartype,"address":offset,"width":varwidth,"place":place}
		symboltable['addrtable'][place]={'address':offset,'width':varwidth,'type':vartype}
		self.offstack[len(self.offstack)-1]+=varwidth
		return symboltable['varlist'][varname]

	def lookupvar(self,varname):
		currscope=len(self.tablestack)-1
		while currscope!=-1:
			symboltable=self.tablestack[currscope]
			if varname in symboltable['varlist']:
				return symboltable['varlist'][varname]
			else:
				currscope-=1
		return None
	
	def lookupvar_curr(self,varname):
		currscope=len(self.tablestack)-1
		symboltable=self.tablestack[currscope]
		if varname in symboltable['varlist']:
			return symboltable['varlist'][varname]
		else:
			return None
	
	def addbscope(self):
		offset=self.offstack[len(self.offstack)-1]
		symboltable={"varlist":{},"addrtable":{}}
		self.tablestack.append(symboltable)
		self.offstack.append(offset)		
	
	def deletebscope(self):
		symboltable=self.tablestack.pop()
		offset=self.offstack.pop()
		currtable=self.tablestack[len(self.tablestack)-1]
		currtable['addrtable'].update(symboltable['addrtable'])

	def printTable(self):
		pprint(self.symboltable)
