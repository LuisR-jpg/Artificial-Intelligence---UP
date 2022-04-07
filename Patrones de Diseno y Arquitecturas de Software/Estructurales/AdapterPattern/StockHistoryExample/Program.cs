using System;
using System.Data;

namespace StockHistoryExample
{
	/// <summary>
	/// The main program class.
	/// </summary>
	class MainClass
	{
		/// <summary>
		/// The entry point of the program, where the program control starts and ends.
		/// </summary>
		/// <param name="args">The command-line arguments.</param>
		public static void Main (string[] args)
		{
            String ticker = "AAPL";
			// get apple stock price history
			StockApp app = new StockApp ();
			DataTable dataTable= app.ShowStockHistory (ticker);
            // show the stock history on the console
            foreach (DataRow row in dataTable.Rows)
            {
                DateTime dt = (DateTime)row[0];
                decimal price = (decimal)row[1];
                Console.WriteLine("On {0:MMM d yyyy} {1} was ${2:0.00}", dt, ticker, price);
            }
            Console.ReadLine();
        }
	}
}
