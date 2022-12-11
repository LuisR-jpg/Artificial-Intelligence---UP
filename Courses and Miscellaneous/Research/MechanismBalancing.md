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

##### Proposed algorithm

Simplified version of Projected Gradient Descent, a deterministic and iterative algorithm based on the gradient vector direction. The optimization problem is multi-objective with bound constraints (also known as box constraints).

##### Objective function

`shF` and `shM` must be optimized.

The chosen one for that investigation a linear combination of both, more specifically, a weighted sum: 

$$f(x) = \lambda \beta_{ShM}(X) + (1 - \lambda) \beta_{ShF}(X)$$


#### Terms to investigate

- Pareto front

- Natural coordinates or fully cartesian coordinates

- Firefly algorithm (is it differential evolution?)


### Base [article](https://www.mdpi.com/2227-7390/10/11/1830)