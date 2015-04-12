import sys
import ply.lex as lex
import ply.yacc as yacc
import lexer
from sys import argv
from symbol_table import *
from threeAddressCode import *
import parser

def genCode(inputFile):
	ST, TAC = parser.getIR(inputFile)
	print 'Three Address Code..'
	TAC.printCode()
	print '\n'



if __name__ == '__main__':
    inputFile = argv[1]
    genCode(inputFile)
