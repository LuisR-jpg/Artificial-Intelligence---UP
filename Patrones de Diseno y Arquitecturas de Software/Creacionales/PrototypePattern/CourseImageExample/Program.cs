using System;

namespace CourseImageExample
{
	/// <summary>
	/// The main application class.
	/// </summary>
	class MainClass
	{
		/// <summary>
		/// The entry point of the program, where the program control starts and ends.
		/// </summary>
		/// <param name="args">The command-line arguments.</param>
		public static void Main (string[] args)
		{
			// set up prototype object
			CourseImage prototype = new CourseImage ();
			prototype.Initialise ();

			// create image of laptop with blueprint
			CourseImageMaker maker = new CourseImageMaker ();
			CourseImage blueprint = maker.CreateImage (prototype, "course_image_1.png");
			blueprint.Save ("blueprint.png");

			// create image of laptop with threads
			CourseImage threads = maker.CreateImage (prototype, "course_image_2.png");
			threads.Save ("threads.png");

			// create image of laptop with memory cards
			CourseImage memory = maker.CreateImage (prototype, "course_image_3.png");
			memory.Save ("memory.png");
		}
	}
}
