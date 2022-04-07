using System;

namespace MutualFundExample
{
	/// <summary>
	/// The cash account subsystem class.
	/// </summary>
	public class CashAccount : BankAccount
	{
		protected decimal balance = 1000; // there's $1000 on this account

		/// <summary>
		/// Initializes a new instance of the <see cref="MutualFundExample.CashAccount"/> class.
		/// </summary>
		/// <param name="accountNumber">Account number.</param>
		public CashAccount(int accountNumber)
			: base(accountNumber)
		{
		}

		/// <summary>
		/// Gets the account balance.
		/// </summary>
		/// <returns>The account balance.</returns>
		public override decimal GetAccountBalance ()
		{
			return balance;
		}

		/// <summary>
		/// Withdraw the specified amount.
		/// </summary>
		/// <param name="amount">Amount.</param>
		public override void Withdraw (decimal amount)
		{
			balance -= amount;
		}

		/// <summary>
		/// Deposit the specified amount.
		/// </summary>
		/// <param name="amount">Amount.</param>
		public override void Deposit (decimal amount)
		{
			balance += amount;
		}
	}
}

