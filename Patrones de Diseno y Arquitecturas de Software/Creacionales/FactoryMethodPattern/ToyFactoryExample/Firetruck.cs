using System;
using System.Drawing;

namespace ToyFactoryExample
{
	/// <summary>
	/// The concrete firetruck product class.
	/// </summary>
	class Firetruck : Toy
	{
		/// <summary>
		/// Gets the required quantity of plastic powder.
		/// </summary>
		/// <returns>The required powder quantity in grams.</returns>
		public override int GetPowderQuantity()
		{
			return 40;
		}

		/// <summary>
		/// Gets the required heating time.
		/// </summary>
		/// <returns>The required heating time.</returns>
		public override TimeSpan GetHeatingTime ()
		{
			return TimeSpan.FromMinutes (2);
		}

		/// <summary>
		/// Gets the required paint color.
		/// </summary>
		/// <returns>The required paint color.</returns>
		public override Color GetColor()
		{
			return Color.Red;
		}
	}
}
