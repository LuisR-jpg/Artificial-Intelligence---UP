using System;

namespace ToyFactoryExample
{
	/// <summary>
	/// The concrete factory class for creating firetruck toys.
	/// </summary>
	class FiretruckCreator : ToyCreator
	{
		/// <summary>
		/// Concrete factory method to create a new firetruck toy.
		/// </summary>
		/// <returns>The newly created firetruck toy.</returns>
		protected override Toy CreateToy()
		{
			return new Firetruck();
		}
	}
}
