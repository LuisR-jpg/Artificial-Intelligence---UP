using System;

namespace VendingMachineExample
{
	/// <summary>
	/// The abstract state class.
	/// </summary>
	public abstract class State
	{
		/// <summary>
		/// Handle inserting a coin into the vending machine.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public abstract void InsertCoin(VendingMachine context);

		/// <summary>
		/// Handle ejecting a coin from the vending machine.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public abstract void EjectCoin(VendingMachine context);

		/// <summary>
		/// Handle pushing the button.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public abstract void PushButton(VendingMachine context);

		/// <summary>
		/// Handle dispensing the chocolate.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public abstract void DispenseChocolate(VendingMachine context);
	}
}
