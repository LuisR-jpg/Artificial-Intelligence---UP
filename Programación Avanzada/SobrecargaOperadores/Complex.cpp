#include "Complex.h"
namespace advanced_programming {
  Complex::Complex(): real(0), imaginary(0) {}
  Complex::Complex(double real, double imaginary): real(real), imaginary(imaginary) {}
  Complex::Complex(const Complex &other) {
    real = other.real;
    imaginary = other.imaginary;
  }
  Complex::~Complex(){}
  Complex Complex::operator = (const Complex &other){
    this -> real = other.getReal();
    this -> imaginary = other.getImaginary();
    return *this;
  }
  ostream &operator << (ostream &output, const Complex &c){
    output << "(" << c.getReal() << " + " << c.getImaginary() << "i)";
    return output;
  }
  Complex operator + (const Complex &a, const Complex &b){
    return Complex(a.getReal() + b.getReal(), a.getImaginary() + b.getImaginary());
  }
  Complex operator - (const Complex &a, const Complex &b){
    return Complex(a.getReal() - b.getReal(), a.getImaginary() - b.getImaginary());
  }
} 
using namespace advanced_programming;
int main(){
  Complex a(5, 5), b(10, 10);
  cout << a << endl << b << endl;
  cout << a + b << endl;
  a = b;
  cout << a << endl << b << endl;
  cout << a - b << endl;
  return 0;
}
