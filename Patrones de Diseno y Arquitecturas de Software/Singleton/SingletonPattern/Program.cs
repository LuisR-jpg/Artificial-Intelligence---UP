using System;

namespace SingletonPattern
{

	class MainClass
	{
		public static void Main (string[] args)
		{
			// get the singleton instance
			Singleton instance = Singleton.Instance;
            instance = Singleton.GetInstance();

          

		}
	}
}
