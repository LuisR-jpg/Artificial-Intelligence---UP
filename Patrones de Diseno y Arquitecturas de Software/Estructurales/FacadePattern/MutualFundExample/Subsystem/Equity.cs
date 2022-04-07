using System;

namespace MutualFundExample
{
	/// <summary>
	/// The equity subsystem class.
	/// </summary>
	public abstract class Equity
	{
		// the equity ticker symbol
		private string _tickerSymbol = null;

		/// <summary>
		/// Initializes a new instance of the <see cref="MutualFundExample.Equity"/> class.
		/// </summary>
		/// <param name="tickerSymbol">The ticker symbol.</param>
		public Equity (string tickerSymbol)
		{
			_tickerSymbol = tickerSymbol;
		}

		/// <summary>
		/// Buy the specified shares.
		/// </summary>
		/// <param name="shares">Shares.</param>
		public abstract void Buy (decimal shares);

		/// <summary>
		/// Sell the specified shares.
		/// </summary>
		/// <param name="shares">Shares.</param>
		public abstract void Sell (decimal shares);

		/// <summary>
		/// Gets the current share price.
		/// </summary>
		/// <returns>The price.</returns>
		public abstract decimal GetPrice();
	}
}

