# Mechanism balancing 

## Objective 

Optimize the ***shaking force*** and ***shaking moment*** variables.

The target mechanism has six bars. 15 variables.

## Explanation

###### Based on a tesis. Equations are near the page 162.

Vibrations and undesired movement weares out the mechanisms. This problem tries to be solved with counterweights.

Each counterweight has three variables: x, y and t -> position of the center of mass and its thickness. All those variables have box constraints. Thickness cannot be zero(?)

Tune the objective functions.

- Remember that the shaking force is a vector, so if the components are given; calculate the magnitude.

- Divide the function by the not optimized one, so the expected values should be between 1 and 0.

## To do

- [x] Learn about Multi-objective optimization

    It's an area of optimization where several objective functions are considered, sometimes conflicting. Thus, this technique involves the evaluation of several tradeoffs consisting on optimizing a function while degrading others.

    **[Video](https://www.youtube.com/watch?v=Zchm_W6tFz4&list=WL&index=130)**
    
    Pareto optimality: Occurs when you've got a solution such that you cannot increase the value of one criteria without affecting the other one. That's a dominated solution, aka inferior

    ![Pareto](https://www.tandfonline.com/na101/home/literatum/publisher/tandf/journals/content/oaen20/2018/oaen20.v005.i01/23311916.2018.1502242/20210219/images/medium/oaen_a_1502242_f0003_b.gif)

    **[A review of multi-objective optimization](https://www.tandfonline.com/doi/full/10.1080/23311916.2018.1502242)**

    Scalarization takes multi-objective solutions and turns them into a single one using weights.

    This concept was first introduced by Pareto. 

    In MOO there's no single best solution, but rather several solutions.

    *Methods*

    - Pareto Method

    - Scalarization


- Exploration

  - [x] Use a metaheuristic or evolutionary algorithm and then improve the solution with gradient descent

  - [x] Use a framework to try and solve the problem. [PYMOO](https://pymoo.org/)

  - Math analysis

    - [x] Is there a local minimum or several minima? 

  - [x] Explore other graphs to understand the space.

  - [x] Does PCA work? 
  
    [PCA. Step-by-step](https://www.youtube.com/watch?v=FgakZw6K1QQ)

    - PCA stands for Principal Component Analysis.

    - How it's done using Singular Value Decomposition

      - PCA tries to find the line that best fits the data (as in linear regression). Once it's found, it'll be called principal component 1, which is a linear combination of the variables.
    
      - The unit vector that has the properties of the line PC1 is called eigenvector or singular vector and the eigenvalue is the sum of the maximum squared distances, the singular value of PC1 is the squared root of the eigenvalue.

    - What's the interpretation of results? 

  - [x] MOPSO - Multi-objective Particle Swarm Optimization //Nope, discarded

    What if we apply the idea of this algorithm but the attractors are part of the pareto front?

    It's cool because it takes advantage of the continuous space.

    Questions? 

      - Won't a single point pull the other ones?

      - How are we improving the non-dominated solutions?

  - [x] Try to take off counterweights

  - [ ] (DEPRECATED) Find line to interpolate alpha

  - [x] Update graphical analysis

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

#### New concepts and questions

- Pareto front/frontier/curve

    Is the set of all efficient solutions in multi-optimization. It allows the analyst to make tradeoffs within the set of actual, possible solutions, dismissing attention of not optimal ones.

    ***How is it obtained?***

- Natural coordinates or fully cartesian coordinates

    The Cartesian coordinates of a point in three dimensions are a triplet of numbers (x,y,z). The three numbers, or coordinates, specify the signed distance from the origin along the x, y, and z-axes, respectively.
    
    ***Difference against cartesian coordinates?***

- Firefly algorithm 

    Metaheuristic based on the flashing behavior of fireflies.


### [Thesis](https://scripta.up.edu.mx/bitstream/handle/20.500.12552/6495/Orvananos_Tesis.pdf?sequence=1&isAllowed=y)

### Base [article](https://www.mdpi.com/2227-7390/10/11/1830)

#### Summary

This paper describes the implementation of a six-bar mechanism. 

##### Proposed algorithm

Fully cartesian coordinates with differential evolution has proven to be a suitable solution for a complete balancing of mechanisms.

##### Objective function

`shF` and `shM` must be optimized.

The chosen one for that investigation a linear combination of both, more specifically, a weighted sum: 

$$f(x) = \lambda \beta_{ShM}(X) + (1 - \lambda) \beta_{ShF}(X)$$

##### Results

A time graph of the convergences is shown

Second derivatives were used to know if the boundaries are well set, the results were empirically demonstrated.

### Primer on Multi-Objective Optimization.

#### Source

[Multi-Objective Optimization Using Evolutionary Algorithms:
An Introduction](https://www.egr.msu.edu/~kdeb/papers/k2011003.pdf)

#### New concepts and questions

- Uncertainty

    Often it is assumed that the objective and constraint functions are of a deterministic manner. However, if one or multiple target functions are nondeterministic, this introduces noise or also referred to as uncertainty. One technique to address the underlying randomness is to repeat the evaluation for different random seeds and average the resulting values. Moreover, the standard deviation derived from multiple evaluations can be utilized to determine the performance and the reliability of a specific solution. In general, optimization problems with underlying uncertainty are investigated by the research field called stochastic optimization.

### New knowledge

- The articles that are called survey or review are like a summary.

- Many-objective optimization refers to multi-objective optimization problems (MOO) containing large number of objectives, typically more than four.