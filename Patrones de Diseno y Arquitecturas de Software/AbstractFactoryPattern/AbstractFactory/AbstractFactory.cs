using System;

namespace AbstractFactoryPattern
{
	/// <summary>
	/// The abstract factory class.
	/// </summary>
	abstract class AbstractFactory
	{
		public abstract AbstractProductA CreateProductA();
		public abstract AbstractProductB CreateProductB();
	}
}
