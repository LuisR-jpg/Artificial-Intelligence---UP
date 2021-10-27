#include <iostream>
using namespace std;
double f(double x){
  double r = x*x*x + 4*x*x - 10;
  cout << x << ": " << r << endl;
  return r;
}
double solve(double a, double b, int n, double e){
  while(n--){
    double p = (a + b)/2, fp = f(p);
    if(!fp || abs(fp) <= e) return p;
    if(fp * f(a) > 0) a = p;
    else b = p;
  }
  return -1.0;
}
int main(){
  printf("%lf", solve(0, 2, 100, 0.01));
  return 0;
}
