using System;

namespace StatePattern
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
			// initialise context in state A
			Context c = new Context(new ConcreteStateA());

			// issue requests to toggle between A and B states
			c.Request();
			c.Request();
			c.Request();
			c.Request();		
		}
	}
}

