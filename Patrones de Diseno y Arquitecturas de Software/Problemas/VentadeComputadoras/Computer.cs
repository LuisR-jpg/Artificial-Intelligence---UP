using System;
using System.Collections.Generic;

namespace ComputerSales {
    abstract class Computer {
        protected List<Component> _components = new List<Component>();
        private float totalPrice;
        public Computer init() {
            this.setCentralUnit();
            this.setMinSpecs();
            if(this.validate()) return this;
            return null;
        }
        public void setCentralUnit() {
            Provider cuMaker = new CentralUnitMaker();
            Component centralUnit = cuMaker.build();
            _components.Add(centralUnit);
        }
        public float getPrice() {
            if(totalPrice == 0)
                foreach(Component component in _components)
                    totalPrice += component.getPrice();
            return totalPrice;
        }
        public bool validate() {
            bool hasCU = false;
            bool hasInput = false;
            bool hasOutput = false;
            foreach(Component component in _components) {
                if(component.GetType().Name == "CentralUnit") 
                    hasCU = true;
                if(component.isInput) 
                    hasInput = true;
                if(component.isOutput)
                    hasOutput = true;
            }
            return hasCU && hasInput && hasOutput;
        }
        public void describe(){
            Console.WriteLine("\n\nComputer: {0}", this.GetType().Name);
            for(int i = 0; i < _components.Count; i++){
                Console.WriteLine("\n----- Componente {0} -----", i);
                _components[i].describe();
            }
            Console.WriteLine("\nTotal Cost: ${0}", this.getPrice());
        }
        public abstract void setMinSpecs();
    }
}