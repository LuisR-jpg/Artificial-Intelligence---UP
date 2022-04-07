using System;

namespace FastfoodExample
{
	/// <summary>
	/// The concrete builder class for a salad menu.
	/// </summary>
	class SaladMenuBuilder : MenuBuilder
	{
		// the menu being constructed
		private Menu _menu = new Menu();

		/// <summary>
		/// Build burger or salad.
		/// </summary>
		public override void BuildBurgerOrSalad()
		{
			_menu.Add ("Salad");
		}

		/// <summary>
		/// Build fries.
		/// </summary>
		public override void BuildFries() 
		{
			// the salad menu has no fries
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
			// the salad menu has no toy
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
