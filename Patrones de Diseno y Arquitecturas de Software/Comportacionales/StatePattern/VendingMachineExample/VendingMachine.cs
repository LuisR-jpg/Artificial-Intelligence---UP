using System;

namespace VendingMachineExample
{
	/// <summary>
	/// The vending machine class (the context).
	/// </summary>
	public class VendingMachine
	{
		// the current state
		private State _state;

		// the number of stocked products
		private int _products = 5;

		/// <summary>
		/// Initializes a new instance of the <see cref="StatePattern.Context"/> class.
		/// </summary>
		public VendingMachine()
		{
			this.State = new NoCoin ();
		}

		/// <summary>
		/// Gets or sets the current state.
		/// </summary>
		/// <value>The current state.</value>
		public State State
		{
			get { return _state; }
			set { _state = value; }
		}

		/// <summary>
		/// Gets or sets the number of remaining products.
		/// </summary>
		/// <value>The number of remaining products.</value>
		public int Products
		{
			get { return _products; }
			set { _products = value; }
		}

		/// <summary>
		/// Handle inserting a coin into the vending machine.
		/// </summary>
		public void InsertCoin ()
		{
			_state.InsertCoin (this);
		}

		/// <summary>
		/// Handle ejecting a coin from the vending machine.
		/// </summary>
		public void EjectCoin ()
		{
			_state.EjectCoin (this);
		}

		/// <summary>
		/// Handle pushing the button.
		/// </summary>
		public void PushButton ()
		{
			// note that this method advances the state twice
			_state.PushButton (this);
			_state.DispenseChocolate (this);
		}
	}
}
