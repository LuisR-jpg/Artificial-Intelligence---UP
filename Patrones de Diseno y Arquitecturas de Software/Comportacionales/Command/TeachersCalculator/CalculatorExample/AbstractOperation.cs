using System;

namespace CalculatorExample
{
	/// <summary>
	/// The abstract operation command class
	/// </summary>
	public abstract class AbstractOperation
	{
		/// <summary>
		/// Execute the operation.
		/// </summary>
		public abstract void Execute();

		/// <summary>
		/// Gets the inverse of the operation.
		/// </summary>
		/// <value>The inverse of the operation.</value>
		public abstract AbstractOperation Inverse { get; }
	}
	
}
