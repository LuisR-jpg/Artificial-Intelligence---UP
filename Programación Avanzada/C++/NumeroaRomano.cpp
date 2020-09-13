#include <iostream>
using namespace std;
int main(){
  int a;
  cin >> a;
  switch( a/1000 ){
    //case 4: cout << "M";
    case 3: cout << "M";
    case 2: cout << "M";
    case 1: cout << "M";
  }
  a %= 1000;
  if( a > 499 && a < 900 ){
    cout << "D";
    a %= 500;
  }
  switch( a/100 ){
    case 9: cout << "CM"; break;
    case 4: cout << "CD"; break;
    case 3: cout << "C";
    case 2: cout << "C";
    case 1: cout << "C";
  }
  a %= 100;
  if( a > 49 && a < 90 ){
    cout << "L";
    a %= 50;
  }
  switch( a/10 ){
    case 9: cout << "XC"; break;
    case 4: cout << "XL"; break;
    case 3: cout << "X";
    case 2: cout << "X";
    case 1: cout << "X";
  }
  a %= 10;
  if( a > 4 && a < 9 ){
    cout << "V";
    a %= 5;
  }
  switch( a ){
    case 9: cout << "IX"; break;
    case 4: cout << "IV"; break;
    case 3: cout << "I";
    case 2: cout << "I";
    case 1: cout << "I";
  }
  return 0;
}
