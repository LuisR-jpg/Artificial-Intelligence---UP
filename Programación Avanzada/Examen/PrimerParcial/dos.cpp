#include <iostream>
using namespace std;
struct fraction{
  int numerator, denominator;
} fu, fd, res;
int mcd(int a, int b){
  if( !(a % b) ) return b;
  return mcd(b, a%b);
}
int main(){
  cin >> fu.numerator >> fu.denominator;  
  cin >> fd.numerator >> fd.denominator;  
  res.numerator = (fu.numerator*fd.denominator) + (fu.denominator*fd.numerator);
  res.denominator = (fu.denominator*fd.denominator);
  int m = mcd(res.numerator, res.denominator);
  res.numerator /= m;
  res.denominator /= m;
  cout << res.numerator << " " << res.denominator << endl; 
  return 0;
}
