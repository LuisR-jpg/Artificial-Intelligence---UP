using System;

namespace FoodchainExample
{
	/// <summary>
	/// The concrete product class for carnivores in Australia.
	/// </summary>
	class Dingo : Carnivore
	{
		/// <summary>
		/// Eat a herbivore.
		/// </summary>
		/// <param name="herbivore">The herbivore to eat.</param>
		public override void Eat (Herbivore herbivore)
		{
			Console.WriteLine ("{0} eats {1}", this.GetType ().Name, herbivore.GetType ().Name);
		}
	}
}
