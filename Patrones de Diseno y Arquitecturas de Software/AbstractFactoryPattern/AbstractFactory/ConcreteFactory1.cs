using System;

namespace AbstractFactoryPattern
{
	/// <summary>
	/// The concrete factory class for platform 1.
	/// </summary>
	class ConcreteFactory1 : AbstractFactory
	{
		public override AbstractProductA CreateProductA()
		{
			return new ProductA1();
		}
		public override AbstractProductB CreateProductB()
		{
			return new ProductB1();
		}
	}
}
