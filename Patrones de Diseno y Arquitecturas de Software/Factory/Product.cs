using System;

//Interface: Only prototype of class, everything has to be coded later.
//Abstract: Only the methods you choose have to be coded.
namespace FactoryMethodPattern {
    class ConcreteCreator: Creator {
        public abstract Product FactoryMethod();
    }
}