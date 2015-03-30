from pprint import pprint
baseEnv = None
idnum=-1

def genid():
    global idnum
    idnum+=1
    return "i"+str(idnum)

class Env:
    def __init__(self, prev=None, scopeName=None, scopeType=None, returnType=None):
        self.type = scopeType
        self.returnType = returnType
        self.argtypelist = None
        self.name = scopeName
        self.varlist = {}
        self.addrtable = {}
        self.children = []
        self.prev_env=prev
        self.tempnum=-1
        self.offset = 0
        self.width=0
        self.maxwidth=0
    
    def gentmp(self):
        self.tempnum+=1
        #self.tempnum%=2
        return "t"+str(self.tempnum)

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
        place = genid()
        offset = self.offset
        self.varlist[varname] = {"type":vartype,'uppertype':uppertype,"address":offset,"width":varwidth,"place":place}
        self.addrtable[place] = {'address':offset,'width':varwidth,'type':vartype,'uppertype':uppertype}
        self.offset += varwidth
        self.width+=varwidth
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

    def addargtypelist(self, argtypelist):
    	self.argtypelist = argtypelist
    	return self.argtypelist

    def getStartEnv(self):
    	env = self
    	while env.prev_env != None and env.type != 'classType':
    		env = env.prev_env
    	return env

    def searchFunc(self, funcName):
		start_env = self.getStartEnv()
		func_env = None
		for child in start_env.children:
			if child.type == 'methodType' and child.name == funcName:
				func_env = child
		return func_env

    def printTable(self):
        print self.name
        print self.varlist
        print self.addrtable
        print self.width
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
        offset=self.curr_env.offset
        newEnv = Env(self.curr_env, scopeName, scopeType, returnType)
        if newEnv.type=='block':
            newEnv.offset=offset
        self.curr_env.children.append(newEnv)
        self.curr_env = newEnv
        return self.curr_env

    def getScopeName(self):
        return self.curr_env.name

    def searchFunc(self, funcName):
    	return self.curr_env.searchFunc(funcName)

    def getCurrEnv(self):
    	return self.curr_env

    def end_scope(self):
        currwidth=self.curr_env.width=max(self.curr_env.maxwidth,self.curr_env.width)
        addrtable=self.curr_env.addrtable
        self.curr_env = self.curr_env.prev_env
        self.curr_env.maxwidth=max(self.curr_env.maxwidth,self.curr_env.width+currwidth)
        self.curr_env.addrtable.update(addrtable)
        return self.curr_env

    def addargtypelist(self, argtypelist):
    	return self.curr_env.addargtypelist(argtypelist)

    def printTable(self):
        print baseEnv.printTable()

if __name__ == '__main__':
    main_env = SymbolTable()
    print main_env.gentmp()
    print main_env.gentmp()
    print main_env.addvar('var1','int',uppertype='simple',varwidth=-1)
    print main_env.lookupvar('var1')
    print main_env.addargtypelist(['int','float'])
    print main_env.getScopeName()
    main_env.begin_scope('asdf','methodType')
    print main_env.searchFunc('asdf')
