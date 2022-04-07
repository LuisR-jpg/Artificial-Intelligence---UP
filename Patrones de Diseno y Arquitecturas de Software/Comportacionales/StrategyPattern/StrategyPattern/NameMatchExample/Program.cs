using System;

namespace NameMatchExample
{
	/// <summary>
	/// The main program class.
	/// </summary>
	class MainClass
	{
		#region Database and import list

		// the database of names
		private static FullName[] database = new FullName[] {
			new FullName {FirstName = "Barry", LastName = "Allen"},
			new FullName {FirstName = "Harisson", LastName = "Wells"},
			new FullName {FirstName = "Iris", LastName = "West"},
			new FullName {FirstName = "Caitlin", LastName = "Snow"},
			new FullName {FirstName = "Eddie", LastName = "Thawne"},
			new FullName {FirstName = "Cisco", LastName = "Ramon"},
			new FullName {FirstName = "Martin", LastName = "Stein"},
			new FullName {FirstName = "Ronnie", LastName = "Raymond"},
			new FullName {FirstName = "Linda", LastName = "Park"},
			new FullName {FirstName = "Joe", LastName = "West"}
		};

		// the list of names to import
		private static string[] toImport = new string[] {
			"Barry ALLEN", " Joe  west", "H. Wells", "Iris West", "caitlin snow",
			"Ed. Thawne", "C. Ramon", "(Martin) Stein", "ron(nie) raymond", "linda-park"
		};

		#endregion

		/// <summary>
		/// The entry point of the program, where the program control starts and ends.
		/// </summary>
		/// <param name="args">The command-line arguments.</param>
		public static void Main (string[] args)
		{
			// import names using exact match
			var importer = new NameImporter (new ExactComparer ());
			Console.ForegroundColor = ConsoleColor.White;
			Console.WriteLine ("Exact match:");
			importer.Match (database, toImport);

			// import names using fuzzy match
			importer = new NameImporter (new FuzzyComparer ());
			Console.ForegroundColor = ConsoleColor.Green;
			Console.WriteLine ("Fuzzy match:");
			importer.Match (database, toImport);

			// import names using abbreviation match
			importer = new NameImporter (new AbbreviationComparer ());
			Console.ForegroundColor = ConsoleColor.Yellow;
			Console.WriteLine ("Abbreviation match:");
			importer.Match (database, toImport);
		}
	}
}
