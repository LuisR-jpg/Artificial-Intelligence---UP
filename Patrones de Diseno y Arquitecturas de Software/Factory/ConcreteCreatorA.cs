using System;
namespace FactoryMethodPattern {
    class ConcreteCreatorA: Creator {
        public override Product FactoryMethod() {
            return new ConcreteProductA();
        }
    }
}