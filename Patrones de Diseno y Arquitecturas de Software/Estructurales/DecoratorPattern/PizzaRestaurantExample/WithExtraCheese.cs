using System;

namespace PizzaRestaurantExample
{
	/// <summary>
	/// The concrete decorator class for extra cheese topping.
	/// </summary>
	class WithExtraCheese : PizzaTopping
	{
		/// <summary>
		/// Initializes a new instance of the <see cref="DecoratorPattern.WithExtraCheese"/> class.
		/// </summary>
		/// <param name="component">Component.</param>
		public WithExtraCheese(PizzaElement component)
			: base (component)
		{
		}

		/// <summary>
		/// Get the price of the pizza.
		/// </summary>
		/// <returns>The price of the pizza.</returns>
		public override decimal GetPrice()
		{
			var basePrice = base.GetPrice ();
			return basePrice + 1m;
		}
	}
	
}
