using System;

namespace StrategyPattern
{
	/// <summary>
	/// The concrete strategy A class.
	/// </summary>
	class ConcreteStrategyA : Strategy
	{
		/// <summary>
		/// The algorithm interface.
		/// </summary>
		public override void AlgorithmInterface()
		{
			Console.WriteLine("Using concrete strategy A");
		}
	}
}
