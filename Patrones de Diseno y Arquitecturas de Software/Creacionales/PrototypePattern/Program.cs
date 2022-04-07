using System;

namespace PrototypePattern
{
	/// <summary>
	/// The main application class.
	/// </summary>
	class MainClass
	{
		/// <summary>
		/// The entry point of the program, where the program control starts and ends.
		/// </summary>
		/// <param name="args">The command-line arguments.</param>
		public static void Main (string[] args)
		{
			// create a product using prototype 1
			Client client = new Client ();
			Prototype prototype1 = new ConcretePrototype1();
			Prototype product1 = client.CreateProduct (prototype1);

			// create a product using prototype 2
			Prototype prototype2 = new ConcretePrototype2();
			Prototype product2 = client.CreateProduct (prototype2);
		}
	}
}
