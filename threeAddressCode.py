# Three Address Code helper class for Parser
class ThreeAddressCode:
    def __init__(self):
        self.code = []
        self.quad = -1

    def getcurrentquad(self):
        return self.quad

    def getNextQuad(self):
        return self.quad+1

    def emit(self, regDest, regSrc1, regSrc2, op):
        self.quad = self.quad+1
        self.code.append([regDest, regSrc1, regSrc2, op])

    def printCode(self, fileName=''):
        for i in range(len(self.code)):
            print i, self.code[i]

    def backpatch(self, locationList, location):
        for position in locationList:
            self.code[position][2] = location
