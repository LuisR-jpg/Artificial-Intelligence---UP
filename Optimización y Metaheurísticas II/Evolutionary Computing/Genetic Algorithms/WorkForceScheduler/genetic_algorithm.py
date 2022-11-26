import numpy as np

# Maximizes the objective function

class GeneticAlgorithm:
    def __init__(self, fitness, args, popSize, nGen, pRep, pMut, dim): # Objective function, arguments of the function, Population size, number of generations, reproduction probability, mutation probability, dimensions of the solution (height, width, minVal, maxVal)
        assert callable(fitness), 'fitness is not a function'
        assert isinstance(args, tuple), 'fitness is not tuple'
        assert isinstance(popSize, int), 'popSize is not int'
        assert isinstance(nGen, int), 'nGen is not int'
        assert isinstance(pRep, float), 'pRep is not float'
        assert isinstance(pMut, float), 'pMut is not float'
        assert isinstance(dim, tuple) and len(dim) == 4, 'dim is not valid'

        self.fitness = fitness
        self.args = args
        self.popSize = popSize
        self.nGen = nGen
        self.pRep = pRep
        self.pMut = pMut
        self.population = None
        self.height, self.width, self.minValue, self.maxValue = dim
        self.nEvaluations = 0
        self.fitnesses = None
    
    def initPopulation(self):
        self._initPopulation()
        assert isinstance(self.population, np.array), 'r is not np.array'
    def _initPopulation(self):
        self.population = np.random.uniform(self.minValue, self.maxValue, (self.popSize, self.height, self.width))

    def getFitness(self, individual):
        assert individual.shape == self.dim, 'individual is not valid'
        r = self._getFitness()
        assert isinstance(r, float), 'r is not of the valid type'
        return r
    def _getFitness(self, individual):
        self.nEvaluations += 1
        return self.fitness(individual, *self.args)
    
    def rouletteSelection(self, k): #Number of individuals to be selected
        assert isinstance(k, int), 'k is not int'
        assert self.fitnesses != None, 'fitnesses has not been initialized'
        r = self._rouletteSelection(k)
        assert isinstance(r, np.array) and r.shape[0] == k, 'r is not the expected result'
        return r
    def _rouletteSelection(self, k):
        maxV, minV = np.max(self.fitness), np.min(self.fitness)
        norm = (self.fitnesses - minV) / (maxV - minV)
        return np.random.choice(self.height, k, False, norm)

    def crossover(self, parentOne, parentTwo):
        assert parentOne.shape == self.dim, "parentOne doesn't have the expected shape"
        assert parentTwo.shape == self.dim, "parentTwo doesn't have the expected shape"
        r = self._crossover(parentOne, parentTwo)
        assert r.shape == self.dim, "r doesn't have the expected shape"
    def _crossover(self, parentOne, parentTwo):
        child = np.copy(parentOne)
        if np.random.random() < self.pRep:
            numberOfRows = np.random.randint(1, self.height)
            rowsToSwap = np.random.choice(self.height, numberOfRows, False)
            child[rowsToSwap] = np.copy(parentTwo[rowsToSwap])
        elif np.random.random() < 0.5: child = np.copy(parentTwo)
        return child

    def mutation(self, child):
        assert child.shape == self.dim, "child doesn't have the expected shape"
        r = self._mutation(child)
        assert r.shape == self.dim, "r doesn't have the expected shape"
    def _mutation(self, child):
        if np.random.random() < self.pMut:
            numberOfRows = np.random.randint(1, self.height)
            rowsToReset = np.choice(self.height, numberOfRows, False)
            newValue = np.random.randint(self.minValue, self.maxValue)
            child[rowsToReset] = newValue
        return child

    def solve(self):
        self._solve()
    def _solve(self):
        pass 

def genetic_algorithm(fitness, args = (), popSize = 50, nGen = 50, pRep = 0.5, pMut = 0.5, dim = (5, 5, 0, 5)):
    gA = GeneticAlgorithm(fitness, args, popSize, nGen, pRep, pMut, dim)
    return gA.solve()




