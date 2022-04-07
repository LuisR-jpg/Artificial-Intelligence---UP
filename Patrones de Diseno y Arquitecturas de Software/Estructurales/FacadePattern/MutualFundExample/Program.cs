using System;

namespace MutualFundExample
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			// set up a mutual fund for account 123456789
			var mutualFund = new MutualFund (123456789);

			// buy 10 shares of apple
			mutualFund.Buy ("AAPL", 10);
		}
	}
}
