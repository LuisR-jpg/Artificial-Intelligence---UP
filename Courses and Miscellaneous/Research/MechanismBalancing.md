# Mechanism balancing 

## Objective 

Optimize the ***shaking force*** and ***shaking moment*** variables.

The target mechanism has six bars.

## To do

- [ ] Learn about Multi-objective optimization

## Resources 

### Already published [article](https://www.mdpi.com/2076-3417/9/19/4115)

#### Summary

This problem is multi-objective since several functions must be optimized.

The goal is to balance a four-bar mechanism

##### Proposed algorithm

Simplified version of Projected Gradient Descent, a deterministic and iterative algorithm based on the gradient vector direction. The optimization problem is multi-objective with bound constraints (also known as box constraints).

##### Objective function

`shF` and `shM` must be optimized.

The chosen one for that investigation a linear combination of both, more specifically, a weighted sum: 

$$f(x) = \lambda \beta_{ShM}(X) + (1 - \lambda) \beta_{ShF}(X)$$

An early stop condition and another one based on iterations are implemented.

The hyper-parameter lambda allows to define priorities in the optimization.

#### New concepts

- Pareto front/frontier/curve

    Is the set of all efficient solutions in multi-optimization. It allows the analyst to make tradeoffs within the set of actual, possible solutions, dismissing attention of not optimal ones.

- Natural coordinates or fully cartesian coordinates

    The Cartesian coordinates of a point in three dimensions are a triplet of numbers (x,y,z). The three numbers, or coordinates, specify the signed distance from the origin along the x, y, and z-axes, respectively.

- Firefly algorithm 

    Metaheuristic based on the flashing behavior of fireflies.


### Base [article](https://www.mdpi.com/2227-7390/10/11/1830)