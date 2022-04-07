using System;

namespace PizzaRestaurantExample
{
	/// <summary>
	/// The component abstract base class that defines a pizza element.
	/// </summary>
	public abstract class PizzaElement
	{
		/// <summary>
		/// Get the price of the pizza.
		/// </summary>
		/// <returns>The price of the pizza.</returns>
		public abstract decimal GetPrice();
	}
	
}
