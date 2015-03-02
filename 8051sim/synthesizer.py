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
        self.VERBOSITY = 1
        self.name_id = 1001

    def _getUniqName(self, base):
        name = '$uniq_%s_%d__' % (base, self.name_id)
        self.name_id += 1
        return name

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
        S.add(y == (z3.Distinct(yexp1, yexp2)))

        # add any user specified constraints.
        for i, c in enumerate(itertools.chain(self.constraints, cnsts)):
            ci = c.toZ3()
            S.add(ci)
            if self.VERBOSITY >= 3:
                print 'cnst%d: %s' % (i, str(ci))

        # now for the actual solution loop.
        iterations = 0
        while S.check(y) == z3.sat:
            iterations += 1
            m = S.model()
            if self.VERBOSITY >= 3:
                print 'model:', m
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
                        sim_inputs[inp_name] = m_inp.as_list()
                    else:
                        assert False, 'Unknown node type.'
                else:
                    if inp_ast.isMemVar():
                        sim_inputs[inp_name] = [0]
                    else:
                        sim_inputs[inp_name] = 0

            sim_outputs = {}
            sim(sim_inputs, sim_outputs)
            if self.VERBOSITY >= 3:
                print 'sim_inputs:', sim_inputs
                print 'sim_outputs:', sim_outputs

            self._addClauses(S, name, yexp1, input_vars, sim_inputs, sim_outputs)
            self._addClauses(S, name, yexp2, input_vars, sim_inputs, sim_outputs)

        # and finally we are done.
        if self.VERBOSITY >= 1:
            print 'Finished after %d iteration(s).' % iterations

        # now we need to extract solution
        result = S.check(z3.Not(y))
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

