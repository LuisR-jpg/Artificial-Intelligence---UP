import torch
class DifferentialEvolution:
    def __init__(self, func, bounds, popSize, cR, nMax, args, device):
        assert callable(func), 'func is not function'
        bounds = torch.as_tensor(bounds, dtype = torch.half, device = device)
        #bounds = bounds.clone().detach()
        assert isinstance(bounds, torch.Tensor), 'bounds is not torch.Tensor'
        #args = torch.tensor(args, device = device)
        #assert isinstance(args, torch.Tensor), 'args is not torch.Tensor'
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
        self.device = device

    def getFitness(self, i):
        assert isinstance(i, torch.Tensor), 'individual is not torch.Tensor'
        assert i.shape[0] == self.nVar, "individual doesn't have size == nVar"
        r = self._getFitness(i)
        return r
    def _getFitness(self, i):
        self.nF += 1
        return self.func(i, *self.args)

    def mutation(self):
        r = self._mutation()
        assert isinstance(r, torch.Tensor), 'r is not torch.Tensor'
        return r
    def _mutation(self):
        rand = torch.randint(low = 0, high = self.popSize, size = (3))
        r1, r2, r3 = self.population[rand]
        F = torch.rand() * 2
        r = torch.add(r1, F*torch.subtract(r2, r3))
        r = [torch.min((torch.max((v, self.bounds[i, 0])), self.bounds[i, 1])) for i, v in enumerate(r)]
        return torch.as_tensor(r, dtype = torch.half, device = self.device)

    def crossover(self, pOne, pTwo):
        assert isinstance(pOne, torch.Tensor), 'pOne is not torch.Tensor'
        assert isinstance(pTwo, torch.Tensor), 'pTwo is not torch.Tensor'
        r = self._crossover(pOne, pTwo)
        assert isinstance(r, torch.Tensor), 'r is not torch.Tensor'
        return r
    def _crossover(self, pOne, pTwo):
        r = [pOne[i] if torch.rand() >= self.cR else pTwo[i] for i in range(pOne.shape[0])]
        return torch.as_tensor(r, dtype = torch.half, device = self.device)

    def selection(self, x, u): 
        assert isinstance(x, int), 'x is not int'               #Index of the already existing individual
        assert isinstance(u, torch.Tensor), 'u is not torch.Tensor' #New individual
        self._selection(x, u)
    def _selection(self, x, u):
        f = self.getFitness(u)
        if f < self.fitness[x]: 
            self.fitness[x] = f
            self.population[x] = torch.clone(u)

    def initPopulation(self):
        self.population = torch.zeros((self.popSize, self.nVar))
        for v in range(self.nVar):
            vMin, vMax = self.bounds[v, 0], self.bounds[v, 1]
            self.population[:, v] = torch.FloatTensor(self.popSize).uniform_(vMin, vMax)
        self.fitness = torch.as_tensor([self.getFitness(i) for i in self.population], dtype = torch.half, device = self.device)
    
    def solve(self):
        r = self._solve()
        assert isinstance(r, dict), 'r is not dict'
        return r
    def _solve(self):
        self.initPopulation()
        for _ in range(self.nMax):
            self.nIt += 1
            for i, individual in enumerate(self.population):
                u = self.crossover(individual, self.mutation())
                self.selection(i, u)
            if len(torch.unique(self.fitness)) == 1: break
        best = torch.argmin(self.fitness)
        
        return {"x": self.population[best], "nIt": self.nIt, "fun": self.fitness[best], "nFev": self.nF}
    
def differential_evolution(func, bounds, popSize, cR = 0.75, nMax = 100, args = (), seed = 1, device = torch.device('cpu')):
    torch.manual_seed(seed)
    if device is torch.device("cuda"): 
        torch.cuda.manual_seed(seed)
        torch.cuda.manual_seed_all(seed)
    dE = DifferentialEvolution(func, bounds, popSize, cR, nMax, args, device)
    return dE.solve()