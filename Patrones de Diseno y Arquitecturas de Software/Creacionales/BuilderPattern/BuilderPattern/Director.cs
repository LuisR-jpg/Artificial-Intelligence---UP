using System;

namespace BuilderPattern
{
	/// <summary>
	/// The director class.
	/// </summary>
	class Director
	{
		/// <summary>
		/// Construct the product using the specified builder.
		/// </summary>
		/// <param name="builder">The builder to use to construct the product.</param>
		public void Construct(Builder builder)
		{
			builder.BuildPartA();
			builder.BuildPartB();
		}
	}
}
