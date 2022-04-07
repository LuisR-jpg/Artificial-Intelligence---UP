using System;
using System.Collections.Generic;

namespace CompositePattern
{
	/// <summary>
	/// The composite class.
	/// </summary>
	class Composite : Component
	{
		// the list of child components
		private List<Component> _children = new List<Component>();

		public void AddChild(Component component)
		{
			_children.Add(component);
		}

		/// <summary>
		/// Perform an operation on the component.
		/// </summary>
		public override void DoThis()
		{
			// perform composite operation here
			Console.WriteLine ("Composite");

			// perform operation on all children
			foreach (Component child in _children)
			{
				child.DoThis();
			}
		}
	}
	
}
