# Alumni App

###### [See the problem description!](https://github.com/LuisR-jpg/School/blob/master/Patrones%20de%20Diseno%20y%20Arquitecturas%20de%20Software/Problemas/Alumni/Alumni.pdf)

## Features

Check out some cool features.

- Encrypted passwords.

- Exception handling of potential errors during the execution.

- Ease to increase the functionality.

- Auto-generated [documentation](https://github.com/LuisR-jpg/School/blob/master/Patrones%20de%20Diseno%20y%20Arquitecturas%20de%20Software/Problemas/Alumni/AlumniApp/AlumniApp.xml) in XML.

## Design patterns

    Design patterns provided great solutions for complex problems in this project. 

The ones implemented are:

### Structural Design Patterns

#### Bridge

![Bridge Pattern](https://refactoring.guru/images/patterns/content/bridge/bridge.png?id=bd543d4fb32e11647767301581a5ad54)

There were two orthogonal classes that changed their behaviour depending on the objects calling them.

    It was necessary to find a pattern able to pair all the users with their specific interfaces because every single user has different data and possible actions.

The classes involved in this pattern are:

***Users***

###### [See the implementation](https://github.com/LuisR-jpg/School/blob/master/Patrones%20de%20Diseno%20y%20Arquitecturas%20de%20Software/Problemas/Alumni/AlumniApp/InstitutionalUser.cs)

**InstitutionalUser** plays the role of the abstract class **Implementation**.

The different **users** are the **concrete Implementation**:

> Student

> Teacher

> Supervisor

***Interfaces***

###### [See the implementation](https://github.com/LuisR-jpg/School/blob/master/Patrones%20de%20Diseno%20y%20Arquitecturas%20de%20Software/Problemas/Alumni/AlumniApp/GraphicalInterface.cs)

**GraphicalInterface** plays the role of **abstraction** in this pattern.

Its methods instantiate the following pages:

> Log In

> Options menu

> Information

> Grades (student and teacher)




### Creational Design Patterns


## Play with the configuration!

- Change the **exportTo** key in the [configuration file](https://github.com/LuisR-jpg/School/blob/master/Patrones%20de%20Diseno%20y%20Arquitecturas%20de%20Software/Problemas/Alumni/AlumniApp/App.config) to download your grades in different formats.

- You can add more users appending people into the [sample *json*](https://github.com/LuisR-jpg/School/blob/master/Patrones%20de%20Diseno%20y%20Arquitecturas%20de%20Software/Problemas/Alumni/AlumniApp/gitAllow.json).

    ###### The encrypted [passwords](https://github.com/LuisR-jpg/School/blob/3c8ce80784bff138269193b4832749d84ea98223/Patrones%20de%20Diseno%20y%20Arquitecturas%20de%20Software/Problemas/Alumni/AlumniApp/gitAllow.json#L39) are commented in order to let you try different users!


