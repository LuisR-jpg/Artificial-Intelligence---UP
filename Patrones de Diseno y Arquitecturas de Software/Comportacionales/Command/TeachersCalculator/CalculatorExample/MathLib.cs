using System;

namespace CalculatorExample
{
	/// <summary>
	/// The MathLib receiver class.
	/// </summary>
	public class MathLib
	{
		// the current value of the math library
		protected int _value = 0;

		/// <summary>
		/// Gets the current value.
		/// </summary>
		/// <value>The current value.</value>
		public int Value 
		{
			get {
				return _value;
			}
		}

		/// <summary>
		/// Perform the addition action.
		/// </summary>
		/// <param name="argument">The argument to add.</param>
		public void Add(int argument)
		{
			_value += argument;
		}

		/// <summary>
		/// Perform the substraction action.
		/// </summary>
		/// <param name="argument">The argument to substract.</param>
		public void Substract(int argument)
		{
			_value -= argument;
		}

		/// <summary>
		/// Perform the multiplication action.
		/// </summary>
		/// <param name="argument">The argument to multiply.</param>
		public void Multiply(int argument)
		{
			_value *= argument;
		}

		/// <summary>
		/// Perform the division action.
		/// </summary>
		/// <param name="argument">The argument to divide.</param>
		public void Divide(int argument)
		{
			_value /= argument;
		}
	}
}
