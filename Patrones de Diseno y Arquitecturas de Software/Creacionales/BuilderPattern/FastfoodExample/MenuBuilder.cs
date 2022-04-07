using System;

namespace FastfoodExample
{
	/// <summary>
	/// The abstract menu builder class.
	/// </summary>
	abstract class MenuBuilder
	{
		/// <summary>
		/// Build burger or salad.
		/// </summary>
		public abstract void BuildBurgerOrSalad();

		/// <summary>
		/// Build fries.
		/// </summary>
		public abstract void BuildFries();

		/// <summary>
		/// Build dessert.
		/// </summary>
		public abstract void BuildDessert();

		/// <summary>
		/// Build drink.
		/// </summary>
		public abstract void BuildDrink();

		/// <summary>
		/// Build toy.
		/// </summary>
		public abstract void BuildToy();

		/// <summary>
		/// Gets the finished menu.
		/// </summary>
		/// <returns>The finished menu.</returns>
		public abstract Menu GetResult();
	}
}
