using System;

namespace ChartingLibraryExample
{
	/// <summary>
	/// The redefined abstraction class. 
	/// </summary>
	public class Line : Shape
	{
		/// <summary>
		/// Initializes a new instance of the <see cref="BridgePattern.Line"/> class.
		/// </summary>
		/// <param name="implementor">The implementor instance to use.</param>
		public Line (DrawApi implementor)
			: base(implementor)
		{
		}

		/// <summary>
		/// Draw the shape.
		/// </summary>
		public override void Draw()
		{
			_implementor.DrawLine (0, 0, 100, 100);
		}
	}

}
