using System;

namespace AdapterPattern
{
	/// <summary>
	/// The client class that uses the adapter to access the adaptee.
	/// </summary>
	public class Client
	{
		/// <summary>
		/// Perform a client operation.
		/// </summary>
		public void Operation()
		{
			// wrap the adaptee with an adapter
			Target adapter = new Adapter ();

			// use the adapter to make a request
			adapter.Request ();
		}
	}
}

