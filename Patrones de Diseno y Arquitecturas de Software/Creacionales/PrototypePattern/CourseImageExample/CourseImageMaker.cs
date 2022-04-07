using System;
using System.Drawing;

namespace CourseImageExample
{
	/// <summary>
	/// The client class.
	/// </summary>
	public class CourseImageMaker
	{
		/// <summary>
		/// Creates a new course image by blending an image over the given prototype.
		/// </summary>
		/// <returns>A new course image created from the given prototype.</returns>
		/// <param name="prototype">The prototype to create the course image from.</param>
		/// <param name="imagePath">The path of the blend image.</param>
		public CourseImage CreateImage(CourseImage prototype, string imagePath)
		{
			CourseImage image = (CourseImage) prototype.Clone();

			// blend second image over prototype
			using (var blend = Image.FromFile (imagePath))
			{
				using (var canvas = Graphics.FromImage(image.Bitmap))
				{
					canvas.DrawImage (blend, 115, 32);
				}
			}
			return image;
		}
	}
}

