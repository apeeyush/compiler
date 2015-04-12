import sys
import ply.lex as lex
import ply.yacc as yacc
import lexer
from sys import argv
from symbol_table import *
from threeAddressCode import *
import parser
import mipsCode

def genCode(inputFile):
    ST, TAC = parser.getIR(inputFile)
    code = mipsCode.mipsCode(ST)
    print 'Three Address Code..'
    TAC.printCode()
    print '\n'

    for irline in TAC.code:
        if irline[3] == 'exit':
            code.addLine('li $v0, 10')
            code.addLine('syscall')
        if irline[3] == '=dec':
            reg = code.getReg(irline[0])
            code.addLine('li '+reg+','+str(irline[1]))
            code.flushVar(irline[0])
        # Complete list

    code.printCode()

if __name__ == '__main__':
    inputFile = argv[1]
    genCode(inputFile)
