from pprint import pprint
baseEnv = None
idnum=-1
tempnum=-1
        
def genid():
    global idnum
    idnum+=1
    return "i"+str(idnum)

def generatetmp():
    global tempnum
    tempnum+=1
    return "t"+str(tempnum)

class Env:
    def __init__(self, prev=None, scopeName=None, scopeType=None, returnType=None, Class=None, parentClass=None):
        self.type = scopeType
        self.returnType = returnType
        self.argtypelist = None
        self.name = scopeName
        self.Class=Class
        self.parentClass = parentClass
        self.varlist = {}
        self.funclist={}
        self.addrtable = {}
        self.children = []
        self.prev_env=prev
        self.offset = 0
        self.width=0
        self.maxwidth=0

    def lookupFuncType(self):
        curr_env = self
        while curr_env != None:
            if curr_env.type == 'methodType':
                return curr_env.returnType
            curr_env = curr_env.prev_env
        return None

    def gentmp(self,vartype,uppertype='simple',varwidth=-1):
        varwidth = self.getwidth(vartype,uppertype,int(varwidth))
        place = generatetmp()
        offset = self.offset
        self.addrtable[place] = {'address':offset,'width':varwidth,'type':vartype,'uppertype':uppertype}
        self.offset += varwidth
        self.width+=varwidth
        return place

        # self.tempnum+=1
        # #self.tempnum%=2
        # return "t"+str(self.tempnum)

    def getwidth(self,vartype,uppertype='simple',width=-1):
        dic = {"int":4,"double":8,"bool":1,"char":1, "void":0}
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
        while curr_env != None and curr_env.type!= "classType":
            if varname in curr_env.varlist:
                return curr_env.varlist[varname]
            curr_env = curr_env.prev_env
        return None

    def lookupvar_Class(self,varname):
        curr_env = self
        while curr_env != None and curr_env.type!= "classType":
            curr_env = curr_env.prev_env
        if curr_env:
            if varname in curr_env.varlist:
                return curr_env.varlist[varname]
        return None

    def isvarinClass(self,varname,Classname):
        Class=self.searchClass(Classname)
        if varname in Class.varlist:
            return Class.varlist[varname]
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
        if func_env:
            return func_env
        else:
            if start_env.parentClass:
                parent_class = self.searchClass(start_env.parentClass)
                func_env=None
                for child in parent_class.children:
                    if child.type == 'methodType' and child.name == funcName:
                        func_env = child
                return func_env
            else:
                return None

    def searchFuncinClass(self,funcName,className):
        func_class=self.searchClass(className)
        func_env=None
        for child in func_class.children:
            if child.type == 'methodType' and child.name == funcName:
                func_env = child
        if not func_env:
            if func_class.parentClass:
                parent_class = self.searchClass(func_class.parentClass)
                for child in parent_class.children:
                    if child.type == 'methodType' and child.name == funcName:
                        func_env = child
        return func_env
            
    def searchClass(self,className):
        start_env=baseEnv
        for child in start_env.children:
            if child.type == 'classType' and child.name == className:
                return child
        return None

    def printTable(self):
        print self.name
        print self.varlist
        print self.addrtable
        print self.width
        print self.parentClass
        for child in self.children:
            child.printTable()

class SymbolTable:
    def __init__(self):
        self.curr_env = Env(None)
        global baseEnv
        baseEnv = self.curr_env

    def mainClass(self):
        searchedNode = None
        for node in baseEnv.children:
            if node.type == 'classType': 
                for child in node.children:
                    if child.type == 'methodType' and child.name == 'Main':
                        searchedNode = node
        return searchedNode

    def addvar(self,varname,vartype,uppertype='simple',varwidth=-1):
        return self.curr_env.addvar(varname,vartype,uppertype,varwidth)

    def lookupFuncType(self):
        return self.curr_env.lookupFuncType()

    def lookupvar(self,varname):
        return self.curr_env.lookupvar(varname)

    def lookupvar_Class(self,varname):
        return self.curr_env.lookupvar_Class(varname)
    
    def lookupvar_curr(self, varname):
        return self.curr_env.lookupvar_curr(varname)

    def gentmp(self,vartype):
        return self.curr_env.gentmp(vartype)

    def begin_scope(self, scopeName='undefined', scopeType='block',returnType=None,Class=None,parentClass = None):
        offset=self.curr_env.offset
        newEnv = Env(self.curr_env, scopeName, scopeType, returnType,Class,parentClass)
        if newEnv.type=='block':
            newEnv.offset=offset
        self.curr_env.children.append(newEnv)
        self.curr_env = newEnv
        return self.curr_env

    def getScopeName(self):
        return self.curr_env.name

    def getPrevScopeName(self):
        if self.curr_env.prev_env:
            return self.curr_env.prev_env.name
        else:
            return None

    def searchFunc(self, funcName):
        return self.curr_env.searchFunc(funcName)

    def searchFuncinClass(self,funcName,className):
        return self.curr_env.searchFuncinClass(funcName,className)

    def searchClass(self,className):
        return self.curr_env.searchClass(className)

    def isvarinClass(self,varname,className):
        return self.curr_env.isvarinClass(varname,className)

    def getCurrEnv(self):
        return self.curr_env

    def end_scope(self):
        if self.curr_env.type=="classType":
            addrtable=self.curr_env.addrtable
            self.curr_env = self.curr_env.prev_env
            self.curr_env.addrtable.update(addrtable)
        else:
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
