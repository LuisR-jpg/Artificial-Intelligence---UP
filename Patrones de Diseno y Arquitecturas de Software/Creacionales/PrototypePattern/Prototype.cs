using System;

namespace PrototypePattern
{
	/// <summary>
	/// The abstract prototype class
	/// </summary>
	public abstract class Prototype
	{
		/// <summary>
		/// Clone this instance.
		/// </summary>
		public abstract Prototype Clone();
	}
	
}
