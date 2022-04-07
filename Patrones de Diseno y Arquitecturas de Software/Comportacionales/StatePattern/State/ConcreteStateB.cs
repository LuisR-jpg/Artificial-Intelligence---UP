using System;

namespace StatePattern
{
	/// <summary>
	/// The concrete state B class.
	/// </summary>
	public class ConcreteStateB : State
	{
		/// <summary>
		/// Handle the current state using the specified context.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public override void Handle(Context context)
		{
			// DEMO: state B proceeds to state A
			context.State = new ConcreteStateA();
		}
	}
}
