using System;

namespace BuilderPattern
{
	/// <summary>
	/// The abstract builder class
	/// </summary>
	abstract class Builder
	{
		/// <summary>
		/// Build part A.
		/// </summary>
		public abstract void BuildPartA();

		/// <summary>
		/// Build part B.
		/// </summary>
		public abstract void BuildPartB();

		/// <summary>
		/// Gets the finished product.
		/// </summary>
		/// <returns>The finished product.</returns>
		public abstract Product GetResult();
	}
}
