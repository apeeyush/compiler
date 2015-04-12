class mipsCode:
    def __init__(self, ST):
        self.code = []
        self.regInfo = {}
        self.freeRegs = ['$t0','$t1','$t2','$t3','$t4','$t5','$t6','$t7','$s0','$s1','$s2','$s3','$s4','$s5','$s6','$s7']
        self.usedRegs = []
        self.ST = ST

    def addLine(self, line):
        self.code.append(line)

    def getReg(self, var):
        # Check if variable is already in a register (Don't need to load from memory in this case)
        if var in self.regInfo.values():
            return self.ST.baseEnv.addrtable[var]['register']
        if len(self.freeRegs)>0:                    # Free registers are available
            # Load from location
            reg = self.freeRegs.pop()

            # TODO : Load memory location in register
            stackLocation = self.ST.baseEnv.addrtable[var]['address']
        elif len(freeRegs) == 0:                    # No free registers are available
            reg = self.usedRegs.pop()
            # Flush the old register
            prev_var = self.regInfo[reg]
            self.ST.baseEnv.addrtable[prev_var]['register'] = None
            # TODO : Store the registor's value back to memory

            # TODO : Load memory location in register
            stackLocation = self.ST.baseEnv.addrtable[var]['address']

        # Book-keeping
        self.ST.baseEnv.addrtable[var]['register'] = reg
        self.usedRegs.append(reg)
        self.regInfo[reg] = var

        return reg

    def flushVar(self, var):
        reg = self.ST.baseEnv.addrtable[var]['register']

        # Flust value in memory

        # Free the register allocated - Book-keeping
        self.regInfo[reg] = None
        self.freeRegs.append(reg)
        self.usedRegs.remove(reg)

    # Function to print code
    def printCode(self):
        for line in self.code:
            print line
