using System;

namespace StockHistoryExample
{
	/// <summary>
	/// The adaptee class that needs an adapter.
	/// </summary>
	class StockHistoryDb
	{
		/// <summary>
		/// Get the stock price history for Apple.
		/// </summary>
		public decimal[] GetAAPL()
		{
			return new decimal[] { 121.06m, 119.5m, 110.3m, 112.76m, 121.3m, 125.43m, 130.28m, 125.15m, 124.43m, 128.46m, 117.16m, 110.38m };
		}

		/// <summary>
		/// Get the stock price history for Microsoft.
		/// </summary>
		public decimal[] GetMSFT()
		{
			return new decimal[] { 54.92m, 52.64m, 44.26m, 43.52m, 46.7m, 44.15m, 46.86m, 48.64m, 40.66m, 43.85m, 40.4m, 46.45m };
		}

		/// <summary>
		/// Get the stock price history for Google.
		/// </summary>
		public decimal[] GetGOOG()
		{
			return new decimal[] { 761.6m, 737.39m, 638.37m, 647.82m, 657.5m, 540m, 545.3m, 548.8m, 554.7m, 562.6m, 537.6m, 530.7m };
		}
	}
	
}
