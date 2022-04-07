using System;

namespace MutualFundExample
{
	/// <summary>
	/// The equity factory subsystem class.
	/// </summary>
	public class EquityFactory
	{
		/// <summary>
		/// Initializes a new instance of the <see cref="MutualFundExample.EquityFactory"/> class.
		/// </summary>
		private EquityFactory() 
		{
		}

		// this field holds the singleton instance of the factory
		private static EquityFactory _instance;

		/// <summary>
		/// Gets the factory singleton instance.
		/// </summary>
		/// <returns>The singleton instance of the factory.</returns>
		public static EquityFactory GetInstance() 
		{
			if (_instance==null) 
				_instance = new EquityFactory();
			return _instance;
		}

		/// <summary>
		/// Creates the equity.
		/// </summary>
		/// <returns>The equity.</returns>
		/// <param name="tickerSymbol">The ticker symbol.</param>
		public Equity CreateEquity(string tickerSymbol) 
		{
			return new Stock(tickerSymbol);
		}
	}
}

