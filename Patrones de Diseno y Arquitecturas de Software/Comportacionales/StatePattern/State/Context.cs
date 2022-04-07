using System;

namespace StatePattern
{
	/// <summary>
	/// The context class.
	/// </summary>
	public class Context
	{
		// the current state
		private State _state;

		/// <summary>
		/// Initializes a new instance of the <see cref="StatePattern.Context"/> class.
		/// </summary>
		/// <param name="state">The initial state to set.</param>
		public Context(State state)
		{
			this.State = state;
		}

		/// <summary>
		/// Gets or sets the current state.
		/// </summary>
		/// <value>The current state.</value>
		public State State
		{
			get { return _state; }
			set
			{
				_state = value;
				Console.WriteLine("State: {0}", _state.GetType().Name);
			}
		}

		/// <summary>
		/// Handle the current state and proceed to the next state. 
		/// </summary>
		public void Request()
		{
			_state.Handle(this);
		}
	}
}
