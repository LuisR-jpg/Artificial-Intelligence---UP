using System;

namespace DecoratorPattern
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			// create a component with two decorators
			var component = 
				new ConcreteDecoratorA (
				new ConcreteDecoratorB (
				new ConcreteComponent ()));

			// perform the operation
			component.Operation();
		}
	}
}
