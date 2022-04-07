using System;

namespace FastfoodExample
{
	/// <summary>
	/// The main program class.
	/// </summary>
	class MainClass
	{
		/// <summary>
		/// The entry point of the program, where the program control starts and ends.
		/// </summary>
		/// <param name="args">The command-line arguments.</param>
		public static void Main (string[] args)
		{
			// create a menu director
			MenuDirector director = new MenuDirector();

			// create burger menu using burger menu builder
			MenuBuilder builder1 = new BurgerMenuBuilder();
			director.Construct(builder1);
			Menu menu1 = builder1.GetResult();
			Console.WriteLine ("Burger menu: {0}", menu1);

			// create kids menu using kids menu builder
			MenuBuilder builder2 = new KidsMenuBuilder();
			director.Construct(builder2);
			Menu menu2 = builder2.GetResult();
			Console.WriteLine ("Kids menu: {0}", menu2);
		}
	}
}
