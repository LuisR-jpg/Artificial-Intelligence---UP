using System;

namespace FacadePattern
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			// initialise the facade
			var facade = new Facade();

			// call facade method A
			Console.WriteLine ("Calling Facade.MethodA...");
			facade.MethodA();
			Console.WriteLine ();

			// call facade method B
			Console.WriteLine ("Calling Facade.MethodB...");
			facade.MethodB();
		}
	}
}
