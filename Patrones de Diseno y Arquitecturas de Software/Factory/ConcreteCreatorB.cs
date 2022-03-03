using System;
namespace FactoryMethodPattern {
    class ConcreteCreatorB: Creator {
        public override Product FactoryMethod() {
            return new ConcreteProductB();
        }
    }
}