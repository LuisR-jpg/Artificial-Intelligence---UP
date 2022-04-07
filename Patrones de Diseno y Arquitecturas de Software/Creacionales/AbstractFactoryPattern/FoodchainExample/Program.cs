using System;

namespace FoodchainExample
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			// simulate ecosystem in Africa
			ContinentFactory factory1 = new AfricaFactory();
			Ecosystem ecosystem1 = new Ecosystem(factory1);
			ecosystem1.Run();

			// simulate ecosystem in Australia
			ContinentFactory factory2 = new AustraliaFactory();
			Ecosystem ecosystem2 = new Ecosystem(factory2);
			ecosystem2.Run();

            Console.Read();
		}
	}
}
