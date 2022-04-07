using System;

namespace PrototypePattern
{
	/// <summary>
	/// The concrete prototype 2 class.
	/// </summary>
	class ConcretePrototype2 : Prototype
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
