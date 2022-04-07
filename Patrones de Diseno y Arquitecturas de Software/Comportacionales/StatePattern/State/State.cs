using System;

namespace StatePattern
{
	/// <summary>
	/// The abstract state class.
	/// </summary>
	public abstract class State
	{
		/// <summary>
		/// Handle the current state using the specified context.
		/// </summary>
		/// <param name="context">The context to use.</param>
		public abstract void Handle(Context context);
	}
}
