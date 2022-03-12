using System;
using System.Collections.Generic;

namespace FastfoodExample
{
	/// <summary>
	/// The menu class.
	/// </summary>
	class Menu
	{
		// generic collection holding the list of parts
		private Dictionary<string, string> _parts = new Dictionary<string, string>();

		/// <summary>
		/// Add a new part to the menu.
		/// </summary>
		/// <param name="part">The part to add to the menu.</param>
		public void Add(string part)
		{
			_parts.Add(part, part);
		}

		/// <summary>
		/// Returns a <see cref="System.String"/> that represents the current <see cref="FastfoodExample.Menu"/>.
		/// </summary>
		/// <returns>A <see cref="System.String"/> that represents the current <see cref="FastfoodExample.Menu"/>.</returns>
		public override string ToString ()
		{
			return String.Join (", ", _parts.Values);
		}

	}
}
