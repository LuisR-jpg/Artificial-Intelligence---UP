using System;

namespace FastfoodExample
{
	/// <summary>
	/// The concrete builder class for a kids menu.
	/// </summary>
	class KidsMenuBuilder : MenuBuilder
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
			// the kid menu has no dessert
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
			_menu.Add ("Toy");
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
