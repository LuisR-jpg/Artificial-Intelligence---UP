using System;

namespace AdapterPattern
{
	/// <summary>
	/// The Main program class.
	/// </summary>
	class MainClass
	{
		/// <summary>
		/// The entry point of the program, where the program control starts and ends.
		/// </summary>
		/// <param name="args">The command-line arguments.</param>
		public static void Main (string[] args)
		{
			// start the client
			Client client = new Client ();
			client.Operation ();
		}
	}
}
