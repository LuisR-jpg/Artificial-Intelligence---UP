using System;

namespace ToyFactoryExample
{
	/// <summary>
	/// The concrete factory class for creating duck toys.
	/// </summary>
	class DuckCreator : ToyCreator
	{
		/// <summary>
		/// Concrete factory method to create a new duck toy.
		/// </summary>
		/// <returns>The newly created duck toy.</returns>
		protected override Toy CreateToy()
		{
			return new Duck();
		}
	}
}
