using System;

namespace AbstractFactoryPattern
{
	/// <summary>
	/// The client class.
	/// </summary>
	class Client
	{
		// products
		private AbstractProductA _abstractProductA;
		private AbstractProductB _abstractProductB;

		/// <summary>
		/// Initializes a new instance of the <see cref="AbstractFactoryPattern.Client"/> class.
		/// </summary>
		/// <param name="factory">The factory to use to create products.</param>
		public Client(AbstractFactory factory)
		{
			_abstractProductA = factory.CreateProductA();
			_abstractProductB = factory.CreateProductB();
		}

		/// <summary>
		/// Interact the products.
		/// </summary>
		public void Interact()
		{
			_abstractProductB.Interact(_abstractProductA);
		}
	}
}
