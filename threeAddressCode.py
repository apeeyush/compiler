class ThreeAddressCode:
    def __init__(self):
        self.code = []
        self.quad = -1
        self.nextQuad = 0

    def incrementQuad(self):
        self.quad = self.nextQuad
        self.nextQuad = self.nextQuad + 1
        return self.quad

    def getNextQuad(self):
        return self.nextQuad

    def getCodeLength(self, functionName):
        return self.quad

    def emit(self, regDest, regSrc1, regSrc2, op):
        self.incrementQuad()
        self.code.append([regDest, regSrc1, regSrc2, op])

    def printCode(self, fileName=''):
        #print self.code
        for i in range(len(self.code)):
            print i,self.code[i]

    def merge(self, list1, list2):
        list3 = list(list1)
        list3.extend(list2)
        return list3

    def backPatch(self, locationList, location):
        for position in locationList:
            self.code[position][2] = location

    def noop(self, locationList):
        for position in locationList:
            self.code[position][3] = 'NOOP'

    def prune(self):
        for item in self.code:
            for i in range(len(self.code[item])):
                if self.code[item][i][3] == 'GOTO' and self.code[item][i][2] == -1:
                    print self.code[item][i]
