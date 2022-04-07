using System;

namespace AdapterPattern
{
	/// <summary>
	/// The adaptee class that needs an adapter.
	/// </summary>
	class Adaptee
	{
		/// <summary>
		/// A specific request that needs an adapter.
		/// </summary>
		public void SpecificRequest()
		{
			throw new NotImplementedException ("SpecificRequest is not implemented.");
		}
	}
	
}
