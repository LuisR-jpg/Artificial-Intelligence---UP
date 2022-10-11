import numpy as np

class DifferentialEvolution:
    def __init__(self, func, bounds, popSize, cR, nGen, args):
        assert isinstance(func, function), 'func is not function'
        assert isinstance(bounds, np.ndarray), 'bounds is not np.ndarray'
        assert isinstance(args, np.ndarray), 'args is not np.ndarray'
        assert isinstance(popSize, int), 'popSize is not int'
        assert isinstance(cR, float), 'cR is not float'
        assert isinstance(nGen, int), 'nGen is not int'
        self.func = func
        self.bounds = bounds
        self.args = args 
        self.popSize = popSize
        self.cR = cR
        self.nGen = nGen
        self.nVar = bounds.shape[0]
        self.nIt = 0

    def _getFitness(self, i):
        assert isinstance(i, np.ndarray), 'individual is not np.ndarray'
        assert i.shape[0] == self.nVar, 'individual has size == nVar'
        assert isinstance(img, np.ndarray), 'img is not np.ndarray'
        self.nIt += 1
        r = self.func(i, *self.args)
        assert isinstance(r, float), 'r is not float'
        return r

    def _mutation(self):
        pass
    def _selection(self):
        pass
    def _initPopulation(self):
        pass
    def _solve(self):
        pass
def differential_evolution(func, bounds, popSize, cR, nGen, args):
    dE = DifferentialEvolution(func, bounds, popSize, cR, nGen, args = ())
    return dE.solve()