using System;

namespace PizzaRestaurantExample
{
	/// <summary>
	/// The concrete component class for a fungi pizza.
	/// </summary>
	public class Fungi : PizzaElement
	{
		/// <summary>
		/// Get the price of the pizza.
		/// </summary>
		/// <returns>The price of the pizza.</returns>
		public override decimal GetPrice()
		{
			return 10m;
		}
	}

}
