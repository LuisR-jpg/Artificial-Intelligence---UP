using System;

namespace CompositePattern
{
	/// <summary>
	/// The leaf class.
	/// </summary>
	class Leaf : Component
	{
		/// <summary>
		/// Perform an operation on the component.
		/// </summary>
		public override void DoThis()
		{
			// perform leaf operation here
			Console.WriteLine ("Leaf");
		}
	}
	
}
