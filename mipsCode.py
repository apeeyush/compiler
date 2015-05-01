# Helper class for MIPS code generator (codeGen.py)
# Manages registers, loads and stores values from memory; Also manages the array containig code
class mipsCode:
    def __init__(self, ST):
        self.code = []
        self.regInfo = {}
        self.freeRegs = ['$t0','$t1','$t2','$t3','$t4','$t5','$t6','$t7','$s0','$s1','$s2','$s3','$s4','$s5','$s6','$s7']
        self.usedRegs = []
        self.ST = ST

    # Appends the line to code
    def addLine(self, line):
        self.code.append(line)

    # Gets a free register
    def getFreeReg(self):
        if len(self.freeRegs)>0:                                # Free registers are available
            reg = self.freeRegs.pop(0)
        elif len(self.freeRegs) == 0:                           # No free registers are available
            reg = self.usedRegs.pop(0)
        # Book-keeping
        self.usedRegs.append(reg)
        self.regInfo[reg] = -1
        return reg

    # Gets a register, also loads the value from memory to register
    def getReg(self, var):
        if var in self.regInfo.values():                        # Variable already in register
            reg = self.ST.baseEnv.addrtable[var]['register']
        else:
            if len(self.freeRegs)>0:                            # Free registers are available
                reg = self.freeRegs.pop(0)
            elif len(self.freeRegs) == 0:                       # No free registers are available
                reg = self.usedRegs.pop(0)
            # Book-keeping
            self.ST.baseEnv.addrtable[var]['register'] = reg
            self.usedRegs.append(reg)
            self.regInfo[reg] = var

        # Load memory location in register
        stackLocation = self.ST.baseEnv.addrtable[var]['address']
        self.addLine('lw '+reg+', '+str(stackLocation)+'($sp)')

        return reg

    # Frees all used registers; Does not flush values to memory
    def flushAll(self):
        for reg in self.usedRegs:
            self.regInfo[reg] = None
            self.freeRegs.append(reg)
        self.usedRegs = []

    # Flushes variable value form register to memory and frees it's register
    def flushVar(self, var):
        reg = self.ST.baseEnv.addrtable[var]['register']
        memory_loc = self.ST.baseEnv.addrtable[var]['address']
        self.addLine('sw '+reg+', '+str(memory_loc)+'($sp)')
        self.ST.baseEnv.addrtable[var]['register'] = None
        # Free the register allocated - Book-keeping
        self.regInfo[reg] = None
        self.freeRegs.append(reg)
        self.usedRegs.remove(reg)
        return

    # Prints code
    def printCode(self):
        for line in self.code:
            print line
