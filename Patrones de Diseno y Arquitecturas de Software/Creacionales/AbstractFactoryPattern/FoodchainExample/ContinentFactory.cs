using System;

namespace FoodchainExample
{
	/// <summary>
	/// The abstract factory class.
	/// </summary>
	abstract class ContinentFactory
	{
		public abstract Carnivore CreateCarnivore();
		public abstract Herbivore CreateHerbivore();
	}
}
