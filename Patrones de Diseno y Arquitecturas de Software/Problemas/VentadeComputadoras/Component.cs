using System;
namespace ComputerSales {
    abstract class Component { 
        protected string manufacturer;
        protected string model;
        public float price;
        public bool isInput;
        public bool isOutput;
        public void information() {
            Console.WriteLine("Component: {0}", this.GetType().Name);
            Console.WriteLine("Manufacturer: {0}", this.manufacturer);
            Console.WriteLine("Model: {0}", this.model);
            Console.WriteLine("Price: {0}", this.price);
            Console.WriteLine("isInput: {0}", this.isInput);
            Console.WriteLine("isOutput: {0}", this.isOutput);
        }
        public float getPrice() {
            return price;
        }
        public abstract void describe();
    }
}