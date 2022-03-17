using System;
using System.Data;

namespace StockHistoryExample
{
	/// <summary>
	/// The abstract target class which defines the adapter interface.
	/// </summary>
	public abstract class StockHistoryTarget
	{
		/// <summary>
		/// Gets the price history of the specified stock.
		/// </summary>
		/// <returns>A DataTable containing twelve months of price history for the given stock.</returns>
		/// <param name="ticker">The ticker symbol of the stock to get price history for.</param>
		public abstract DataTable GetStockPrices (string ticker);
	}
	
}
