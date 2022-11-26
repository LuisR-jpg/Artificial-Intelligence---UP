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
        r = self._rouletteSelection(self)
        assert isinstance(r, np.array) and r.shape[0] == k, 'r is not the expected result'
        return r
    def _rouletteSelection(self):
        maxV, minV = np.max(self.fitness), np.min(self.fitness)
        norm = (self.fitnesses - minV) / (maxV - minV)
        return np.random.choice(

    def crossover(self):
        self._crossover()
    def _crossover(self):
        pass 

    def mutation(self):
        self._mutation()
    def _mutation(self):
        pass 

    def solve(self):
        self._solve()
    def _solve(self):
        pass 

def genetic_algorithm(fitness, args = (), popSize = 50, nGen = 50, pRep = 0.5, pMut = 0.5, dim = (5, 5, 0, 5)):
    gA = GeneticAlgorithm(fitness, args, popSize, nGen, pRep, pMut, dim)
    return gA.solve()




