using System;

namespace AbstractFactoryPattern
{
	/// <summary>
	/// The concrete product class for product B on platform 2.
	/// </summary>
	class ProductB2 : AbstractProductB
	{
		/// <summary>
		/// Interact with product A.
		/// </summary>
		/// <param name="productA">The product A to interact with.</param>
		public override void Interact (AbstractProductA productA)
		{
			throw new NotImplementedException ();
		}
	}
}
