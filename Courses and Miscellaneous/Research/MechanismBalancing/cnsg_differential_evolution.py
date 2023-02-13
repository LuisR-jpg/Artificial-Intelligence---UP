import numpy as np

def create_population(popsize,bounds):
	M = len(bounds)
	population = np.zeros((popsize,M))
	for m in range(M):
		population[:,m] = np.random.uniform( bounds[m][0], bounds[m][1], (popsize))
	return population

def population_fitness(population,fun,args):
	popsize = len(population)
	fitness = np.zeros((popsize))
	for i,ind in enumerate(population):
		fitness[i] = fun(ind,*args)
	return fitness

def mutation(population,ielite):
	popsize = len(population)
	if np.random.rand()<0.7:
		i1,i2,i3 = np.random.choice( popsize, 3 )
		x1,x2,x3 = population[i1,:],population[i2,:],population[i3,:]
	else:
		i2,i3 = np.random.choice( popsize, 2 )
		x1,x2,x3 = population[ielite,:],population[i2,:],population[i3,:]
	F = np.random.uniform(0.1,2)
	return x1 + F * ( x2 - x3 )

def crossover(vi,xi,CrossoverProb):
	n = len(vi)
	k = np.random.randint(n)
	ui = vi
	for i,v in enumerate(vi):
		if not(np.random.rand() <= CrossoverProb or i==k):
			ui[i] = xi[i]
	return ui

def flip(ui,bounds):
	n = len(ui)
	for j in range(n):
		ui[j] = bounds[j][0] if ui[j] < bounds[j][0] else ui[j]
		ui[j] = bounds[j][1] if ui[j] > bounds[j][1] else ui[j]
	return ui

def cnsg_differential_evolution(fun,bounds,args=(),popsize=15,MaxGenerations=100,CrossoverProb=0.7,early_stopping_generations=10):
	population = create_population(popsize,bounds)
	fitness = population_fitness(population,fun,args)
	ielite = np.argmin(fitness)
	earlystopping_rounds = 0
	for g in range(MaxGenerations):
		for i,xi in enumerate(population):
			vi = mutation(population,ielite)
			ui = crossover(vi,xi,CrossoverProb)
			ui = flip(ui,bounds)
			fitui = fun(ui,*args)

			if fitui<fitness[i]:
				fitness[i] = fitui
				population[i] = ui
				if fitui < fitness[ielite]:
					ielite = i
					earlystopping_rounds = 0

			earlystopping_rounds += 1
		if earlystopping_rounds >= popsize*early_stopping_generations:
			break
	return population[ielite]





