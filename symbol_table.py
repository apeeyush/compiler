from pprint import pprint
baseEnv = None

class Env:
	def __init__(self, prev=None, scopeName=None, scopeType=None, returnType=None):
		self.type = scopeType
		self.returnType = None
		self.name = scopeName
		self.varlist = {}
		self.addrtable = {}
		self.children = []
		self.prev_env=prev
		self.idnum=-1
		self.offset = 0

	def gentmp(self):
		self.idnum+=1;
		return "t"+str(self.idnum)

	def getwidth(self,vartype,uppertype='simple',width=-1):
		dic = {"int":4,"double":8,"bool":1,"char":1}
		if uppertype=='simple':
			return dic[vartype]
		elif uppertype=='array':
			return width*dic[vartype]
		elif uppertype == 'class':
			return width

	def addvar(self,varname,vartype,uppertype='simple',varwidth=-1):
		varwidth = self.getwidth(vartype,uppertype,int(varwidth))
		place = self.gentmp()
		offset = self.offset
		self.varlist[varname] = {"type":vartype,'uppertype':uppertype,"address":offset,"width":varwidth,"place":place}
		self.addrtable[place] = {'address':offset,'width':varwidth,'type':vartype,'uppertype':uppertype}
		self.offset += varwidth
		return self.varlist[varname]

	def lookupvar(self, varname):
		curr_env = self
		while curr_env != None:
			if varname in curr_env.varlist:
				return curr_env.varlist[varname]
			curr_env = curr_env.prev_env
		return None

	def lookupvar_curr(self, varname):
		curr_env = self
		if varname in curr_env.varlist:
			return curr_env.varlist[varname]
		return None

	def printTable(self):
		print self.varlist
		for child in self.children:
			child.printTable()

class SymbolTable:
	def __init__(self):
		self.curr_env = Env(None)
		global baseEnv
		baseEnv = self.curr_env

	def addvar(self,varname,vartype,uppertype='simple',varwidth=-1):
		return self.curr_env.addvar(varname,vartype,uppertype='simple',varwidth=-1)

	def lookupvar(self,varname):
		return self.curr_env.lookupvar(varname)

	def lookupvar_curr(self, varname):
		return self.curr_env.lookupvar_curr(varname)

	def gentmp(self):
		return self.curr_env.gentmp()

	def begin_scope(self, scopeName='undefined', scopeType='block', returnType=None):
		newEnv = Env(self.curr_env, scopeName, scopeType, returnType)
		self.curr_env.children.append(newEnv)
		self.curr_env = newEnv
		return self.curr_env

	def getScopeName(self):
		return self.curr_env.name

	def end_scope(self):
		self.curr_env = self.curr_env.prev_env
		return self.curr_env

	def printTable(self):
		print baseEnv.printTable()

if __name__ == '__main__':
	main_env = SymbolTable()
	print main_env.gentmp()
	print main_env.gentmp()
	print main_env.addvar('var1','int',uppertype='simple',varwidth=-1)
	print main_env.lookupvar('var1')
	print main_env.addbscope()
	print main_env.getScopeName()
