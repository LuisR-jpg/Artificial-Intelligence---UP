using System;

namespace FoodchainExample
{
	/// <summary>
	/// The concrete factory class for Africa.
	/// </summary>
	class AfricaFactory : ContinentFactory
	{
		public override Herbivore CreateHerbivore()
		{
			return new Zebra();
		}
		public override Carnivore CreateCarnivore()
		{
			return new Lion();
		}
	}
}
