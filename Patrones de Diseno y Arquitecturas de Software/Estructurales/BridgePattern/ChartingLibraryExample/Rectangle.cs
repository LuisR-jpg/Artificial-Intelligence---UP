using System;

namespace ChartingLibraryExample
{
	/// <summary>
	/// The redefined abstraction class. 
	/// </summary>
	public class Rectangle : Shape
	{
		/// <summary>
		/// Initializes a new instance of the <see cref="BridgePattern.Rectangle"/> class.
		/// </summary>
		/// <param name="implementor">The implementor instance to use.</param>
		public Rectangle (DrawApi implementor)
			: base(implementor)
		{
		}

		/// <summary>
		/// Draw the shape.
		/// </summary>
		public override void Draw()
		{
			_implementor.DrawLine (0, 0, 100, 0);
			_implementor.DrawLine (100, 0, 100, 50);
			_implementor.DrawLine (100, 50, 0, 50);
			_implementor.DrawLine (0, 50, 0, 0);
		}
	}

}
