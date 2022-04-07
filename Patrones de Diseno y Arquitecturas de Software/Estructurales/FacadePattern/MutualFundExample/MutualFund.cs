using System;

namespace MutualFundExample
{
	/// <summary>
	/// The mutual fund facade class.
	/// </summary>
	public class MutualFund
	{
		// the number of the account used by this mutual fund 
		private int _accountNumber = 0;

		/// <summary>
		/// Initializes a new instance of the <see cref="MutualFundExample.MutualFund"/> class.
		/// </summary>
		/// <param name="accountNumber">The number of the account to use.</param>
		public MutualFund(int accountNumber)
		{
			_accountNumber = accountNumber;
		}

		/// <summary>
		/// Buy the specified shares.
		/// </summary>
		/// <param name="tickerSymbol">The ticker symbol.</param>
		/// <param name="shares">The number of shares to buy.</param>
		public void Buy(string tickerSymbol, int shares)
		{
			// get account and equity
			CashAccount account = new CashAccount (_accountNumber);
			var equityFactory = EquityFactory.GetInstance ();
			Equity equity = equityFactory.CreateEquity (tickerSymbol);

			// calculate required credit
			decimal amount = equity.GetPrice () * shares;
			decimal balance = account.GetAccountBalance ();
			if (balance >= amount)
			{
				// withdraw amount
				account.Withdraw (amount);

				// buy stock
				equity.Buy (shares);
				Console.WriteLine ("Succesfully bought {0} {1} shares", shares, tickerSymbol);
				Console.WriteLine ("New account balance is ${0}", account.GetAccountBalance ());
			} else
			{
				Console.WriteLine ("Insufficient balance ${0}", balance);
			}
		}

	}
}

