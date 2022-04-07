using System;

namespace BuilderPattern
{
	/// <summary>
	/// The concrete builder class for product type 1.
	/// </summary>
	class ConcreteBuilder1 : Builder
	{
		// the product being constructed
		private Product _product = new Product();

		/// <summary>
		/// Build part A.
		/// </summary>
		public override void BuildPartA()
		{
			_product.Add("PartA1");
		}

		/// <summary>
		/// Build part B.
		/// </summary>
		public override void BuildPartB()
		{
			_product.Add("PartB1");
		}

		/// <summary>
		/// Gets the finished product.
		/// </summary>
		/// <returns>The finished product.</returns>
		public override Product GetResult()
		{
			return _product;
		}
	}
}
