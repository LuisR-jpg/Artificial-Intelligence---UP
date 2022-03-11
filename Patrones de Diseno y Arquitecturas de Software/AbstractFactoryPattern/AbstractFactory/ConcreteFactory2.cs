using System;

namespace AbstractFactoryPattern
{
	/// <summary>
	/// The concrete factory class for platform 2.
	/// </summary>
	class ConcreteFactory2 : AbstractFactory
	{
		public override AbstractProductA CreateProductA()
		{
			return new ProductA2();
		}
		public override AbstractProductB CreateProductB()
		{
			return new ProductB2();
		}
	}
}
