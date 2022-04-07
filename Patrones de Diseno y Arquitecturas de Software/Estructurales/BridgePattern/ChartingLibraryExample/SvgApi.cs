using System;

namespace ChartingLibraryExample
{
	/// <summary>
	/// The concrete implementor class for a SVG drawing API.
	/// </summary>
	public class SvgApi : DrawApi
	{
		/// <summary>
		/// Draw a single straight line.
		/// </summary>
		/// <param name="x1">The x coordinate of the line origin.</param>
		/// <param name="y1">The y coordinate of the line origin.</param>
		/// <param name="x2">The x coordinate of the line endpoint.</param>
		/// <param name="y2">The y coordinate of the line endpoint.</param>
		public override void DrawLine(int x1, int y1, int x2, int y2)
		{
			Console.WriteLine (@"<line x1=""{0}"" y1=""{1}"" x2=""{2}"" y2=""{3}"" />", x1, y1, x2, y2);
		}
	}
	
}
