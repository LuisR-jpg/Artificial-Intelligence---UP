using System;

namespace ComputerSales
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			// Manufacture basicMaker = new BasicComputerMaker();
			// Computer basicComputer = basicMaker.build();
            // basicComputer.describe();

			// Manufacture proMaker = new ProComputerMaker();
			// Computer proComputer = proMaker.build();
            // proComputer.describe();

            Manufacture cellphoneMaker = new CellphoneMaker();
			Computer cellphone = cellphoneMaker.build();
            cellphone.describe();

            Component mouse = new Mouse();
            mouse.describe();
		}
	}
}
