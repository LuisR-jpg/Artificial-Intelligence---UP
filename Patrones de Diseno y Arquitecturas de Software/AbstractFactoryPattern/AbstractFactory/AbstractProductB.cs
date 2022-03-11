using System;

namespace AbstractFactoryPattern
{
	/// <summary>
	/// The abstract product class for product B.
	/// </summary>
	abstract class AbstractProductB
	{
		/// <summary>
		/// Interact with product A.
		/// </summary>
		/// <param name="productA">The product A to interact with.</param>
		public abstract void Interact(AbstractProductA productA);
	}
}
