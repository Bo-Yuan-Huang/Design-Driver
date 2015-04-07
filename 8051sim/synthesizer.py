import itertools
import ast
import z3
import pdb
import sys

class Synthesizer(object):
    """The Synthesizer class encapsulates the synthesis algorithm."""
    # these two constants are used as prefixes to encode the synthesis variables.
    P1 = 's1'
    P2 = 's2'

    BOOL    = 1
    BITVEC  = 2
    MEM     = 3

    def __init__(self):
        """Constructor."""
        self.inputs = {}
        self.outputs = {}
        self.outputTypes = {}
        self.constraints = []
        self.VERBOSITY = 0
        self.MAXITER = 1000000
        self.name_id = 1001
        self.debug_objects = []
        self.unsat_core = False
        self.logfile = None
        self.DUMP_SMT2 = False
        self.DEBUG = False

    def addInput(self, inp):
        """Create an input variable. An input variable is a piece of state
        which is used to compute the values of the state variable."""
        self.inputs[inp.name] = inp
        self.inputs[inp.name].is_input = True

    def inp(self, name):
        """Return the input with this name."""
        if name not in self.inputs:
            raise KeyError, "Input '%s' not declared." % name
        return self.inputs[name]

    def addOutput(self, name, out, t):
        """Add an output variable to the synthesizer. An output variable is a 
        variable whose behavior has to be synthesized."""
        self.outputs[name] = out
        self.outputTypes[name] = t

    def addConstraint(self, cnst):
        """Add a constraint to the solver.  This should only be called on one
        of the input variables."""
        self.constraints.append(cnst)

    def addExpr(self, S, expr, name):
        if self.unsat_core:
            S.assert_and_track(expr, name)
        else:
            S.add(expr)

    def createOutputExpressions(self, outputs):
        outs = []
        y1s = []
        y2s = []
        for i, name in enumerate(outputs):
            if name not in self.outputs:
                raise KeyError, "No output '%s' is known." % name
            out = self.outputs[name]
            outs.append( self.outputs[name] )

            # this cache clearing business is important, if not done it leads to untold grief.
            out.clearCache()
            y1 = out.toZ3(Synthesizer.P1)
            y2 = out.toZ3(Synthesizer.P2)

            y1s.append( y1 )
            y2s.append( y2 )

            if self.VERBOSITY >= 4: 
                self.log('out :' + str(out))
                self.log('exp1[%d]:%s' % (i, y1.sexpr()))
                self.log('exp2[%d]:%s' % (i, y2.sexpr()))
        
        return outs, y1s, y2s

    def createInputVars(self):
        # input_vars contains the Z3 objects corresponding
        # to each input variable.
        input_vars = {}
        for inp_i in self.inputs:
            inp_ast_i = self.inputs[inp_i]

            inp_ast_i.clearCache()
            var_i = inp_ast_i.toZ3()
            input_vars[inp_i] = var_i
        
        if self.VERBOSITY >= 3: 
            self.log('input_vars:' + repr(input_vars))
        return input_vars

    def addConstraints(self, S, cnsts):
        # add any user specified constraints.
        for i, c in enumerate(itertools.chain(self.constraints, cnsts)):
            c.clearCache()
            ci = c.toZ3()

            ci_name = 'cnst%d' % i
            self.addExpr(S, ci, ci_name)
            if self.VERBOSITY >= 3: 
                self.log('%s: %s' % (ci_name, ci.sexpr()))


    def extractInputsFromModel(self, m, input_vars):
        sim_inputs = {}
        for inp_name in self.inputs:
            inp_ast = self.inputs[inp_name]
            inp_z3 = input_vars[inp_name]
            m_inp = m[inp_z3]
            if m_inp:
                if inp_ast.isBoolVar():
                    sim_inputs[inp_name] = z3.is_true(m[m_inp])
                elif inp_ast.isBitVecVar():
                    sim_inputs[inp_name] = m_inp.as_long()
                elif inp_ast.isMemVar():
                    sim_inputs[inp_name] = self.cleanupMemList(m_inp.as_list())
                elif inp_ast.isFuncVar():
                    # nothing to do
                    pass
                else:
                    assert False, 'Unknown node type.'
            else:
                if inp_ast.isMemVar():
                    sim_inputs[inp_name] = [0]
                else:
                    sim_inputs[inp_name] = 0
        return sim_inputs

    def dumpModel(self, m, y1s, y2s):
        if self.VERBOSITY >= 3: 
            self.log('model:' + repr(m))
        if self.VERBOSITY >= 2:
            for n, d in self.debug_objects:
                d.clearCache()
                dz3 = d.toZ3(Synthesizer.P1)
                self.log('%s:%s' % (n, hex(m.eval(dz3).as_long())))
            # FIXME
            # self.log('e_y1:' + repr(m.eval(yexp1)))
            # self.log('e_y2:' + repr(m.eval(yexp2)))
            # if y1mz3:
            #     self.log('e_y1mz3:' + repr(m.eval(y1mz3)))
            #     self.log('e_y2mz3:' + repr(m.eval(y2mz3)))


    def synthesize(self, outputNames, cnsts, sim):
        """Main synthesizer."""

        outs, y1s, y2s = self.createOutputExpressions(outputNames)
        input_vars = self.createInputVars()

        # let's create the initial instance.
        S = z3.Solver()

        # do we want unsat cores?
        if self.unsat_core: S.set(unsat_core=True)

        # constraints.
        self.addConstraints(S, cnsts)

        # let's now create the expression that states one of the outputs must be different.
        ys = []
        for i, (y1, y2) in enumerate(itertools.izip(y1s, y2s)):
            yi = z3.Bool('y%d' % i)
            self.addExpr(S, yi == z3.Distinct(y1, y2), 'prob%d' % i)
            ys.append(yi)
        y = z3.Bool('y')
        self.addExpr(S, y == z3.Or(*ys), 'prob')

        # now for the actual solution loop.
        iterations = 0
        # FIXME
        # y1mz3 = None
        # y2mz3 = None
        while S.check(y) == z3.sat:

            iterations += 1
            m = S.model()

            if self.VERBOSITY >= 2:
                self.log('\niteration #%d' % iterations)

            self.dumpModel(m, y1s, y2s)
            sim_inputs = self.extractInputsFromModel(m, input_vars)
            sim_outputs = {}

            # FIXME sim signature.
            sim(sim_inputs, sim_outputs)

            if self.DEBUG:
                pass

            if self.VERBOSITY >= 2:
                self.log_dict('sim_inputs', sim_inputs)
                self.log_dict('sim_outputs', sim_outputs)

            def assertEquality(ocnst, name):
                n1 = 'out_%s_1_%d' % (name, iterations)
                n2 = 'out_%s_2_%d' % (name, iterations)

                if self.unsat_core:
                    S.assert_and_track(ocnst == y1mz3, n1)
                    S.assert_and_track(ocnst == y2mz3, n2)
                else:
                    S.add(ocnst == y1mz3)
                    S.add(ocnst == y2mz3)
                
                if self.VERBOSITY >= 4:
                    self.log('out:' + repr(ocnst))

            y1z3s, y2z3s = [], []
            for name, out in itertools.izip(outputNames, outs):
                out.clearCache()
                y1mz3 = z3.simplify(out.toZ3Constraints(Synthesizer.P1, sim_inputs))
                out.clearCache()
                y2mz3 = z3.simplify(out.toZ3Constraints(Synthesizer.P2, sim_inputs))

                y1z3s.append(y1mz3)
                y2z3s.append(y2mz3)

                if self.VERBOSITY >= 4:
                    self.log('#it:' + repr(iterations))
                    self.log('y1mz3:' + y1mz3.sexpr())
                    self.log('y2mz3:' + y2mz3.sexpr())

                if self.outputTypes[name] == Synthesizer.BITVEC:
                    assertEquality(z3.BitVecVal(sim_outputs[name], out.width), name)
                elif self.outputTypes[name] == Synthesizer.BOOL:
                    assertEquality(z3.BoolVal(sim_outputs[name]), name)
                else:
                    assert self.outputTypes[name] == Synthesizer.MEM
                    assertEquality(ast.createConstantArray(out.awidth, out.dwidth, sim_outputs[name]), name)

            if iterations >= self.MAXITER:
                raise RuntimeError, 'Too many (%d) iterations executed.' % iterations

            if self.VERBOSITY >= 4 or self.DUMP_SMT2:
                filename = 'model%d.smt2' % iterations
                with open(filename, 'wt') as fileobj:
                    print >> fileobj, S.to_smt2()


        # and finally we are done.
        if self.VERBOSITY >= 1:
            self.log('Finished after %d iteration(s).' % iterations)

        # now we need to extract solution
        result = S.check(z3.Not(y))
        if result == z3.unsat and self.unsat_core:
            self.log('UNSAT core: ' + repr(S.unsat_core()))
            S.add(z3.Not(y))

        assert result == z3.sat
        m = S.model()
        if self.VERBOSITY >= 3:
            self.log('model:' + repr(m))

        for out in outs:
            out.clearCache()
        rs = [out.synthesize(m) for out in outs]
        for r in rs:
            r.clearCache()
        return rs

    def cleanupMemList(self, memvals):        
        vals = []
        for [az3, dz3] in memvals[:-1]:
            vals.append([az3.as_long(), dz3.as_long()])
        vals.append(memvals[-1].as_long())
        return vals


    def str_mem(self, m):
        s1 = ['%x:%x' % (a,d) for [a,d] in sorted(m[:-1])]
        s2 = ['else:%x' % m[-1]]
        return '[%s]' % (' '.join(s1+s2))

    def log_dict(self, n, d):
        vs = []
        for k in sorted(d.keys()):
            v = d[k]
            try:
                vs.append('%s:%x' % (k, v))
            except TypeError:
                vs.append('%s:%s' % (k, self.str_mem(v)))
        self.log(n + ' ' + ' '.join(vs))


    def log(self, s):
        if self.logfile:
            print >> self.logfile, s

    def debug(self, vb=2, lf=sys.stdout, uc=True):
        self.VERBOSITY = vb
        self.logfile = lf
        self.unsat_core = uc

