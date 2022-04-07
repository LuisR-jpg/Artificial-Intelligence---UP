using System;
using System.Data;

namespace StockHistoryExample
{
	/// <summary>
	/// The client class that uses the adapter to access the adaptee.
	/// </summary>
	public class StockApp
	{
		/// <summary>
		/// Shows the price history for the given stock.
		/// </summary>
		/// <param name="ticker">The ticker symbol of the stock to show history for.</param>
		public DataTable ShowStockHistory (string ticker)
		{
			// get a stock history adapter instance
			StockHistoryTarget adapter = new StockHistoryAdapter ();

			// get the stock history
			DataTable history = adapter.GetStockPrices (ticker);

            return history;
		}
	}
}

