using System;

namespace ToyFactoryExample
{
	/// <summary>
	/// The concrete factory class for creating superman toys.
	/// </summary>
	class SupermanCreator : ToyCreator
	{
		/// <summary>
		/// Concrete factory method to create a new superman toy.
		/// </summary>
		/// <returns>The newly created superman toy.</returns>
		protected override Toy CreateToy()
		{
			return new Superman();
		}
	}
}
