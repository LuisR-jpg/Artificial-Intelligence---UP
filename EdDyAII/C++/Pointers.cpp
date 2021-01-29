#include <iostream>
using namespace std;
int main(){
  int nint = 10;		
  double ndouble = 34.5;	
  int *pint;			
  pint = &nint;
  double *pdouble;		
  pdouble = (double*)&nint;
//  pdouble = &ndouble;
  void *ptr;
  cout << "nint: " << nint << "\tSize: " << sizeof(nint) << endl;
  cout << "ndouble: " << ndouble << "\tSize: " << sizeof(ndouble) << endl;
  cout << "pint: " << pint << " " << *pint << "\tSize: " << sizeof(pint) << endl;
  cout << "pdouble: " << pdouble << " " << *pdouble << "\tSize: " << sizeof(pdouble) << endl;
  cout << "ptr: " << ptr << "\tSize: " << sizeof(ptr) << endl;
  return 0;
}
