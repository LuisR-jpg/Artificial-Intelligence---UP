using System;

namespace ChartingLibraryExample
{
	/// <summary>
	/// The concrete implementor class for an OpenGL drawing API.
	/// </summary>
	public class OpenGLApi : DrawApi
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
			Console.WriteLine (@"glBegin(GL_LINES)");
			Console.WriteLine (@"glVertex2i({0},{1})", x1, y1);
			Console.WriteLine (@"glVertex2i({0},{1})", x2, y2);
			Console.WriteLine (@"glEnd()");
		}
	}
	
}
