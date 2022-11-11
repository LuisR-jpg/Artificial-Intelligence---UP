<h1 align="center" style="font-size:3em">Cheat Sheets</h1>

###### [Back to index](https://github.com/LuisR-jpg/School/tree/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II)

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