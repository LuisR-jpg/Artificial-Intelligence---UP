using System;

namespace VendingMachineExample
{
	/// <summary>
	/// The sold state class.
	/// </summary>
	public class Sold : State
	{
		/// <summary>
		/// Handle inserting a coin into the vending machine.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public override void InsertCoin (VendingMachine context)
		{
			Console.ForegroundColor = ConsoleColor.Red;
			Console.WriteLine ("You cannot insert a coin while the machine is dispensing");
		}

		/// <summary>
		/// Handle ejecting a coin from the vending machine.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public override void EjectCoin (VendingMachine context)
		{
			Console.ForegroundColor = ConsoleColor.Red;
			Console.WriteLine ("You cannot eject a coin while the machine is dispensing");
		}

		/// <summary>
		/// Handle pushing the button.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public override void PushButton (VendingMachine context)
		{
			Console.ForegroundColor = ConsoleColor.Red;
			Console.WriteLine ("You cannot press the button a second time");
		}

		/// <summary>
		/// Handle dispensing the chocolate.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public override void DispenseChocolate (VendingMachine context)
		{
			// go to no-coin or sold-out depending on if there are remaining products
			context.Products--;
			if (context.Products > 0)
				context.State = new NoCoin ();
			else
				context.State = new SoldOut ();

			Console.ForegroundColor = ConsoleColor.Green;
			Console.WriteLine ("Chocolate bar dispensed");
		}
	}
}
