using System;

namespace PrototypePattern
{
	/// <summary>
	/// The concrete prototype 1 class 
	/// </summary>
	class ConcretePrototype1 : Prototype
	{
		/// <summary>
		/// Clone this instance.
		/// </summary>
		public override Prototype Clone()
		{
			return (Prototype)this.MemberwiseClone();
		}
	}
}
