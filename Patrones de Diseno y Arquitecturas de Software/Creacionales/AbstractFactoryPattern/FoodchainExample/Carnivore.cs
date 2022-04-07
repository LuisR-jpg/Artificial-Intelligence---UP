using System;

namespace FoodchainExample
{
	/// <summary>
	/// The abstract product class for carnivores.
	/// </summary>
	abstract class Carnivore
	{
		/// <summary>
		/// Eat a herbivore.
		/// </summary>
		/// <param name="herbivore">The herbivore to eat.</param>
		public abstract void Eat(Herbivore herbivore);
	}
}
