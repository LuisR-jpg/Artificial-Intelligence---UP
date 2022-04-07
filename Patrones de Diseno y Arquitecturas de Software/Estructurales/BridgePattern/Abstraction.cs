using System;

namespace BridgePattern
{
	/// <summary>
	/// The abstraction abstract base class
	/// </summary>
	public abstract class Abstraction
	{
		// a reference to the implementor instance
		protected Implementor _implementor;

		/// <summary>
		/// Initializes a new instance of the <see cref="BridgePattern.Abstraction"/> class.
		/// </summary>
		/// <param name="implementor">The implementor instance to use.</param>
		public Abstraction (Implementor implementor)
		{
			_implementor = implementor;
		}

		/// <summary>
		/// Perform a high-level operation.
		/// </summary>
		public abstract void Operation ();
	}
}
