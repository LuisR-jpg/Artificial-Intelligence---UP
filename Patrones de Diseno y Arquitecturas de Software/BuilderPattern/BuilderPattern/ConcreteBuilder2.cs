using System;

namespace BuilderPattern
{
	/// <summary>
	/// The concrete builder class for product type 2.
	/// </summary>
	class ConcreteBuilder2 : Builder
	{
		// the product being constructed
		private Product _product = new Product();

		/// <summary>
		/// Build part A.
		/// </summary>
		public override void BuildPartA()
		{
			_product.Add("PartA2");
		}

		/// <summary>
		/// Build part B.
		/// </summary>
		public override void BuildPartB()
		{
			_product.Add("PartB2");
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
