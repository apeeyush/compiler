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
    print ST.baseEnv.addrtable
    print '\n'

    for i in range(len(TAC.code)):
        irline = TAC.code[i]
        code.addLine('L_'+str(i)+':')
        if irline[3] == 'exit':
            code.addLine('li $v0, 10')
            code.addLine('syscall')
        if irline[3] == '=dec':
            reg = code.getReg(irline[0])
            code.addLine('li '+reg+','+str(irline[1]))
            code.flushVar(irline[0])
        if irline[3] == '=':
            print irline[1]
            reg1 = code.getReg(irline[0])
            reg2 = code.getReg(irline[1])
            code.addLine('move ' + reg1 + ', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == 'cond_goto':
            reg1 = code.getReg(irline[0])
            if irline[1] == 0:
                code.addLine('beqz '+reg1+', L_'+str(irline[2]))
            elif irline[1] == 1:
                code.addLine('bnez '+reg1+', L_'+str(irline[2]))
            else:
                reg2 = code.getReg(irline[1])
                code.addLine('beq '+reg1+', '+reg2+', L_'+str(irline[2]))
        if irline[3] == 'goto':
            code.addLine('b L_'+str(irline[2]))
        if irline[3] == '|':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[2])
            reg3 = code.getReg(irline[0])
            code.addLine('or '+reg3+', '+reg1+', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '^':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[2])
            reg3 = code.getReg(irline[0])
            code.addLine('xor '+reg3+', '+reg1+', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '&':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[2])
            reg3 = code.getReg(irline[0])
            code.addLine('and '+reg3+', '+reg1+', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '==':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[2])
            reg3 = code.getReg(irline[0])
            code.addLine('seq '+reg3+', '+reg1+', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '!=':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[2])
            reg3 = code.getReg(irline[0])
            code.addLine('sne '+reg3+', '+reg1+', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '<':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[2])
            reg3 = code.getReg(irline[0])
            code.addLine('slt '+reg3+', '+reg1+', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '>':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[2])
            reg3 = code.getReg(irline[0])
            code.addLine('sgt '+reg3+', '+reg1+', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '<=':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[2])
            reg3 = code.getReg(irline[0])
            code.addLine('sle '+reg3+', '+reg1+', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '>=':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[2])
            reg3 = code.getReg(irline[0])
            code.addLine('sge '+reg3+', '+reg1+', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '<<':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[2])
            reg3 = code.getReg(irline[0])
            code.addLine('sllv '+reg3+', '+reg1+', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '>>':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[2])
            reg3 = code.getReg(irline[0])
            code.addLine('srlv '+reg3+', '+reg1+', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '+':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[2])
            reg3 = code.getReg(irline[0])
            code.addLine('add '+reg3+', '+reg1+', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '-':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[2])
            reg3 = code.getReg(irline[0])
            code.addLine('sub '+reg3+', '+reg1+', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '*':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[2])
            reg3 = code.getReg(irline[0])
            code.addLine('mult '+reg1+', '+reg2)
            code.addLine('mflo '+reg3)
            code.flushVar(irline[0])
        if irline[3] == '/':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[2])
            reg3 = code.getReg(irline[0])
            code.addLine('div '+reg1+', '+reg2)
            code.addLine('mflo '+reg3)
            code.flushVar(irline[0])
        if irline[3] == '%':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[2])
            reg3 = code.getReg(irline[0])
            code.addLine('div '+reg1+', '+reg2)
            code.addLine('mfhi '+reg3)
            code.flushVar(irline[0])
        if irline[3] == '~':
            reg1 = code.getFreeReg()
            reg2 = code.getReg(irline[1])
            reg3 = code.getReg(irline[0])
            code.addLine('li '+reg1+', -1')
            code.addLine('xor '+reg3+', '+ reg2+', '+reg1)
            code.flushVar(irline[0])
        if irline[3] == '-unary':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[0])
            code.addLine('neg '+reg2+', '+reg1)
            code.flushVar(irline[0])
        if irline[3] == '!':
            reg1 = code.getFreeReg()
            reg2 = code.getReg(irline[1])
            reg3 = code.getReg(irline[0])
            code.addLine('li '+reg1+', 1')
            code.addLine('xor '+reg3+', '+ reg2+', '+reg1)
            code.flushVar(irline[0])
        if irline[3] == '+=':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[0])
            code.addLine('add '+reg2+', '+reg2+', '+reg1)
            code.flushVar(irline[0])
        if irline[3] == '-=':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[0])
            code.addLine('sub '+reg2+', '+reg2+', '+reg1)
            code.flushVar(irline[0])
        if irline[3] == '*=':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[0])
            code.addLine('mult '+reg2+', '+reg1)
            code.addLine('mflo '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '/=':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[0])
            code.addLine('div '+reg2+', '+reg1)
            code.addLine('mflo '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '%=':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[0])
            code.addLine('div '+reg2+', '+reg1)
            code.addLine('mfhi '+reg2)
        if irline[3] == '^=':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[0])
            code.addLine('xor '+reg2+', '+reg1+', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '|=':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[0])
            code.addLine('or '+reg2+', '+reg1+', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '&=':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[0])
            code.addLine('and '+reg2+', '+reg1+', '+reg2)
            code.flushVar(irline[0])
        if irline[3] == '<<=':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[0])
            code.addLine('sllv '+reg2+', '+reg2+', '+reg1)
            code.flushVar(irline[0])
        if irline[3] == '>>=':
            reg1 = code.getReg(irline[1])
            reg2 = code.getReg(irline[0])
            code.addLine('srlv '+reg2+', '+reg2+', '+reg1)
            code.flushVar(irline[0])
        if irline[3] == 'PrintInt':
            reg1 = code.getReg(irline[2])
            code.addLine('move $a0, '+ reg1)
            code.addLine('li $v0, 1')
            code.addLine('syscall')
        if irline[3] == 'PrintChar':
            reg1 = code.getReg(irline[2])
            code.addLine('move $a0, '+ reg1)
            code.addLine('li $v0, 11')
            code.addLine('syscall')
        if irline[3] == 'PrintString':
            code.addLine('la $a0, '+ irline[2])
            code.addLine('li $v0, 4')
            code.addLine('syscall')
        if irline[3] == 'Label':
            code.addLine(irline[2]+':')
        if irline[3] == 'storereturn':
            code.addLine('sw $ra, 0($sp)')
        if irline[3] == 'jumpback':
            code.addLine('lw $ra, 0($sp)')
            code.addLine('jr $ra')
        if irline[3] == 'setreturn':
            reg1 = code.getReg(irline[2])
            code.addLine('move $v0, '+reg1)
        if irline[3] == 'getreturn':
            reg1 = code.getReg(irline[2])
            code.addLine('move '+reg1+', $v0')
            code.flushVar(irline[2])
        if irline[3] == 'param':
            width = ST.getClassFunWidth(irline[2])
            if irline[0] == '@self':
                offset = -width+4
                reg1 = code.getFreeReg()
                code.addLine('lw '+reg1+', 4($sp)')
                code.addLine('sw '+reg1+ str(offset)+'($sp)')
            elif irline[0] == '@object':
                pass
            else:
                reg = code.getReg(irline[0])
                offset = -width+8+irline[1]
                code.addLine('sw '+reg+', '+str(offset)+'($sp)')
        if irline[3] == 'jumplabel':
            width = ST.getClassFunWidth(irline[2])
            code.addLine('sub $sp, $sp, '+str(width))
            code.addLine('jal '+irline[2])
            code.addLine('add $sp, $sp, '+str(width))
        # TODO : Complete this list
    code.printCode()
    return code

if __name__ == '__main__':
    inputFile = argv[1]
    code = genCode(inputFile)

    filename = inputFile.split('.')[0] + '.asm'
    with open(filename, 'w') as f:
        f.write('.data\n')
        for key, value in code.ST.stringInit.iteritems():
            f.write(key+':\t.asciiz\t')
            f.write(value)
            f.write('\n')
        f.write('\n')
        f.write('.text\n')
        f.write('main:\n')
        for line in code.code:
            f.write(line+'\n')
