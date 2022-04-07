using System;

namespace PizzaRestaurantExample
{
	/// <summary>
	/// The concrete component class for a quatro stagioni pizza.
	/// </summary>
	public class QuatroStagioni : PizzaElement
	{
		/// <summary>
		/// Get the price of the pizza.
		/// </summary>
		/// <returns>The price of the pizza.</returns>
		public override decimal GetPrice()
		{
			return 9m;
		}
	}

}
