using System;

namespace MutualFundExample
{
	/// <summary>
	/// The stock subsystem class.
	/// </summary>
	public class Stock : Equity
	{
		/// <summary>
		/// Initializes a new instance of the <see cref="MutualFundExample.Stock"/> class.
		/// </summary>
		/// <param name="tickerSymbol">The ticker symbol.</param>
		public Stock(string tickerSymbol)
			: base(tickerSymbol)
		{
		}

		/// <summary>
		/// Buy the specified shares.
		/// </summary>
		/// <param name="shares">The number of shares to buy.</param>
		public override void Buy (decimal shares)
		{
			// always succeeds
		}

		/// <summary>
		/// Sell the specified shares.
		/// </summary>
		/// <param name="shares">The number of shares to sell.</param>
		public override void Sell (decimal shares)
		{
			throw new NotImplementedException ();
		}

		/// <summary>
		/// Gets the current share price.
		/// </summary>
		/// <returns>The price.</returns>
		public override decimal GetPrice ()
		{
			return 10; // all shares cost $10
		}

	}
}

