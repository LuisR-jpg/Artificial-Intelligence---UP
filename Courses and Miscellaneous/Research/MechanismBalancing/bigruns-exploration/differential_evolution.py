import numpy as np

class DifferentialEvolution:
    def __init__(self, func, bounds, popSize, cR, nMax, args):
        assert callable(func), 'func is not function'
        bounds = np.array(bounds)
        assert isinstance(bounds, np.ndarray), 'bounds is not np.ndarray'
        args = np.array(args)
        assert isinstance(args, np.ndarray), 'args is not np.ndarray'
        assert isinstance(popSize, int), 'popSize is not int'
        assert isinstance(cR, float), 'cR is not float'
        assert isinstance(nMax, int), 'nMax is not int'
        self.func = func
        self.bounds = bounds
        self.args = args 
        self.popSize = popSize
        self.cR = cR        #The bigger cR is, the more risk we take
        self.nMax = nMax
        self.nVar = bounds.shape[0]
        self.nF = 0         #Evaluations of the function
        self.nIt = 0        #Number of iterations
        self.fitness = None
        self.population = None

    def getFitness(self, i):
        assert isinstance(i, np.ndarray), 'individual is not np.ndarray'
        assert i.shape == (self.popSize, self.nVar), "population has the wrong size"
        r = self._getFitness(i)
        return r
    def _getFitness(self, i):
        self.nF += 1
        return self.func(i, *self.args)

    def mutation(self):
        r = self._mutation()
        assert isinstance(r, np.ndarray), 'r is not np.ndarray'
        return r
    def _mutation(self):
        rand = np.random.randint(low = 0, high = self.popSize, size = (self.popSize, 3))
        rand = self.population[rand]
        F = np.random.uniform(0, 2, (self.popSize, 1))
        r = np.add(rand[:, 0], F * np.subtract(rand[:, 1], rand[:, 2]))
        for i, s in enumerate(r):
            r[i] = np.min((np.max((s, self.bounds[:, 0]), axis = 0), self.bounds[:, 1]), axis = 0)
        return r

    def crossover(self, mutated):
        assert isinstance(mutated, np.ndarray), 'mutated is not np.ndarray'
        assert mutated.shape == self.population.shape, "mutated matrix doesn't have the right size"
        r = self._crossover(mutated)
        assert isinstance(r, np.ndarray), 'r is not np.ndarray'
        return r
    def _crossover(self, mutated):
        rand = np.random.rand(self.popSize, self.nVar)
        r = np.where(rand >= self.cR, self.population, mutated)
        return np.array(r)

    def selection(self, u): 
        assert isinstance(u, np.ndarray), 'u is not np.ndarray' # New individual
        self._selection(u)
    def _selection(self, u):
        f = self.getFitness(u)
        betterIndices = np.where(f < self.fitness)
        self.fitness[betterIndices] = f[betterIndices]
        self.population[betterIndices] = u[betterIndices]

    def initPopulation(self):
        self.population = np.zeros((self.popSize, self.nVar))
        for v in range(self.nVar):
            vMin, vMax = self.bounds[v, 0], self.bounds[v, 1]
            self.population[:, v] = np.random.uniform(vMin, vMax, (self.popSize))
        self.fitness = self.getFitness(self.population)
    
    def solve(self):
        r = self._solve()
        assert isinstance(r, dict), 'r is not dict'
        return r
    def _solve(self):
        self.initPopulation()
        for _ in range(self.nMax):
            self.nIt += 1
            u = self.crossover(self.mutation())
            self.selection(u)
            if len(np.unique(self.fitness)) == 1: break
        best = np.argmin(self.fitness)
        
        return {"x": self.population[best].reshape((1, self.nVar)), "nIt": self.nIt, "fun": self.fitness[best], "nFev": self.nF}
    
def differential_evolution(func, bounds, popSize, cR, nMax, args = ()):
    dE = DifferentialEvolution(func, bounds, popSize, cR, nMax, args)
    return dE.solve()