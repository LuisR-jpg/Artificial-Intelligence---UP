#include <iostream>
using namespace std;
namespace advanced_programming{
  class Complex{
    private:
      double real;
      double imaginary;
    public:
      Complex();
      Complex(double real, double imaginary);
      Complex(const Complex &other);
      ~Complex();
      double getReal() const {
      	return real;
      }
      double getImaginary() const {
      	return imaginary;
      }
      //Complex operator - (const Complex &other);
      Complex operator = (const Complex &other);
  };
  Complex operator + (const Complex &a, const Complex &b);
  Complex operator - (const Complex &a, const Complex &b);
  ostream &operator << (ostream &out, const Complex &c);
}
