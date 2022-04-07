using System;

namespace StrategyPattern
{
	/// <summary>
	/// The context class.
	/// </summary>
	class Context
	{
		// the reference to the current strategy
		private Strategy _strategy;

		/// <summary>
		/// Initializes a new instance of the <see cref="StrategyPattern.Context"/> class.
		/// </summary>
		/// <param name="strategy">The strategy to use.</param>
		public Context(Strategy strategy)
		{
			this._strategy = strategy;
		}

		/// <summary>
		/// The context interface.
		/// </summary>
		public void ContextInterface()
		{
			_strategy.AlgorithmInterface();
		}
	}
}
