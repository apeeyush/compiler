class mipsCode:
    def __init__(self, ST):
        self.code = []
        self.regInfo = {}
        self.freeRegs = ['$t0','$t1','$t2','$t3','$t4','$t5','$t6','$t7','$s0','$s1','$s2','$s3','$s4','$s5','$s6','$s7']
        self.usedRegs = []
        self.ST = ST

    def addLine(self, line):
        self.code.append(line)

    def getFreeReg(self):
        if len(self.freeRegs)>0:                    # Free registers are available
            reg = self.freeRegs.pop()
        elif len(self.freeRegs) == 0:                    # No free registers are available
            reg = self.usedRegs.pop(0)
            # Flush the old register
            prev_var = self.regInfo[reg]
            if prev_var != -1:
                self.ST.baseEnv.addrtable[prev_var]['register'] = None
                prev_memory_loc = self.ST.baseEnv.addrtable[prev_var]['address']
                self.addLine('sw '+reg+', '+str(prev_memory_loc)+'($sp)')
        # Book-keeping
        self.usedRegs.append(reg)
        self.regInfo[reg] = -1

        return reg

    def getReg(self, var):
        # Check if variable is already in a register (Don't need to load from memory in this case)
        if var in self.regInfo.values():
            # Load memory location in register
            reg = self.ST.baseEnv.addrtable[var]['register']
            stackLocation = self.ST.baseEnv.addrtable[var]['address']
            self.addLine('lw '+reg+', '+str(stackLocation)+'($sp)')
            return self.ST.baseEnv.addrtable[var]['register']
        if len(self.freeRegs)>0:                    # Free registers are available
            reg = self.freeRegs.pop()
            # Load memory location in register
            stackLocation = self.ST.baseEnv.addrtable[var]['address']
            self.addLine('lw '+reg+', '+str(stackLocation)+'($sp)')

        elif len(self.freeRegs) == 0:                    # No free registers are available
            reg = self.usedRegs.pop(0)
            # Flush the old register
            prev_var = self.regInfo[reg]
            if prev_var != -1:
                self.ST.baseEnv.addrtable[prev_var]['register'] = None
                prev_memory_loc = self.ST.baseEnv.addrtable[prev_var]['address']
                self.addLine('sw '+reg+', '+str(prev_memory_loc)+'($sp)')

            # Load memory location in register
            stackLocation = self.ST.baseEnv.addrtable[var]['address']
            self.addLine('lw '+reg+', '+str(stackLocation)+'($sp)')

        # Book-keeping
        self.ST.baseEnv.addrtable[var]['register'] = reg
        self.usedRegs.append(reg)
        self.regInfo[reg] = var

        return reg

    def flushVar(self, var):
        reg = self.ST.baseEnv.addrtable[var]['register']
        memory_loc = self.ST.baseEnv.addrtable[var]['address']

        self.addLine('sw '+reg+', '+str(memory_loc)+'($sp)')

        self.ST.baseEnv.addrtable[var]['register'] = None

        # Free the register allocated - Book-keeping
        self.regInfo[reg] = None
        self.freeRegs.append(reg)
        self.usedRegs.remove(reg)

    # Function to print code
    def printCode(self):
        for line in self.code:
            print line
