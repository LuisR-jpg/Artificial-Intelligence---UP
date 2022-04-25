using System;
using System.Collections.Generic;

namespace CalculatorExample
{
	/// <summary>
	/// The calculator invoker class.
	/// </summary>
	public class Calculator
	{
		// the undo command stack
		protected Stack<AbstractOperation> undoStack = new Stack<AbstractOperation>();

		/// <summary>
		/// Invoke the specified operation.
		/// </summary>
		/// <param name="operation">the operation to invoke.</param>
		public void Invoke(AbstractOperation operation)
		{
			operation.Execute();
			undoStack.Push (operation);
		}

		/// <summary>
		/// Undo the last operation.
		/// </summary>
		public void Undo()
		{
			var operation = undoStack.Pop ();
			operation.Inverse.Execute ();
		}
	}
}
