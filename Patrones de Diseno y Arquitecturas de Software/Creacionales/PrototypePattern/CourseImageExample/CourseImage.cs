using System;
using System.Drawing;

namespace CourseImageExample
{
	/// <summary>
	/// The concrete course image template class 
	/// </summary>
	public class CourseImage : Cloneable
	{
		// the bitmap holding the course image
		public Bitmap Bitmap { get; set; }

		/// <summary>
		/// Initialise the course image.
		/// </summary>
		public void Initialise()
		{
			// load generic laptop image
			Bitmap = (Bitmap) Image.FromFile ("laptop.png");
		}

		/// <summary>
        /// zdhfksdhgkdjfgdkjgkddjfgkdfjgkhdjhgkdfjgkdfjgkdfjgkdfh
        /// </summary>
        /// <returns></returns>
		public override Cloneable Clone()
		{
			// create shallow copy, then clone bitmap to create deep copy
			CourseImage clone = (CourseImage) this.MemberwiseClone();
			clone.Bitmap = (Bitmap) Bitmap.Clone ();
			return clone as Cloneable;
		}

		/// <summary>
		/// Save the bitmap to disk using the given file path.
		/// </summary>
		/// <param name="filePath">The file path to use when saving the bitmap.</param>
		public void Save(string filePath)
		{
			Console.WriteLine ("Writing {0}", filePath);
			Bitmap.Save (filePath);
		}
	}
}
