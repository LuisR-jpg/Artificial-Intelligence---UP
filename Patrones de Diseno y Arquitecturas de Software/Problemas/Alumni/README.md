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

![Bridge Pattern](https://refactoring.guru/images/patterns/content/bridge/bridge.png?id=bd543d4fb32e11647767301581a5ad54)

#### Bridge

This pattern provides all the structure needed in the solution to make it grow with ease. 

The reason to apply this pattern is because there were two orthogonal classes that changed their behaviour depending on the objects calling them.

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

![Factory Pattern](https://refactoring.guru/images/patterns/content/factory-method/factory-method-en.png)

#### Factory Pattern

There are multiple cases in this application of different objects that resemble each other.

These cases are:

***The users***

###### [See the implementation](https://github.com/LuisR-jpg/School/blob/master/Patrones%20de%20Diseno%20y%20Arquitecturas%20de%20Software/Problemas/Alumni/AlumniApp/InstitutionalUser.cs)

- The **Creator** abstract class is **InstitutionalUserCreator**

- The **Conrete Creators** are:

        StudentCreator
        TeacherCreator
        SupervisorCreator

- The **Product** abstract class is **InstitutionalUser**
    
- The **Contrete Products** are:

        Student
        Teacher
        Supervisor

***Ways to import data***

###### [See the implementation](https://github.com/LuisR-jpg/School/blob/master/Patrones%20de%20Diseno%20y%20Arquitecturas%20de%20Software/Problemas/Alumni/AlumniApp/DataConnection.cs)

This implementation makes sense because the app will have more data sources in the future, so this pattern will be very useful then.

- The **Creator** abstract class is **ConnectionCreator**

- The **Conrete Creators** are:

         JSONConnectionCreator 

- The **Product** abstract class is **Connection**

    
- The **Contrete Products** are:

        JSONConnection

***Ways to export grades***

###### [See the implementation](https://github.com/LuisR-jpg/School/blob/master/Patrones%20de%20Diseno%20y%20Arquitecturas%20de%20Software/Problemas/Alumni/AlumniApp/Export.cs)

- The **Creator** abstract class is **OutputCreator**

- The **Conrete Creators** are:

        PlainCreator
        DocxCreator

- The **Product** abstract class is **Output**

    
- The **Contrete Products** are:

        PlainOutput
        DocxOutput


![Singleton](https://refactoring.guru/images/patterns/content/singleton/singleton-comic-1-en.png)

#### Singleton

The classes related to retrieve and export data through files usually generate problems. So a singleton is implemented for the next classes:

***DataConnection***

###### [See the implementation](https://github.com/LuisR-jpg/School/blob/master/Patrones%20de%20Diseno%20y%20Arquitecturas%20de%20Software/Problemas/Alumni/AlumniApp/DataConnection.cs)

This class helps to manage the access to the classes in charged of retrieving data from the source file and wraps some of the most used queries, so they are not spread in the whole solution code.

***Export***

###### [See the implementation](https://github.com/LuisR-jpg/School/blob/master/Patrones%20de%20Diseno%20y%20Arquitecturas%20de%20Software/Problemas/Alumni/AlumniApp/Export.cs)

It's a singleton in charged of managing the access to the output files and plays the role of the client code of the factory method implemented for the different ways to export grades.


## Play with the configuration!

- Change the **exportTo** key in the [configuration file](https://github.com/LuisR-jpg/School/blob/master/Patrones%20de%20Diseno%20y%20Arquitecturas%20de%20Software/Problemas/Alumni/AlumniApp/App.config) to download your grades in different formats.

- You can add more users appending people into the [sample *json*](https://github.com/LuisR-jpg/School/blob/master/Patrones%20de%20Diseno%20y%20Arquitecturas%20de%20Software/Problemas/Alumni/AlumniApp/gitAllow.json).

    ###### The encrypted [passwords](https://github.com/LuisR-jpg/School/blob/3c8ce80784bff138269193b4832749d84ea98223/Patrones%20de%20Diseno%20y%20Arquitecturas%20de%20Software/Problemas/Alumni/AlumniApp/gitAllow.json#L39) are commented in order to let you try different users!


