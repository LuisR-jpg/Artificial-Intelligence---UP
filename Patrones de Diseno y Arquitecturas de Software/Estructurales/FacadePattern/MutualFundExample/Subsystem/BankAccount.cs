using System;

namespace MutualFundExample
{
	/// <summary>
	/// The bank account subsystem class.
	/// </summary>
	public abstract class BankAccount
	{
		// the account number
		private int _accountNumber = 0;

		/// <summary>
		/// Initializes a new instance of the <see cref="MutualFundExample.BankAccount"/> class.
		/// </summary>
		/// <param name="accountNumber">The account number.</param>
		public BankAccount(int accountNumber)
		{
			_accountNumber = accountNumber;
		}

		/// <summary>
		/// Gets the account balance.
		/// </summary>
		/// <returns>The account balance.</returns>
		public abstract decimal GetAccountBalance ();

		/// <summary>
		/// Withdraw the specified amount.
		/// </summary>
		/// <param name="amount">Amount.</param>
		public abstract void Withdraw (decimal amount);

		/// <summary>
		/// Deposit the specified amount.
		/// </summary>
		/// <param name="amount">Amount.</param>
		public abstract void Deposit (decimal amount);
	}
}

