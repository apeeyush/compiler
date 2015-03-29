from pprint import pprint

class SymbolTable():
    def __init__(self):
        self.symboltable={
            "main":{
                "classname": "Main", 
                "funclist": {}, # to be empty as of now(there is no funclist for functions)
                "varlist": {}, #This stores list of variables in scope
                "addrtable": {}, #This stores relative addresses for the 'place'
                "type":"class"
                }
            }
        self.tablestack=[self.symboltable["main"]]
        self.funcstack=["main"]
        self.offstack=[0]
        self.idnum=-1
        self.funclist={}
        self.temptable={}
        
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
    
    def addvar(self,varname,vartype,uppertype='simple',varwidth=-1,className=None,pclassName=None,symtable=None):
        
        
        #Set variable width on type
        varwidth=self.getwidth(vartype,uppertype,int(varwidth))
        #Get current table and offset
        symboltable=self.tablestack[len(self.tablestack)-1]
        offset=self.offstack[len(self.offstack)-1]
        place=self.gentmp()
        #Add to symboltable
        #assuming variable being added doesn't exist
        symboltable['varlist'][varname]={"type":vartype,'uppertype':uppertype,"address":offset,"width":varwidth,"place":place}
        symboltable['addrtable'][place]={'address':offset,'width':varwidth,'type':vartype,'uppertype':uppertype}
        #Add class and parentclass for object
        if uppertype=='class':
            symboltable['varlist'][varname]['className']=className
            symboltable['varlist'][varname]['pclassName']=pclassName
            symboltable['varlist'][varname]['symboltable']=symtable
        self.offstack[len(self.offstack)-1]+=varwidth
        return symboltable['varlist'][varname]

    def lookupvar(self,varname):
        #Check if lies in the current function scope and return None
        currfunc=self.funcstack[-1]
        if currfunc != "main":
            for var in self.funclist[currfunc]['arglist']:
                if var['argname']==varname:
                    return var
        
        currscope=len(self.tablestack)-1
        while currscope!=-1:
            symboltable=self.tablestack[currscope]
            if varname in symboltable['varlist']:
                return symboltable['varlist'][varname]
            else:
                currscope-=1
        return None

    def lookupvar_curr(self,varname):
        #Check if lies in the current function scope and return None
        currfunc=self.funcstack[-1]
        if currfunc != "main":
            for var in self.funclist[currfunc]['arglist']:
                if var['argname']==varname:
                    return var
        

        currscope=len(self.tablestack)-1
        symboltable=self.tablestack[currscope]
        if varname in symboltable['varlist']:
            return symboltable['varlist'][varname]
        else:
            return None

    def addbscope(self,varlist={}):
        currtable=self.tablestack[len(self.tablestack)-1]
        offset=self.offstack[len(self.offstack)-1]
        symboltable={"varlist":varlist,"addrtable":{},"type":'block'}
        self.tablestack.append(symboltable)
        self.offstack.append(offset)        

    def deletebscope(self):
        symboltable=self.tablestack.pop()
        offset=self.offstack.pop()
        currtable=self.tablestack[len(self.tablestack)-1]
        if currtable.has_key('addrtable'):
            currtable['addrtable'].update(symboltable['addrtable'])
        self.temptable=symboltable

    def addfscope(self,varname,arglist,returntype):
        symboltable={'type':'function','funcname':varname,'returntype':returntype,'arglist':arglist,'classname':"Main",'place':"Main"+'_'+varname} #Classname can change
        self.tablestack.append(symboltable)
        self.offstack.append(0)
        self.funcstack.append(varname)
        self.funclist[symboltable['funcname']]=symboltable
        

    def deletefscope(self):
        symboltable=self.tablestack.pop()
        offset=self.offstack.pop()
        symboltable['symboltable']=self.temptable
        symboltable['width']=offset
        self.temptable={}
        self.funclist[symboltable['funcname']]=symboltable
        self.funcstack.pop()

    def getcurrscopetype(self):
        return self.tablestack[-1]['type']

    def getcurrtable(self):
        return self.tablestack[-1]
        
    def printTable(self):
        pprint(self.symboltable)
