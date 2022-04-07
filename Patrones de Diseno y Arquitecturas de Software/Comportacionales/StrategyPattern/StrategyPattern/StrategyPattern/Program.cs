using System;

namespace StrategyPattern
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
			// run algorithm with strategy A
			var context = new Context(new ConcreteStrategyA());
			context.ContextInterface();

			// run algorithm with strategy B
			context = new Context(new ConcreteStrategyB());
			context.ContextInterface();

			// run algorithm with strategy C
			context = new Context(new ConcreteStrategyC());
			context.ContextInterface();		
		}
	}
}

