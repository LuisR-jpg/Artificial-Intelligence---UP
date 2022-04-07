using System;

namespace StrategyPattern
{
	/// <summary>
	/// The concrete strategy B class.
	/// </summary>
	class ConcreteStrategyB : Strategy
	{
		/// <summary>
		/// The algorithm interface.
		/// </summary>
		public override void AlgorithmInterface()
		{
			Console.WriteLine("Using concrete strategy B");
		}
	}
}
