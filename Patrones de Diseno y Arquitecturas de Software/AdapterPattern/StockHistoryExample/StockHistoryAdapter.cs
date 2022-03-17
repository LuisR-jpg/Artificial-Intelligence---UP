using System;
using System.Data;

namespace StockHistoryExample
{

	/// <summary>
	/// The adapter class that wraps the adaptee.
	/// </summary>
	class StockHistoryAdapter : StockHistoryTarget
	{
		// the adaptee to wrap
		private StockHistoryDb _adaptee = new StockHistoryDb();

		/// <summary>
		/// Gets the price history of the specified stock.
		/// </summary>
		/// <returns>A DataTable containing twelve months of price history for the given stock.</returns>
		/// <param name="ticker">The ticker symbol of the stock to get price history for.</param>
		public override DataTable GetStockPrices (string ticker)
		{
			// call the correct adaptee method
			decimal[] history = new decimal[] { };
			switch (ticker)
			{
			case "AAPL":
				history = _adaptee.GetAAPL();
				break;
			case "MSFT":
				history = _adaptee.GetMSFT();
				break;
			case "GOOG":
				history = _adaptee.GetGOOG();
				break;
			default:
				throw new NotImplementedException("Cannot get history for ticker " + ticker);
			}

			// create datatable
			DataTable results = new DataTable();
			results.Columns.Add(new DataColumn("Date", typeof(DateTime)));
			results.Columns.Add(new DataColumn("Price", typeof(decimal)));

			// copy stock history into table
			DateTime dt = new DateTime(2015, 11, 7); // all prices start at this date
			for (int i=0; i<12; i++)
			{
				DataRow row = results.NewRow();
				row[0] = dt;
				row[1] = history[i];
				results.Rows.Add(row);
				dt = dt.AddMonths(-1);
			}

			// return results
			return results;
		}
	}
}
