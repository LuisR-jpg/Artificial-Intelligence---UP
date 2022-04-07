using System;

namespace DecoratorPattern
{
	/// <summary>
	/// The concrete decorator B class.
	/// </summary>
	class ConcreteDecoratorB : Decorator
	{
		/// <summary>
		/// Initializes a new instance of the <see cref="DecoratorPattern.ConcreteDecoratorB"/> class.
		/// </summary>
		/// <param name="component">Component.</param>
		public ConcreteDecoratorB(Component component)
			: base (component)
		{
		}

		/// <summary>
		/// Perform an operation.
		/// </summary>
		public override void Operation()
		{
			base.Operation();
			Console.WriteLine("ConcreteDecoratorB.Operation()");
		}
	}
	
}
