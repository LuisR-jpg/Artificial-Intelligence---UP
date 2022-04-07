using System;

namespace ChartingLibraryExample
{
	/// <summary>
	/// The abstraction abstract base class
	/// </summary>
	public abstract class Shape
	{
		// a reference to the implementor instance
		protected DrawApi _implementor;

		/// <summary>
		/// Initializes a new instance of the <see cref="BridgePattern.Shape"/> class.
		/// </summary>
		/// <param name="implementor">Implementor.</param>
		public Shape (DrawApi implementor)
		{
			_implementor = implementor;
		}

		/// <summary>
		/// Draw the shape.
		/// </summary>
		public abstract void Draw ();
	}
}
