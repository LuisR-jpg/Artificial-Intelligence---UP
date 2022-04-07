using System;

namespace StrategyPattern
{
	/// <summary>
	/// The concrete strategy C class.
	/// </summary>
	class ConcreteStrategyC : Strategy
	{
		/// <summary>
		/// The algorithm interface.
		/// </summary>
		public override void AlgorithmInterface()
		{
			Console.WriteLine("Using concrete strategy C");
		}
	}
}
