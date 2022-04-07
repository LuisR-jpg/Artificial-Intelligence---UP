using System;

namespace StatePattern
{
	/// <summary>
	/// The concrete state A class.
	/// </summary>
	public class ConcreteStateA : State
	{
		/// <summary>
		/// Handle the current state using the specified context.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public override void Handle(Context context)
		{
			// DEMO: state A proceeds to state B
			context.State = new ConcreteStateB();
		}
	}
}
