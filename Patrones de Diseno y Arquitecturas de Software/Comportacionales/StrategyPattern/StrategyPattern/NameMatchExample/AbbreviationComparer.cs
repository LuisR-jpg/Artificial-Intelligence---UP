using System;
using System.Text.RegularExpressions;

namespace NameMatchExample
{
	/// <summary>
	/// The abbreviation comparer class (a concrete strategy).
	/// </summary>
	public class AbbreviationComparer : FuzzyComparer
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

			// split into first and last names
			string[] names = cleanName.Split (' ');
			if (names.Length == 2)
			{
				// handle abbreviated first name
				int pos = names [0].IndexOf (".");
				if (pos >= 0)
				{
					string abbrFirstName = names [0].Substring (0, pos);
					string abbrRecord = record.FirstName.Substring (0, pos);
					return string.Equals (abbrFirstName, abbrRecord, StringComparison.InvariantCultureIgnoreCase) 
						&& string.Equals (names [1], record.LastName, StringComparison.InvariantCultureIgnoreCase);
				} else
				{
					// match first and last names in lower case
					return names.Length == 2 
						&& string.Equals (names [0], record.FirstName, StringComparison.InvariantCultureIgnoreCase) 
						&& string.Equals (names [1], record.LastName, StringComparison.InvariantCultureIgnoreCase);
				}
			} else
				return false;
		}
	}
}

