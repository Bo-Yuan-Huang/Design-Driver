import itertools
import ast
import z3
import pdb

class Synthesizer(object):
    """The Synthesizer class encapsulates the synthesis algorithm."""
    # these two constants are used as prefixes to encode the synthesis variables.
    P1 = 's1'
    P2 = 's2'

    def __init__(self):
        """Constructor."""
        self.inputs = {}
        self.outputs = {}
        self.constraints = []
        self.VERBOSITY = 0
        self.MAXITER = 1000000
        self.name_id = 1001
        self.debug_objects = []
        self.unsat_core = False

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

    def addOutput(self, name, out):
        """Add an output variable to the synthesizer. An output variable is a 
        variable whose behavior has to be synthesized."""
        self.outputs[name] = out

    def addConstraint(self, cnst):
        """Add a constraint to the solver.  This should only be called on one
        of the input variables."""
        self.constraints.append(cnst)

    def synthesize(self, name, cnsts, sim):
        """Main synthesizer."""
        if name not in self.outputs:
            raise KeyError, "No output '%s' is known." % name

        if self.VERBOSITY >= 1:
            print 'Synthesizing output: %s.' % name

        # create the expressions for the output variable.
        out = self.outputs[name]
        out.clearZ3Cache()

        yexp1 = out.toZ3(Synthesizer.P1)
        yexp2 = out.toZ3(Synthesizer.P2)

        # input_vars contains the Z3 objects corresponding
        # to each input variable.
        input_vars = {}
        for inp_i in self.inputs:
            var_i = self.inputs[inp_i].toZ3()
            input_vars[inp_i] = var_i

        if self.VERBOSITY >= 3:
            print 'out :', out 
            print 'exp1:', yexp1
            print 'exp2:', yexp2
            print 'input_vars:', input_vars

        # let's create the initial instance.
        S = z3.Solver()
        y = z3.Bool('y')

        if self.unsat_core:
            S.set(unsat_core=True)
            S.assert_and_track(y == (z3.Distinct(yexp1, yexp2)), 'prob')
        else:
            S.add(y == (z3.Distinct(yexp1, yexp2)))

        # add any user specified constraints.
        for i, c in enumerate(itertools.chain(self.constraints, cnsts)):
            ci = c.toZ3()
            ci_name = 'cnst%d' % i
            if self.unsat_core:
                S.assert_and_track(ci, ci_name)
            else:
                S.add(ci)
            if self.VERBOSITY >= 3:
                print '%s: %s' % (ci_name, str(ci))

        # now for the actual solution loop.
        iterations = 0
        y1mz3 = None
        y2mz3 = None
        while S.check(y) == z3.sat:
            out.clearZ3Cache()

            iterations += 1
            m = S.model()
            if self.VERBOSITY >= 3:
                print 'model:', m
                print 'e_y1:', m.eval(yexp1)
                print 'e_y2:', m.eval(yexp2)
                if y1mz3:
                    print 'e_y1mz3:', m.eval(y1mz3)
                    print 'e_y2mz3:', m.eval(y2mz3)

                if self.VERBOSITY >= 4:
                    subs = []
                    for k in m:
                        if k.name().startswith('_choice'):
                            n_k = z3.Bool(k.name())
                            v_k = z3.is_true(m[k])
                            subs.append((n_k, z3.BoolVal(v_k)))

                    opcode = z3.BitVec('opcode', 24)
                    subs.append((opcode, z3.BitVecVal(m[opcode].as_long(), 24)))
                    print subs
                    y1p = z3.simplify(z3.substitute(yexp1, subs))
                    y2p = z3.simplify(z3.substitute(yexp2, subs))
                    print 'y1\':', y1p
                    print 'y2\':', y2p

            # TODO: might need more work when we model arrays.
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
                    else:
                        assert False, 'Unknown node type.'
                else:
                    if inp_ast.isMemVar():
                        sim_inputs[inp_name] = [0]
                    else:
                        sim_inputs[inp_name] = 0

            sim_outputs = {}
            sim(sim_inputs, sim_outputs)
            if self.VERBOSITY >= 2:
                self.print_dict('sim_inputs', sim_inputs)
                self.print_dict('sim_outputs', sim_outputs)

            y1mz3 = z3.simplify(out.toZ3Constraints(Synthesizer.P1, sim_inputs))
            y2mz3 = z3.simplify(out.toZ3Constraints(Synthesizer.P2, sim_inputs))

            try:
                ocnst = z3.BitVecVal(sim_outputs[name], out.width)
            except AttributeError:
                ocnst = z3.BoolVal(sim_outputs[name])

            n1 = 'out1_%d' % iterations
            n2 = 'out2_%d' % iterations
            if self.unsat_core:
                S.assert_and_track(ocnst == y1mz3, n1)
                S.assert_and_track(ocnst == y2mz3, n2)
            else:
                S.add(ocnst == y1mz3)
                S.add(ocnst == y2mz3)
                

            if self.VERBOSITY >= 3:
                print '#it:', iterations
                print 'y1mz3:', y1mz3
                print 'y2mz3:', y2mz3
                print 'out:', ocnst
                for i, o in enumerate(self.debug_objects):
                    print 'DBG%dA: %s' % (i, z3.simplify(o.toZ3Constraints(Synthesizer.P1, sim_inputs)).sexpr())
                    print 'DBG%dB: %s' % (i, z3.simplify(o.toZ3Constraints(Synthesizer.P2, sim_inputs)).sexpr())

            if iterations >= self.MAXITER:
                raise RuntimeError, 'Too many (%d) iterations executed.' % iterations

            if self.VERBOSITY >= 4:
                filename = 'model%d.smt2' % iterations
                with open(filename, 'wt') as fileobj:
                    print >> fileobj, S.to_smt2()

            #self._addClauses(S, name, yexp1, input_vars, sim_inputs, sim_outputs)
            #self._addClauses(S, name, yexp2, input_vars, sim_inputs, sim_outputs)

        # and finally we are done.
        if self.VERBOSITY >= 1:
            print 'Finished after %d iteration(s).' % iterations

        # now we need to extract solution
        result = S.check(z3.Not(y))
        if result == z3.unsat and self.unsat_core:
            print 'UNSAT core:', S.unsat_core()
        assert result == z3.sat
        m = S.model()
        if self.VERBOSITY >= 3:
            print 'model:', m

        return out.synthesize(m)

    def _addClauses(self, S, out, yexp, ivars, sim_inputs, sim_outputs):
        """Adds clauses to the instance which encode the fact that the
           output for this particular input must as specified."""
        subs = []
        mem_subs = {}
        for inp in self.inputs:
            assert inp in ivars
            assert inp in sim_inputs
            inp_ast = self.inputs[inp]
            if inp_ast.isBitVecVar():
                subs.append((ivars[inp], z3.BitVecVal(sim_inputs[inp], ivars[inp].size())))
            elif inp_ast.isBoolVar():
                raise NotImplementedError, "Bool variables aren't handled yet."
            elif inp_ast.isMemVar():
                raise NotImplementedError, "Memory variables aren't handled yet."
            else:
                raise NotImplementedError, "Unknown variable type."

        yexp_ = z3.substitute(yexp, subs)
        cnst = yexp_ == z3.BitVecVal(sim_outputs[out], yexp_.size())
        if self.VERBOSITY >= 3:
            print 'new cnst:', cnst
        S.add(cnst)

    def cleanupMemList(self, memvals):        
        vals = []
        for [az3, dz3] in memvals[:-1]:
            vals.append([az3.as_long(), dz3.as_long()])
        vals.append(memvals[-1].as_long())
        return vals


    def str_mem(self, m):
        s1 = ['%x:%x' % (a,d) for [a,d] in m[:-1]]
        s2 = ['else:%x' % m[-1]]
        return '[%s]' % (' '.join(s1+s2))

    def print_dict(self, n, d):
        vs = []
        for (k, v) in d.iteritems():
            try:
                vs.append('%s:%x' % (k, v))
            except TypeError:
                vs.append('%s:%s' % (k, self.str_mem(v)))
        print n, ' '.join(vs)


