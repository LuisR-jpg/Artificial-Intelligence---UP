using System;

namespace BuilderPattern
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
			// create director and builders
			Director director = new Director();

			Builder b1 = new ConcreteBuilder1();
			Builder b2 = new ConcreteBuilder2();

			// create product using builder 1
			director.Construct(b1);
			Product p1 = b1.GetResult();

			// create product using builder 1
			director.Construct(b2);
			Product p2 = b2.GetResult();

			Console.Read();
		}
	}
}
