from pprint import pprint

class SymbolTable():
	def __init__(self):
		self.symboltable={
			"main":{
				"__parent__":"main",
				"__scopename__":"main"
				}
			}
		self.tablestack=[self.symboltable["main"]]
		self.offstack=[0]
		self.idnum=-1

	def gentmp(self):
		self.idnum+=1;
		return "t"+str(self.idnum)

	def addvar(self,varname='',vartype='',varwidth=-1):
		#Set variable width on type
		if varwidth==-1:
			if vartype=="int":
				varwidth=4
			elif vartype=="double":
				varwidth=8
			elif vartype=="char":
				varwidth=1
			elif vartype=="bool":
				varwidth=1
			else:
				raise Exception("Type not defined")
		#Add to symboltable
		symboltable=self.tablestack[0]
		offset=self.offstack[0]
		#assuming variable being added doesn't exist
		symboltable["_data_"+varname]={"type":vartype,"address":offset,"width":varwidth,"place":self.gentmp()}
		self.offstack[0]+=varwidth
		return symboltable["_data_"+varname]

	def lookupvar(self,name):
		symboltable=self.tablestack[0]
		varname="_data_"+name
		if varname in symboltable:
			return symboltable[varname]
		else:
			return None

	def printTable(self):
		pprint(self.symboltable)
