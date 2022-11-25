class GeneticAlgorithm:
    def __init__(self, fitness, args, popSize, nGen, pRep, pMut): # Population size, number of generations, reproduction probability, mutation probability
        assert callable(fitness), 'fitness is not a function'
        assert isinstance(popSize, int), 'popSize is not int'
        assert isinstance(nGen, int), 'nGen is not int'
        assert isinstance(pRep, float), 'pRep is not float'
        assert isinstance(pMut, float), 'pMut is not float'

        self.popSize = popSize
        self.nGen = nGen
        self.pRep = self.pRep
        self.pMut = pMut
        self.fitness = fitness
    
    def initPopulation(self):
        self._initPopulation()
    def _initPopulation(self):
        pass

    def getFitness(self):
        self._getFitness()
    def _getFitness(self):
        pass

    def rouletteSelection(self):
        self._rouletteSelection(self)
    def _rouletteSelection(self):
        pass

    def crossover(self):
        self._crossover()
    def _crossover(self):
        pass

    def mutation(self):
        self._mutation()
    def _mutation():
        pass

    def solve(self):
        self._solve()
    def _solve():
        pass

    def genetic_algorithm(fitness, args = (), popSize = 50, nGen = 50, pRep = 0.5, pMut = 0.5):
        gA = GeneticAlgorithm(fitness, args, popSize, nGen, pRep, pMut)
        return gA.solve()




