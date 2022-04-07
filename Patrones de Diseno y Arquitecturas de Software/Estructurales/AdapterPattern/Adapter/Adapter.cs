using System;

namespace AdapterPattern
{

	/// <summary>
	/// The adapter class that wraps the adaptee.
	/// </summary>
	class Adapter : Target
	{
		// the adaptee to wrap
		private Adaptee _adaptee = new Adaptee();

		/// <summary>
		/// Make a request.
		/// </summary>
		public override void Request()
		{
			// possibly do some other work ...

			// call the adaptee
			_adaptee.SpecificRequest();

			// possibly do some other work ...
		}
	}
	
}
