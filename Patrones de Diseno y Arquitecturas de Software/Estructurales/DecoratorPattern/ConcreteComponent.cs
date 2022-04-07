using System;

namespace DecoratorPattern
{
	/// <summary>
	/// The concrete component class.
	/// </summary>
	public class ConcreteComponent : Component
	{
		/// <summary>
		/// Perform an operation.
		/// </summary>
		public override void Operation()
		{
			Console.WriteLine("ConcreteComponent.Operation()");
		}
	}
	
}
