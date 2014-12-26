from z3 import *

ALU_ADD       = 0
ALU_SUB       = 1
ALU_AND       = 2
ALU_OR        = 3
ALU_NOT       = 4
ALU_MOVE      = 5
ALU_MOVE_IMML = 6
ALU_MOVE_IMMH = 7
ALU_SHL       = 8
ALU_SHR       = 9
ALU_NOP       = 10
ALU_OP_MAX    = 10

OPNAMES = [ "add", "sub", "and", "or", "not", "mov", "ldil", "ldih", "shl", "shr" ]

def disassemble(opcode, regs_in, regs_out):
    op = opcode & 0xF
    if op < ALU_NOP:
        opname = OPNAMES[op]
        if op == ALU_MOVE_IMML or op == ALU_MOVE_IMMH:
            imm = (opcode >> 4) & 0xF
            s = '%-5s r0, #%x' % (opname, imm)
            s += '; new_r0=%x/%d; old_r0=%x/%d' % (regs_out[0], regs_out[0], regs_in[0], regs_in[0]) 
        else:
            r0 = (opcode >> 4) & 0x3
            r1 = (opcode >> 6) & 0x3
            s = '%-5s r%d, r%d' % (opname, r0, r1)
            rz, rx, ry = regs_out[r0], regs_in[r0], regs_in[r1]
            s += '; %x/%d = %s(%x/%d, %x/%d)' % (rz, rz, opname, rx, rx, ry, ry)
        return s
    else:
        assert regs_in == regs_out
        return '%-5s' % 'nop'


def alu_eval(opcode, regs):
    op = opcode & 0xF
    reg1index = (opcode >> 4) & 0x3
    reg2index = (opcode >> 6) & 0x3

    reg1val = regs[reg1index]
    reg2val = regs[reg2index]
    immval = (opcode >> 4) & 0xF

    # print op, reg1val, reg2val, immval
    # regs_in = regs[:]

    if op == ALU_ADD:
        dest = reg1val + reg2val
    elif op == ALU_SUB:
        dest = reg1val - reg2val
    elif op == ALU_AND:
        dest = reg1val & reg2val
    elif op == ALU_OR:
        dest = reg1val | reg2val
    elif op == ALU_NOT:
        dest = (~reg2val)
    elif op == ALU_MOVE:
        dest = reg2val
    elif op == ALU_MOVE_IMML:
        reg1index = 0
        dest = immval
    elif op == ALU_MOVE_IMMH:
        reg1index = 0
        dest = (regs[0] & 0x0F) | (immval << 4)
    elif op == ALU_SHL:
        dest = reg1val << reg2val
    elif op == ALU_SHR:
        dest = reg1val >> reg2val

    if op < ALU_NOP:
        dest = dest & 0xFF
        regs[reg1index] = dest

    # print disassemble(opcode, regs_in, regs)

def construct_op(op, v1, v2):
    assert v1 < 4
    assert op < ALU_OP_MAX

    if op == ALU_MOVE_IMML or op == ALU_MOVE_IMMH:
        assert v1 == 0
        assert v2 < 16
        return op | (v2 << 4)
    else:
        assert v2 <= 4
        return op  | (v1 << 4) | (v2 << 6)


def test_alu():
    ops = [
        construct_op ( ALU_MOVE_IMML , 0 , 1  )  ,  # r0 = 1
        construct_op ( ALU_MOVE      , 1 , 0  )  ,  # r1 = 1
        construct_op ( ALU_MOVE_IMML , 0 , 10 )  ,  # r0 = 10
        construct_op ( ALU_MOVE      , 2 , 0  )  ,  # r2 = 10
        construct_op ( ALU_ADD       , 2 , 1  )  ,  # r2 = 11
        construct_op ( ALU_MOVE      , 3 , 2  )  ,  # r3 = 11
        construct_op ( ALU_SUB       , 3 , 0  )  ,  # r3 = 1
        construct_op ( ALU_SHL       , 2 , 3  )  ,  # r2 = 22
        construct_op ( ALU_OR        , 2 , 0  )  ,  # r2 = 30
        construct_op ( ALU_NOT       , 2 , 2  )  ,  # r2 = 30
        construct_op ( ALU_MOVE_IMML , 0 , 0  )  ,  # r0 = 0
        construct_op ( ALU_MOVE_IMMH , 0 , 4  )  ,  # r0 = 0x40
        construct_op ( ALU_SHR       , 0,  3  )  ,  # r0 = 0x20
        construct_op ( ALU_SHR       , 0,  3  )  ,  # r0 = 0x10
        construct_op ( ALU_SHR       , 0,  3  )  ,  # r0 = 0x8
        construct_op ( ALU_SHR       , 0,  3  )  ,  # r0 = 0x4
        construct_op ( ALU_SHR       , 2,  0  )  ,  # r2 = 14
        construct_op ( ALU_AND       , 2,  3  )  ,  # r2 = 0
        construct_op ( ALU_AND       , 0,  3  )  ,  # r2 = 0

    ]
    regs = [0] * 4

    for op in ops:
        alu_eval(op, regs)

    for r in regs:
        print '%8d [%02X]' % (r,r)

def BVRedAnd(a):
    return BitVecRef(Z3_mk_bvredand(a.ctx_ref(), a.as_ast()), a.ctx)

def BVXnor(a, b):
    return BitVecRef(Z3_mk_bvxnor(a.ctx_ref(), a.as_ast(), b.as_ast()), a.ctx)

def CreateTCAM(bits, prefix, num_rules):
    tcam_bits = []
    matches = []
    for i in xrange(num_rules):
        match_bits_i = BitVec(prefix + '_match_bits_' + str(i), bits.size())
        dc_bits_i = BitVec(prefix + '_dc_bits' + str(i), bits.size())
        match_i = (BVRedAnd(BVXnor(match_bits_i, bits) | dc_bits_i) == BitVecVal(1,1))
        tcam_bits.append((match_bits_i, dc_bits_i))
        matches.append(match_i)
    return Or(*matches), tcam_bits

class ALUSyn(object):
    def __init__(self, opcode, regs_in, prefix):
        # extract reg indices
        r0  = Extract(5, 4, opcode)
        r1  = Extract(7, 6, opcode)
        imm = Extract(7, 4, opcode)

        # The first source
        src0val = If(r0 == BitVecVal(0, 2), regs_in[0], 
                     If(r0 == BitVecVal(1, 2), regs_in[1],
                     If(r0 == BitVecVal(2, 2), regs_in[2], regs_in[3])))
                     
        # Compute the second source.
        reg1val = If(r1 == BitVecVal(0, 2), regs_in[0], 
                     If(r1 == BitVecVal(1, 2), regs_in[1],
                     If(r1 == BitVecVal(2, 2), regs_in[2], regs_in[3])))

        # The second source can either be a zero-extended "low" immediate or
        # a high immediate (immediate moved into upper nibble and merged with src)
        # or a register value.
        r2_imm_hi, self.r2_imm_hi_tcam = CreateTCAM(opcode, prefix + '_reg2_imm_hi', 1)
        r2_imm_lo, self.r2_imm_lo_tcam = CreateTCAM(opcode, prefix + '_reg2_imm_lo', 1)
        src1val = If(r2_imm_hi, Concat(imm, Extract(3, 0, regs_in[0])), 
                    If(r2_imm_lo, Concat(BitVecVal(0, 4), imm), 
                    reg1val))

        # create the TCAMs that match the various ops.
        ops = [
            'add', 'sub', 'and', 'or', 
            'not', 'move', 'shl', 'shr'
        ]
        self.op_tcams = {}
        op_matches = {}
        for op in ops:
            op_matches[op], self.op_tcams[op] = CreateTCAM(opcode, prefix + 'op_' + op, 1)

        # now do the operations themselves
        result = If(op_matches['add'], src0val + src1val,
                    If(op_matches['sub'], src0val - src1val,
                    If(op_matches['and'], src0val & src1val,
                    If(op_matches['or'], src0val | src1val,
                    If(op_matches['not'], ~src1val,
                    If(op_matches['move'], src1val,
                    If(op_matches['shl'], src0val << src1val, 
                    If(op_matches['shr'], LShR(src0val, src1val),
                    src0val))))))))

        # figure out what the destination register is
        dest_r0_m, self.dest_r0_tcam = CreateTCAM(opcode, prefix + 'dest_r0', 1)
        dreg = If(dest_r0_m, BitVecVal(0, 2), r0)

        # now write the result back to the reg file.
        self.reg_out_exprs = []
        for i in xrange(4):
            expr_i = If(dreg == i, result, regs_in[i])
            self.reg_out_exprs.append(expr_i)
        
    def print_solution(self, m):
        printTCAM(m, 'r1_immhi', self.r2_imm_hi_tcam)
        printTCAM(m, 'r1_immlo', self.r2_imm_lo_tcam)
        for op in self.op_tcams:
            printTCAM(m, 'op_'+op, self.op_tcams[op])
        printTCAM(m, 'dest_r0', self.dest_r0_tcam)

def getBit(m, bv, i):
    val = m[bv].as_long()
    if (val & (1 << i)) != 0: 
        return 1
    else: 
        return 0

def printTCAM(m, label, tcam):
    ss = []
    for (ms, ds) in tcam:
        s = ''
        for i in reversed(xrange(ms.size())):
            if getBit(m, ds, i) == 0:
                s += str(getBit(m, ms, i))
            else:
                s += '-'
        ss.append(s)
    print label, ':', (' + '.join(ss))


def eval_alu(opcode, regs):
    regs_out = regs[:]
    alu_eval(opcode, regs_out)
    return regs_out

def add_cnsts(S, alu, opcode_val, regs_in_val, regs_out_val, opcode, regs_in):
    subs = []
    subs.append((opcode, BitVecVal(opcode_val, 8)))
    for i, ri_val in enumerate(regs_in_val):
        ri_bitvec_val = BitVecVal(ri_val, 8)
        subs.append((regs_in[i], ri_bitvec_val))

    for i, regs_out_expr_i in enumerate(alu.reg_out_exprs):
        regs_out_expr_i_prime = substitute(regs_out_expr_i, subs)
        S.add(regs_out_expr_i_prime == BitVecVal(regs_out_val[i], 8))

def synthesize():
    S = Solver()
    # create the opcode.
    opcode = BitVec('opcode', 8)
    # create the input and output registers
    regs_in, regs_out_1, regs_out_2 = [], [], []
    diff_clauses = []
    for i in xrange(4):
        regs_in.append(BitVec('ri' + str(i), 8))
        regs_out_1.append(BitVec('ro1' + str(i), 8))
        regs_out_2.append(BitVec('ro2' + str(i), 8))
        diff_clauses.append(regs_out_1[-1] != regs_out_2[-1])

    s1 = ALUSyn(opcode, regs_in, 'x1_')
    s2 = ALUSyn(opcode, regs_in, 'x2_')

    for i, reg_out_expr_i in enumerate(s1.reg_out_exprs):
        S.add(regs_out_1[i] == reg_out_expr_i)

    for i, reg_out_expr_i in enumerate(s2.reg_out_exprs):
        S.add(regs_out_2[i] == reg_out_expr_i)

    y = Bool('different')
    S.add(y == Or(*diff_clauses))

    # run the synthesis loop.
    iter = 0
    while S.check(y) == sat:
        m = S.model()
        opcode_val = m[opcode].as_long()
        regs_in_val = [(m[ri].as_long() if m[ri] else 0) for ri in regs_in]
        regs_out_val = eval_alu(opcode_val, regs_in_val)

        print 'opcode:%2x -- %s' % (opcode_val, disassemble(opcode_val, regs_in_val, regs_out_val))

        add_cnsts(S, s1, opcode_val, regs_in_val, regs_out_val, opcode, regs_in)
        add_cnsts(S, s2, opcode_val, regs_in_val, regs_out_val, opcode, regs_in)

        iter += 1

    print 'UNSAT after %d iterations.' % iter
    assert S.check(Not(y)) == sat
    s1.print_solution(S.model())

if __name__ == '__main__':
    test_alu()
    synthesize()



