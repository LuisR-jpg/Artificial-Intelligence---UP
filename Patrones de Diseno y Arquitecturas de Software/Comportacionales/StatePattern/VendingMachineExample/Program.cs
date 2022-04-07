using System;

namespace VendingMachineExample
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
			// set up vending machine
			var machine = new VendingMachine ();

			// show instructions
			Console.WriteLine ("Vending machine commands");
			Console.WriteLine ("1: Insert coin");
			Console.WriteLine ("2: Eject coin");
			Console.WriteLine ("3: Push button");
			Console.WriteLine ("4: Quit");

			while (true)
			{
				// get command
				Console.ForegroundColor = ConsoleColor.White;
				Console.Write ("Enter command: ");
				string command = Console.ReadLine ();

				// quit if requested
				if (command == "4")
					break;

				// process vending machine command
				switch (command)
				{
				case "1":
					machine.InsertCoin ();
					break;
				case "2":
					machine.EjectCoin ();
					break;
				case "3":
					machine.PushButton ();
					break;
				}
			}
		}
	}
}
