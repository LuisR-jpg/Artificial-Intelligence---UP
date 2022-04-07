using System;

namespace BridgePattern
{
	/// <summary>
	/// The redefined abstraction class. 
	/// </summary>
	public class RedefinedAbstraction : Abstraction
	{
		/// <summary>
		/// Initializes a new instance of the <see cref="BridgePattern.Abstraction"/> class.
		/// </summary>
		/// <param name="implementor">The implementor instance to use.</param>
		public RedefinedAbstraction (Implementor implementor)
			: base(implementor)
		{
		}


		/// <summary>
		/// Perform a high-level abstract operation.
		/// </summary>
		public override void Operation()
		{
			// perform a sequence of low-level operations
			_implementor.OperationImp();

			// additional operations...
		}
	}
	
}
