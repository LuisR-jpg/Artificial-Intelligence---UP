<h1 align="center" style="font-size:3em">Cheat Sheets</h1>

# Evolutionary algorithms

## [Genetic algorithms](https://github.com/LuisR-jpg/School/blob/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II/Evolutionary%20Computing/Genetic%20Algorithms/2.%20Genetic%20Algorithms.pdf)

### Description

Probably the most famous algorithm of its kind.

The inspiration comes from the DNA structures. 
Where there's a population with chromosomes and each one consists of genes. 

### Types of problems

This algorithm can be used for *constrained* or *unconstrained* problems that are not usually suitable for standard optimization algorithms.

Some of the problems are:

- Traveling salesman problem.

    <div align = "center">
        <img width = "50%" src = "https://raw.githubusercontent.com/LuisR-jpg/School/ace1251133c78f82a528922269753d4ef6a8190e/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II/data/TSP.jpg">
    </div>

- 8 queens problem.

    <div align = "center">
        <img width = "50%" src = "https://raw.githubusercontent.com/LuisR-jpg/School/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II/data/Solutions8Queens.webp">
    </div>

### Representation

There are several alternatives:

- Binary representation.
    
    It's the original approach; the implementation is an array of bools.

- Integer representation.
    
    Integer array.

- Real representation.

    Array $x$ where each $x_i$ is a real number.

### Parent selection technique

- Roulette/Proportional selection

    We can think of a roulette that has one slice per chromosome of the population. The size of the slice varies depending on the fitnesses; the better it is, the wider its corresponding slice is. 

- Tournament selection

    Consists of choosing k random elements and selecting the fittest one.

### Crossover/Recombination 

The goal is to generate an offspring combining the parents' properties. There are different approaches depending on the representation.

#### Binary and integer representation

- 1 point crossover.

    Consists of choosing a random pivot point and the new individual will be generated with the left side of the first parent and the right side of the second.

- N points crossover.

    Same idea as 1 point crossover but several sections are used.

- Uniform crossover. 

    The new individual is created element by element, randomly picking values from one parent or the other.

#### Real valued representation

- Discrete reproduction.

    Same as uniform crossover. 

- Asymmetric reproduction.

    The offspring is generated with a weighted sum. 
    $$o_i = \alpha p_1 + (1 - \alpha) p_2$$
    Where $\alpha$ is a value between 0 and 1. 

### Mutation

The goal is to modify individuals in order to explore the search space. Some of the most used techniques are:

- Bitwise mutation.
    
    Consists of choosing 1 or more genes and changing their values.

- Random resetting. 

    Consists of randomly choosing 1 or more genes and reset their values.

- Uniform mutation.

    Consists of randomly choosing 1 or more genes and replace their values by a number within the constraints.

- Swap mutation.

    Used for the permutation representation and consists of selecting two genes and swapping their values.

### Pseudocode

<p align = "center">Genetic algorithm</p>

```
Parameters: 
    N -> Population size
    G -> Maximum number of generations
    Pr -> Reproduction probability
    Pm -> Mutation probability
Return: The elite individual

Begin 
    Create the initial population
    Calculate the population fitness
    Get the elite
    While the number of generations is less than G or a good solution hasn't been found
        Select the parents
        Apply crossover
        Apply mutation
        Calculate the population fitness
        Get the elite or include the elite in the population
    End while
End
```

## [Evolution strategies](https://github.com/LuisR-jpg/School/blob/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II/Evolutionary%20Computing/Evolution%20Strategies/EvolutionStrategies.pdf)

### Description

The main characteristis of this algorithms is the *self-adaptation* of parameters, since they evolve with the individual itself.

### Types of problems

It's designed to solve continuous multidimensional optimization problems.

### Representation

The individual's solution is represented with a vector of $d$ real values where $d$ is the number of features to optimize. In addition to the values, a *mutation step size* is used to guide the change of each individual's mutation. 

- If all the variables to be calculated are in the same range, a single step size can be used.

$$<\vec{x_i}, \sigma_1>$$

- Otherwise, a size per featue is recommended.

$$<\vec{x_i}, \vec{\sigma_1}>$$

### Parent selection technique

Completely random, this is because the whole population is seen as parent.

### Crossover/Recombination 

Two variants are used: 

- Intermediate recombination 

    $$\frac{\vec{p_1} + \vec{p_2}}{2}$$

- Discrete recombination

    $$RandomSelection \quad [\vec{p_1}_i, \vec{p_2}_i]$$


### Mutation

The mutation of the features consist of adding a random value based on a normal distribution zero-centered with a standard deviation equals to the corresponding $\sigma$.

$$x_i' = x_i + N(0, \sigma_1)$$

On the other hand, updating the step size depends of the chosen representation.

- With one step size

    $$\sigma' = \sigma e^{N(0, \tau)}$$

    Where $\tau = \frac{1}{\sqrt{n}}$ and $n$ is the population size.

- With $d$ step sizes

    $$\sigma' = \sigma e^{N(0, \tau_1)+N(0, \tau_2)}$$

    Where $\tau_1 = \frac{1}{\sqrt{n}}$, $\tau_2 = \frac{1}{\sqrt{2\sqrt{n}}}$ and $n$ is the population size.

Also, see the **1/5 sucess rule**.

### Survivor selection

After creating the offspring $\lambda$ and calculating their fitness, the best $\mu$ are deterministically chosen. There are two approaches.

- $(\mu, \lambda)$ selection: The best $\mu$ individuals are selected out of the offspring.

- $(\mu + \lambda)$ selection: Where the $\mu$ individuals are selected out of the union of parents and offspring.

### Pseudocode

<p align = "center">Evolution strategies</p>

```
Parameters:
    N -> Population size
    λ -> Offspring size
    G -> Maximum number of generations

Return: The elite individual

Begin 
    Create the initial population
    Calculate the population fitness
    Get the elite
    While the number of generations is less than G or a good solution hasn't been found
        Recombination
        Mutation
        Calculate the population fitness
        Survivor selection (the best individuals)
        Get the elite or include the elite in the population
    End while
End
```

## [Evolutionary programming](https://github.com/LuisR-jpg/School/blob/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II/Evolutionary%20Computing/Evolutionary%20Programming/0.%20Optimizaci%C3%B3n.pdf)

### Description

The solutions represent species instead of individuals.

### Types of problems

It has evolved to solve continuous multidimensional optimization problems.

### Representation

The individual's solution is represented with a vector of $d$ real values where $d$ is the number of features to optimize. In addition to the values, a *mutation step size* is used to guide the change of each individual's mutation. 

$$<\vec{x_i}, \vec{\sigma_1}>$$

### Mutation

Each value is mutated with a random number based on its step size. 

Step size is later updated as well.

$$\sigma_i' = \sigma_i (1 + N(0, \alpha))$$

$$x_i' = x_i + N(0, \sigma_i')$$

$$\alpha \approx 0.2$$

### Survivor selection

$(\mu + \lambda)$ selection: Where the best $\mu$ individuals are selected out of the union of parents and offspring.

### Pseudocode

<p align = "center">Evolutionary programming</p>

```
Parameters:
    μ -> Population size
    G -> Maximum number of generations

Return: the elite individual

Begin 
    Create the initial population
    Calculate the population fitness
    Get the elite
    While the number of generations is less than G or a good solution hasn't beed found
        Mutation of all the species
        Calculate the population fitness
        Survivor selection
        Get the elite or include the elite in the population
    End while
End
```

## [Differential evolution](https://github.com/LuisR-jpg/School/blob/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II/Evolutionary%20Computing/Differential%20Evolution/DifferentialEvolution.pdf)

### Description

This a robust algorithm and introduces the idea of mutating individuals based on 3 others, in order to work as a gravitational force into the minimums.

### Types of problems

This algorithm solves continuous multidimensional optimization problems.

### Representation

A vector of real values.

$$x^i = <x_1^i, x_2^i,...,x_d^i>$$

### Mutation

This is the main operation of differential evolution.

For each individual $x^i$, another one called $v^i$ is generated by performing the following operation.

$$v^i = x^{r1} + (x^{r2} - x^{r3})F$$

$$0 \leq F \leq 2$$

### Crossover/Recombination 

A new individual is created element by element, randomly picking values from the original one $x^i$ or the mutated one $v^i$.

This is performed based on a Crossover probability $0 \leq Cr \leq 1$.

$$u^i_k = v^i_k \quad if \quad rand(0, 1) \leq Cr \quad else \quad x^i_k$$

### Survivor selection

Tournament is used: The best individual between $u^i$ and $x^i$ is selected to be part of the next generation.

### Pseudocode

<p align = "center">Differential evolution</p>

```
Parameters: 
    N -> Population size
    G -> Maximum number of generations
    Cr -> Crossover probability

Return: the best individual

Begin 
    Create the initial population of N individuals
    Calculate the population fitness
    While the number of generations is less than G or a good solution hasn't been found
        For each individual in the population.
            Mutation -> Create new individual
            Crossover -> Combine the individuals
            Calculate the fitness of the new one
            Selection -> Select the best between both
        End for
    End while
End
```

## [Genetic programming](https://github.com/LuisR-jpg/School/blob/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II/Evolutionary%20Computing/Generic%20Programming/6.%20Genetic%20Programming.pdf)

### Description

### Types of problems

### Representation

### Parent selection technique

### Crossover/Recombination 

### Mutation

### Survivor selection

### Pseudocode

<p align = "center">Genetic programming</p>

```
```

# Metaheuristics

## [Particle swarm optimization](https://github.com/LuisR-jpg/School/blob/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II/Metaheuristics/ParticleSwarm/Particle_Swarm_Optimization.pdf)

### Description

### Types of problems

### Representation

### Parent selection technique

### Crossover/Recombination 

### Mutation

### Survivor selection

### Pseudocode

<p align = "center">Particle swarm optimization</p>

```
```

## Ant colony

### Description

### Types of problems

### Representation

### Parent selection technique

### Crossover/Recombination 

### Mutation

### Survivor selection

### Pseudocode

<p align = "center">Ant colony</p>

```
```