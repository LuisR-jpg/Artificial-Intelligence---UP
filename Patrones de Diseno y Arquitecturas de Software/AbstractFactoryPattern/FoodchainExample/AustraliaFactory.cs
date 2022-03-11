using System;

namespace FoodchainExample
{
	/// <summary>
	/// The concrete factory class for Australia.
	/// </summary>
	class AustraliaFactory : ContinentFactory
	{
		public override Herbivore CreateHerbivore()
		{
			return new Kangaroo();
		}
		public override Carnivore CreateCarnivore()
		{
			return new Dingo();
		}
	}
}
