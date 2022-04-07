using System;

namespace PrototypePattern
{
	/// <summary>
	/// The client class.
	/// </summary>
	public class Client
	{
		/// <summary>
		/// Creates a new product from the given prototype.
		/// </summary>
		/// <returns>A new product instance created from the given prototype.</returns>
		/// <param name="prototype">The prototype to create a product from.</param>
		public Prototype CreateProduct(Prototype prototype)
		{
			Prototype product = prototype.Clone();

			// put code here to customise product ...

			return product;
		}
	}
}

