using System;

namespace DecoratorPattern
{
	/// <summary>
	/// The concrete decorator A class.
	/// </summary>
	class ConcreteDecoratorA : Decorator
	{
		/// <summary>
		/// Initializes a new instance of the <see cref="DecoratorPattern.ConcreteDecoratorA"/> class.
		/// </summary>
		/// <param name="component">Component.</param>
		public ConcreteDecoratorA(Component component)
			: base (component)
		{
		}

		/// <summary>
		/// Perform an operation.
		/// </summary>
		public override void Operation()
		{
			base.Operation();
			Console.WriteLine("ConcreteDecoratorA.Operation()");
		}
	}
	
}
