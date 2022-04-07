using System;

namespace VendingMachineExample
{
	/// <summary>
	/// The concrete state B class.
	/// </summary>
	public class CoinInserted : State
	{
		/// <summary>
		/// Handle the current state using the specified context.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public override void Handle(VendingMachine context)
		{
			// DEMO: state B proceeds to state A
			context.State = new NoCoin();
		}
	}
}
