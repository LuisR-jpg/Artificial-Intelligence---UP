using System;

namespace BridgePattern
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
			// create a redefined abstraction for concrete implementor A
			Abstraction ab = new RedefinedAbstraction (new ConcreteImplementorA ());

			// perform the high-level operation
			ab.Operation();

			// create a redefined abstraction for concrete implementor B
			ab = new RedefinedAbstraction (new ConcreteImplementorB ());

			// perform the high-level operation
			ab.Operation();
		}
	}
}
