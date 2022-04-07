using System;

namespace VendingMachineExample
{
	/// <summary>
	/// The no-coin state class.
	/// </summary>
	public class NoCoin : State
	{
		/// <summary>
		/// Handle inserting a coin into the vending machine.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public override void InsertCoin (VendingMachine context)
		{
			if (context.Products > 0)
			{
				context.State = new CoinInserted ();
				Console.ForegroundColor = ConsoleColor.Green;
				Console.WriteLine ("Coin accepted");
			} else
			{
                context.State = new SoldOut();
                Console.ForegroundColor = ConsoleColor.Red;
				Console.WriteLine ("Sold out");
			}
		}

		/// <summary>
		/// Handle ejecting a coin from the vending machine.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public override void EjectCoin (VendingMachine context)
		{
			Console.ForegroundColor = ConsoleColor.Red;
			Console.WriteLine ("Cannot eject coin because no coin was inserted");
		}

		/// <summary>
		/// Handle pushing the button.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public override void PushButton (VendingMachine context)
		{
			Console.ForegroundColor = ConsoleColor.Red;
			Console.WriteLine ("Pushing the button does nothing because no coin was inserted");
		}

		/// <summary>
		/// Handle dispensing the chocolate.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public override void DispenseChocolate (VendingMachine context)
		{
			// silent because PushButton already alerts the user
		}
	}
}
