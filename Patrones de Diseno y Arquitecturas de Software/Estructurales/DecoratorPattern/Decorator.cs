using System;

namespace DecoratorPattern
{
	/// <summary>
	/// The decorator abstract base class.
	/// </summary>
	public abstract class Decorator : Component
	{
		// a reference to the decorated component
		protected Component _component;

		/// <summary>
		/// Initializes a new instance of the <see cref="DecoratorPattern.Decorator"/> class.
		/// </summary>
		/// <param name="component">Component.</param>
		protected Decorator(Component component)
		{
			_component = component;
		}

		/// <summary>
		/// Perform an operation.
		/// </summary>
		public override void Operation()
		{
			_component.Operation();
		}
	}
	
}
