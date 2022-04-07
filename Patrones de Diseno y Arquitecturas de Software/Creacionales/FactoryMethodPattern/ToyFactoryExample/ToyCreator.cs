using System;
using System.Drawing;

namespace ToyFactoryExample
{
	/// <summary>
	/// The abstract toy creator factory class.
	/// </summary>
	abstract class ToyCreator
	{
		/// <summary>
		/// Abstract factory method to create a new toy.
		/// </summary>
		/// <returns>The newly created toy.</returns>
		protected abstract Toy CreateToy ();

		/// <summary>
		/// Make a new toy.
		/// </summary>
		public void MakeToy()
		{
			Toy toy = CreateToy ();
			int grams = toy.GetPowderQuantity ();
			PreparePowder (grams);
			SelectMold (toy);
			InjectPowder (grams);
			TimeSpan heatingTime = toy.GetHeatingTime ();
			HeatMold (heatingTime);
			ExtractToy ();
			Color color = toy.GetColor ();
			PaintToy (color);
		}

		#region Toy construction methods

		private void PreparePowder(int grams)
		{
			Console.WriteLine ("Preparing {0} grams of powder", grams);
		}

		private void SelectMold (Toy toy)
		{
			Console.WriteLine ("Selecting mold {0}", toy.GetType().Name);
		}

		private void InjectPowder (int grams)
		{
			Console.WriteLine ("Injecting {0} grams of powder", grams);
		}

		private void HeatMold(TimeSpan duration)
		{
			Console.WriteLine ("Heating for {0} minutes", duration.TotalMinutes);
		}

		private void ExtractToy()
		{
			Console.WriteLine ("Extracting toy");
		}

		private void PaintToy (Color color)
		{
			Console.WriteLine ("Painting toy {0}", color.Name);
		}

		#endregion

	}
}
