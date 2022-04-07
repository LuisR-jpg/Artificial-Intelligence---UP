using System;

namespace ChartingLibraryExample
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			// draw a line
			Console.WriteLine ("Line drawn using OpenGL commands:");
			Shape line = new Line (new OpenGLApi ());
			line.Draw ();
			Console.WriteLine ();

			// draw a rectangle
			Console.WriteLine ("Rectangle drawn using SVG commands:");
			Shape rectangle = new Rectangle (new SvgApi ());
			rectangle.Draw ();
			Console.WriteLine ();
		}
	}
}
