using System;

namespace FacadePattern
{
	/// <summary>
	/// The facade class.
	/// </summary>
	class Facade
	{
		// these fields hold subsystem instances
		private SubSystemOne _one;
		private SubSystemTwo _two;
		private SubSystemThree _three;

		/// <summary>
		/// Initializes a new instance of the <see cref="FacadePattern.Facade"/> class.
		/// </summary>
		public Facade()
		{
			// inintialise the subsystems
			_one = new SubSystemOne();
			_two = new SubSystemTwo();
			_three = new SubSystemThree();
		}

		/// <summary>
		/// A demo method in the facade.
		/// </summary>
		public void MethodA()
		{
			// call subsystems one and two
			_one.MethodOne();
			_two.MethodTwo();
		}

		/// <summary>
		/// A demo method in the facade.
		/// </summary>
		public void MethodB()
		{
			// call subsystems two and three
			_two.MethodTwo();
			_three.MethodThree();
		}
	}
	
}
