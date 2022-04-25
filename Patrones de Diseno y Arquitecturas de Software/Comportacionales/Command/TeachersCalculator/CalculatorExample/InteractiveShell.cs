using System;

namespace CalculatorExample
{
	/// <summary>
	/// The interactive shell client class.
	/// </summary>
	public class InteractiveShell
	{
		/// <summary>
		/// Run the shell.
		/// </summary>
		public void Run ()
		{
			// instantiate math library
			var mathlib = new MathLib ();

			// instantiate calculator
			var calculator = new Calculator ();

			// show help
			Console.WriteLine ("Please input a math operation:");
			Console.WriteLine ("  + <number>: add number");
			Console.WriteLine ("  - <number>: substract number");
			Console.WriteLine ("  * <number>: multiply number");
			Console.WriteLine ("  / <number>: divide number");
			Console.WriteLine ("  $ <steps>: undo steps");
			Console.WriteLine ("  q: quit");
			Console.WriteLine ();

			// loop until user presses Q
			string input = Console.ReadLine ();
			while (input != "q") 
			{
				// parse input
				if (input.Length >= 2) 
				{
					string op = input.Substring(0, 1);
					int arg = int.Parse(input.Substring(1));

					// handle undo command
					if (op == "$")
					{
						for (int i = 0; i < arg; i++)
						{
							calculator.Undo();
						}
					} else
					{
						// create new command
						AbstractOperation operation = new Operation(mathlib, op, arg);

						// pass it on to the calculator
						calculator.Invoke(operation);
					}
				}
				Console.WriteLine ("Result: {0}", mathlib.Value);
				input = Console.ReadLine ();
			}
		}
	}
}

