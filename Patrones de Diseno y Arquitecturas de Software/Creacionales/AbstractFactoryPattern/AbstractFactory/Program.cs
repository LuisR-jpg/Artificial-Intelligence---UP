using System;

/// <summary>
/// The Abstract Factory design pattern.
/// </summary>
namespace AbstractFactoryPattern
{
	/// <summary>
	/// The main program class
	/// </summary>
	class MainClass
	{
		public static void Main (string[] args)
		{
			// interact products on platform 1
			AbstractFactory factory1 = new ConcreteFactory1();
			Client client1 = new Client(factory1);
			client1.Interact();

			// interact products on platform 2
			AbstractFactory factory2 = new ConcreteFactory2();
			Client client2 = new Client(factory2);
			client2.Interact();
		}
	}
}


