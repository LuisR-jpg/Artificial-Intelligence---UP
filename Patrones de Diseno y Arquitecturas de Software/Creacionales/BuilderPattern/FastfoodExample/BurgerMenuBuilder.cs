using System;

namespace FastfoodExample
{
	/// <summary>
	/// The concrete builder class for a burger menu.
	/// </summary>
	class BurgerMenuBuilder : MenuBuilder
	{
		// the menu being constructed
		private Menu _menu = new Menu();

		/// <summary>
		/// Build burger or salad.
		/// </summary>
		public override void BuildBurgerOrSalad()
		{
			_menu.Add ("Burger");
		}

		/// <summary>
		/// Build fries.
		/// </summary>
		public override void BuildFries() 
		{
			_menu.Add ("Fries");
		}

		/// <summary>
		/// Build dessert.
		/// </summary>
		public override void BuildDessert()
		{
			_menu.Add ("Dessert");
		}

		/// <summary>
		/// Build drink.
		/// </summary>
		public override void BuildDrink()
		{
			_menu.Add ("Drink");
		}

		/// <summary>
		/// Build toy.
		/// </summary>
		public override void BuildToy()
		{
			// the burger menu has no toy
		}

		/// <summary>
		/// Gets the finished menu.
		/// </summary>
		/// <returns>The finished menu.</returns>
		public override Menu GetResult()
		{
			return _menu;
		}
	}
}
