# Computer Sales

[See the problem description!](https://github.com/LuisR-jpg/School/blob/master/Patrones%20de%20Diseno%20y%20Arquitecturas%20de%20Software/Problemas/VentadeComputadoras/Tarea%201%20Parcial%202.pdf)

## Overview

This huge set of files describe a system that sets, sells and manages custom computers.

The whole problem has been divided into two main parts:
    - Computers
    - Components

Two factory method patterns where used together in order to complete this solution. 

All these classes might seem excessive but this provides a solid base for a scalable project.

Improving the solution to create more computers or more pieces are easy to code and won't imply the implementation of many classes.

## Comments 

### Factory method pattern 

It was used because this creational pattern helps to make different instances of similar objects. 

With this approach, the pattern is perfect to create specific instances of not very complex objects. 

The naming convention for this solution is easy to figure out in comparison to the base pattern. 

The *abstract class* for the PCs is ***Computer***.

The *abstract class* for the pieces is ***Component***.

The *abstract class* for the PCs' creator is ***Manufacture***.

The *abstract class* for the pieces' creator is ***Provider***.

The other classes are self explanatory:
    
    - There are three kinds of *computer* and every one has a class with the same name and **Maker** as suffix.

    - The rest of classes are *components* and all those have their own **Maker** class.

###### The **Maker** classes represent concrete creators, and the ones without the suffix are the ConcreteProducts.