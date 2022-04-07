using System;

namespace CompositePattern
{
	/// <summary>
	/// The main program class.
	/// </summary>
	class MainClass
	{
		/// <summary>
		/// The entry point of the program, where the program control starts and ends.
		/// </summary>
		/// <param name="args">The command-line arguments.</param>
		public static void Main (string[] args)
		{
			// Create a simple tree structure
			Composite root = new Composite();
			root.AddChild(new Leaf());
			root.AddChild(new Leaf());
			Composite composite = new Composite();
			composite.AddChild(new Leaf());
			composite.AddChild(new Leaf());
			root.AddChild(composite);

			// perform operation on entire tree
			root.DoThis ();
		}
	}
}
