using System;

namespace CalculatorExample
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
			// run the interactive shell
			var shell = new InteractiveShell ();
			shell.Run ();
		}
	}
}
