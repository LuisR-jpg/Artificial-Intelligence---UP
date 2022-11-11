<h1 align="center" style="font-size:3em">Cheat Sheets</h1>

###### [Back to index](https://github.com/LuisR-jpg/School/tree/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II)

# Evolutionary algorithms

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