<h1 align="center" style="font-size:3em">Cheat Sheets</h1>

###### [Back to index](https://github.com/LuisR-jpg/School/tree/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II)

# Metaheuristics

## [Particle swarm optimization](https://github.com/LuisR-jpg/School/blob/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II/Metaheuristics/ParticleSwarm/Particle_Swarm_Optimization.pdf)

</div>
    <div align = "center">
    <img width = "50%" src = "https://github.com/LuisR-jpg/School/blob/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II/data/ParticleSwarmArrowsAnimation.gif?raw=true">
</div>

### Description

Inspired by the movement of a flock when searching for food.

### Types of problems

Continuous multidimensional problem optimization.

### Representation

Each particle represents a solution. And at the time $t$, a particle has a vector of positions and another one for velocities.

$$\vec{x^i(t)} = < x^i_1, x^i_2, ..., x^i_d >$$

$$\vec{v^i(t)} = < v^i_1, v^i_2, ..., v^i_d >$$

### Update

At each iteration, both the positions are updated. 

Considering that $P_{best}^i$ is the best position where a particle i has been, $G_{best}^i$ is the global best location, $r_1$ and $r_2$ are random numbers between 0 and 1, and $w$, $c_1$ and $c_2$ are hyper parameters that can be initiliazed at 0.9 and gradually reduced to 0.1.

$$v^i(t + 1) = wv^i(t) + c_1r_1(P_{best}^i - x^i(t)) + c_2r_2(G_{best}-x^i(t))$$

$$x^i(t+1) = x^i(t) + v^i(t+1)$$

### Pseudocode

<p align = "center">Particle swarm optimization</p>

```
Parameters:
    N -> Number of particles
    maxIter -> Maximum number of iterations
    func -> Objective function
    bounds -> The search space

Return: the best position

Begin 
    Initialize hyperparameters
    Create the particles positions and velocities randomly
    Calculate the objective funcion values
    Calculate the best position of each particle
    Calcule the best position 
    While t < maxIter and a good solution hasn't been found
        For each particle i
            Update velocity
            Update position
            Calculate fitness
            Update best position of current particle
            Update best position
        End for
    End while
End
```