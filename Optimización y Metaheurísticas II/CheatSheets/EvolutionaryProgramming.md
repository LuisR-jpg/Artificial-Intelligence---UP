<h1 align="center" style="font-size:3em">Cheat Sheets</h1>

###### [Back to index](https://github.com/LuisR-jpg/School/tree/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II)

# Evolutionary algorithms

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

Step size is eventually updated as well.

$$\sigma_i' = \sigma_i (1 + N(0, \alpha))$$

$$x_i' = x_i + N(0, \sigma_i')$$

$$\alpha \approx 0.2$$

</div>
    <div align = "center">
    <img width = "50%" src = "https://github.com/LuisR-jpg/School/blob/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II/data/standard-normal-distribution.png?raw=true">
</div>

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