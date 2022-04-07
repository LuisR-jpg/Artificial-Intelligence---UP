using System;
using System.Text.RegularExpressions;

namespace NameMatchExample
{
	/// <summary>
	/// The fuzzy comparer class (a concrete strategy).
	/// </summary>
	public class FuzzyComparer : NameComparer
	{
		/// <summary>
		/// Compare the specified name and database record.
		/// </summary>
		/// <param name="name">The name to compare.</param>
		/// <param name="record">The database record to compare against.</param>
		public override bool Compare (string name, FullName record)
		{
			// trim name
			name = name.Trim ();

			// remove all non-word characters
			Regex rx = new Regex (@"[^A-Za-z\s\.\-]");
			string cleanName = rx.Replace (name, "");

			// trim redundant whitespace and hyphens
			rx = new Regex (@"([\s]{2,}|[\-])");
			cleanName = rx.Replace (cleanName, " ");

			// match first and last names in lower case
			string[] names = cleanName.Split (' ');
			return names.Length == 2 
				&& string.Equals (names [0], record.FirstName, StringComparison.InvariantCultureIgnoreCase) 
				&& string.Equals (names [1], record.LastName, StringComparison.InvariantCultureIgnoreCase);
		}
	}
}

