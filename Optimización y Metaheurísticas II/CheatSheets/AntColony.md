<h1 align="center" style="font-size:3em">Cheat Sheets</h1>

###### [Back to index](https://github.com/LuisR-jpg/School/tree/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II)

# Metaheuristics

## Ant Colony Optimization

<div align = "center">
    <img width = "50%" src = "https://github.com/LuisR-jpg/School/blob/master/Optimizaci%C3%B3n%20y%20Metaheur%C3%ADsticas%20II/data/AntColonyOptimization.gif?raw=true">
</div>

### Description
Bio-inspired metaheuristic. It is inspired on the ants' behavior, where an ant guides the others when they find something good.

### Types of problems
Intended to solve problems related to graphs. i.e. Useful to find paths.

### Representation
For this problem, some terms are defined. 

- $C_{ij}$: Path from the node i to the j

- $\tau_{ij}$: Pheromones in the path from the node i to the node j

- $\eta_{ij}$: Heuristic in the path from the node i to node j

- $\rho$: Evaporation, $[0, 1]$

### Movement

- Each ant moves around the graph following the criteria:

$$P(C_{ik})=\frac{\tau_{ik}^{\alpha} * \eta_{ik}^{\beta}}{\varSigma_{\epsilon N_{i}}\tau_{ij}^{\alpha}*\eta_{ij}^{\beta}}$$

###### Note. To optimize distance $\eta_{ik}=\frac{1}{d_{ik}}$ is proposed where $d_{ik}$ is the length of the component $C_{ik}$.

### Update

After all the ants traverse the graph, the pheromones:

Are updated

$$\Delta\tau_{ij}^{\alpha} =
\begin{cases}
    \frac{1}{L_\alpha} & Used\\
    0 & Otherwise
\end{cases}
$$

And evaporate

$$\tau_{ij}=(1 - \rho)*\tau_{ij}$$

### Pseudocode

<p align = "center">Ant colony</p>

```
At the beginning
    Pheromones <- small value

Move the ants one by one
    Ants: move around the graph

When all the ants record the graph
    Pheromones: are updated
    Ants: deposit pheromones
    Pheromones: evaporate 
```

