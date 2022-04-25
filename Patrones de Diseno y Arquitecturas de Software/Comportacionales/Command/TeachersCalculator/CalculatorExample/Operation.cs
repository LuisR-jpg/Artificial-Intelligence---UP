using System;

namespace CalculatorExample
{
	/// <summary>
	/// The concrete operation command class.
	/// </summary>
	public class Operation : AbstractOperation
	{
		// the math library to use (the receiver)
		protected MathLib _mathlib = null;

		// the math operation to use
		protected string _operation = null;

		// the argument to use
		protected int _argument = 0;

		/// <summary>
		/// Initializes a new instance of the <see cref="CalculatorExample.Operation"/> class.
		/// </summary>
		/// <param name="mathlib">The math library to use.</param>
		/// <param name="operation">The operation to perform.</param>
		/// <param name="argument">The argument to use.</param>
		public Operation(MathLib mathlib, string operation, int argument)
		{
			_mathlib = mathlib;
			_operation = operation;
			_argument = argument;
		}

		/// <summary>
		/// Execute the operation.
		/// </summary>
		public override void Execute()
		{
			switch (_operation)
			{
			case "+":
				_mathlib.Add (_argument);
				break;
			case "-":
				_mathlib.Substract (_argument);
				break;
			case "*":
				_mathlib.Multiply (_argument);
				break;
			case "/":
				_mathlib.Divide (_argument);
				break;
			default:
				throw new InvalidOperationException ("Invalid math operation");
			}
		}

		/// <summary>
		/// Gets the inverse of the operation.
		/// </summary>
		/// <value>The inverse of the operation.</value>
		public override AbstractOperation Inverse 
		{
			get
			{
				switch (_operation)
				{
				case "+":
					return new Operation(_mathlib, "-", _argument);
				case "-":
					return new Operation(_mathlib, "+", _argument);
				case "*":
					return new Operation(_mathlib, "/", _argument);
				case "/":
					return new Operation(_mathlib, "*", _argument);
				default:
					throw new InvalidOperationException ("Invalid math operation");
				}
			}
		}
	}
	
}
