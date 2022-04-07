using System;

namespace NameMatchExample
{
	/// <summary>
	/// The name importer class (the context).
	/// </summary>
	public class NameImporter
	{
		// the reference to the current strategy
		private NameComparer _comparer;

		/// <summary>
		/// Initializes a new instance of the <see cref="NameMatchExample.NameImporter"/> class.
		/// </summary>
		/// <param name="comparer">The name comparer to use.</param>
		public NameImporter(NameComparer comparer)
		{
			this._comparer = comparer;
		}

		/// <summary>
		/// Match the given import list against the given database.
		/// </summary>
		/// <param name="database">The name database to compare against.</param>
		/// <param name="importList">The import list to compare.</param>
		public void Match(FullName[] database, string[] importList)
		{
			foreach (string name in importList)
			{
				foreach (FullName record in database)
				{
					if (_comparer.Compare (name, record))
					{
						Console.WriteLine ("\"{0}\" = {1} {2}", name, record.FirstName, record.LastName);
						break;
					}
				}
			}
		}
	}
}

