using System;

namespace AdapterPattern
{
	/// <summary>
	/// The abstract target class which defines the adapter interface.
	/// </summary>
	public abstract class Target
	{
		/// <summary>
		/// Make a request.
		/// </summary>
		public abstract void Request ();
	}
	
}
