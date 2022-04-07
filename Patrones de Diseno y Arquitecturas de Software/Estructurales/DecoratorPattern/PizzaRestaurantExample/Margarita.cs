using System;

namespace PizzaRestaurantExample
{
	/// <summary>
	/// The concrete component class for a margarita pizza.
	/// </summary>
	public class Margarita : PizzaElement
	{
		/// <summary>
		/// Get the price of the pizza.
		/// </summary>
		/// <returns>The price of the pizza.</returns>
		public override decimal GetPrice()
		{
			return 8m;
		}
	}
	
}
