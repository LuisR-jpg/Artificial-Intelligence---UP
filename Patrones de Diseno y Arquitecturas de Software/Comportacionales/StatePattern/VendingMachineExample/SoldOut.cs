using System;

namespace VendingMachineExample
{
	/// <summary>
	/// The sold-out state class.
	/// </summary>
	public class SoldOut : State
	{
		/// <summary>
		/// Handle inserting a coin into the vending machine.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public override void InsertCoin (VendingMachine context)
		{
			Console.ForegroundColor = ConsoleColor.Red;
			Console.WriteLine ("The machine is sold out");
		}

		/// <summary>
		/// Handle ejecting a coin from the vending machine.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public override void EjectCoin (VendingMachine context)
		{
			Console.ForegroundColor = ConsoleColor.Red;
			Console.WriteLine ("The machine is sold out");
		}

		/// <summary>
		/// Handle pushing the button.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public override void PushButton (VendingMachine context)
		{
			Console.ForegroundColor = ConsoleColor.Red;
			Console.WriteLine ("The machine is sold out");
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
