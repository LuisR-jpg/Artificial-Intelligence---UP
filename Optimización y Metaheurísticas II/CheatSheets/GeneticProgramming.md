<h1 align="center" style="font-size:3em">Cheat Sheets</h1>

###### [Back to index](https://github.com/LuisR-jpg/School/tree/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II)

# Evolutionary algorithms

## [Genetic programming](https://github.com/LuisR-jpg/School/blob/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II/Evolutionary%20Computing/Generic%20Programming/6.%20Genetic%20Programming.pdf)


### Description

The original goal was to evolve computational programs using syntax trees to solve a problem given a dataset.

This algorithm could instead be positioned in machine learning.

### Types of problems

Supervised learning problem.

### Representation

The individuals are usually represented as syntax trees.

So, the elements of each individual are:

- Terminals. Leaf nodes in the syntax tree.

- Functions. Internal nodes of a syntax tree, they can be seen as operations.

### Initial population

There are three ways to create the very first population. 

- Full. 

    A set of trees are created with a given depth.

- Grow. 

    Each node randomly selects elements from either the set of Functions or the set of Terminals.

- Half-and-half.

    As its name says, it's a mixture of full and grow.

### Parent selection technique

Tournament selection is the most used for this technique.

### Crossover/Recombination 

The classic crossover consists of randomly selecting a crossover point in each parent and using the subtree of the second parent instead of the first's. 

### Mutation

- Subtree mutation

    Randomly selects a mutation point in a tree and replaces the subtree for a random one.

- Point mutation

    Consists of replacing a function F for another one with the same arity.

</div>
    <div align = "center">
    <img width = "50%" src = "https://github.com/LuisR-jpg/School/blob/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II/data/GeneticProgramming.png?raw=true">
</div>

### Pseudocode

<p align = "center">Genetic programming</p>

```
Parameters:
N -> Population size

Return: Best program

Begin 
    Create an initial population P of programs
    Calculate the fitness of all programs
    Get the best program
    While a termination criterion is not reached
        Parent selection
        Crossover
        Mutation
        Replace the worst one with the one just created
        Get new fitness
        if fitness(new) > fitness(best)
            Update best
        End if
    End while
End
```