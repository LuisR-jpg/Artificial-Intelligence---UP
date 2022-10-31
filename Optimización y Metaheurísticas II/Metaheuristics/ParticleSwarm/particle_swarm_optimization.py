import numpy as np

class ParticleSwarmOptimization:
    def __init__(self, nParticles, maxIter, func, bounds, args):
        assert isinstance(nParticles, int), 'nParticles is not int'
        assert isinstance(maxIter, int), 'maxIter is not int'
        assert callable(func), 'func is not function'
        bounds = np.array(bounds)
        assert isinstance(bounds, np.ndarray), 'bounds is not np.ndarray'
        args = np.array(args)
        assert isinstance(args, np.ndarray), 'args is not np.ndarray'
        self.nParticles = nParticles
        self.maxIter = maxIter
        self.func = func
        self.bounds = bounds
        self.args = args 
        self.nVar = bounds.shape[0]
        self.w,self.c1,self.c2 = 0, 0, 0
        self.positions = None
        self.fitness = None
        self.pBest = None
        self.gBest = None
    def _randomPositions(self):
        pass
    def _objectiveFunctionValues(self):
        pass
    def _getGBest(self):
        pass
    def _updateVelocity(self):
        pass
    def _updatePosition(self):
        pass
    def initSwarm(self):
        self.positions = np.zeros((self.nParticles, self.nVar))
        self.velocities = np.zeros((self.nParticles, self.nVar))
        for v in range(self.nVar):
            pMin, pMax = self.bounds[v, 0], self.bounds[v, 1]
            vMin, vMax = (pMin - pMax) / 2 + pMin, (pMax - pMin) / 2 + pMin
            self.positions[:, v] = np.random.uniform(pMin, pMax, (self.popSize))
            self.velocities[:, v] = np.random.uniform(vMin, vMax, (self.popSize))
    def solve(self):
        return self._solve()
    def _solve(self):
        # Initialize 𝑐1, 𝑐2, 𝑤
        self.c1, self.c2, self.w = 0, 0, 0
        # Create the particles positions and velocities randomly
        self.initSwarm()
        # Calculate the objective function values
        self.fitness = np.array([self.getFitness(i) for i in self.swarm])
        # Calculate 𝑃𝑏𝑒𝑠𝑡_𝑖 as the current positions
        self.pBest = np.copy(self.positions)
        # Calculate 𝐺𝑏𝑒𝑠𝑡
        self.gBest = np.argmax(self.fitness)
        # While t < MaxIter or we haven’t found a good solution
        for _ in range(self.maxIter):
            # For each particle 𝑖
            for i in range(self.nParticles):
                # Update the velocity:
                pass
                # 𝑣 𝑖(𝑡 + 1) = 𝑤 𝑣 𝑖 (𝑡) + 𝑐1 𝑟1 ( 𝑃𝑏𝑒𝑠𝑡
                # 𝑖 − 𝑥𝑖 (𝑡)) + 𝑐2 𝑟2 (𝐺𝑏𝑒𝑠𝑡 − 𝑥𝑖 (𝑡))
                # Update the position:
                # 𝑥𝑖 (𝑡 + 1) = 𝑥𝑖 (𝑡) + 𝑣 𝑖 (𝑡 + 1)
                # Calculate 𝑓𝑢𝑛𝑐(𝑥𝑖 )
                # If 𝑓(𝑥𝑖 ) < 𝑓𝑢𝑛𝑐(𝑃𝑏𝑒𝑠𝑡
                # 𝑖 ): update 𝑃𝑏𝑒𝑠𝑡
                # 𝑖
                # If 𝑓(𝑥𝑖 ) < 𝑓𝑢𝑛𝑐(𝐺𝑏𝑒𝑠𝑡): update 𝐺𝑏𝑒𝑠𝑡
            # Decrease 𝑐1, 𝑐2,𝑤
        # return { }
        return 0
def particle_swarm_optimization(nParticles, maxIter, func, bounds, args = ()):
    pS = ParticleSwarmOptimization(nParticles, maxIter, func, bounds, args)
    return pS.solve()