//Better version exists, look for NumeroaRomano in this folder.
#include <iostream>
using namespace std;
int main(){
  int a; 
  cin >> a;
  for( int i = 0; i < a / 1000; i++ )
    cout << "M";
  a %= 1000;
  for( int i = 0; i < a / 500; i++ ){
    if( a > 900 ) break;
    cout << "D";
  }
  if( a < 900 ) a %= 500;

  for( int i = 0; i < a / 100; i++ ){
    if( a/100 == 4 ){
      cout << "CD";
      break;
    }
    if( a/100 == 9 ){
      cout << "CM";
      break;
    }
    else cout << "C";
  }
  a %= 100;
  for( int i = 0; i < a / 50; i++ ){
    if( a > 90 ) break;
    cout << "L";
  }
  if( a < 90 ) a %= 50;
  for( int i = 0; i < a / 10; i++ ){
    if( a/10 == 4 ){
      cout << "XL";
      break;
    }
    if( a/10 == 9 ){
      cout << "XC";
      break;
    }
    else cout << "X";
  }
  a %= 10;
  for( int i = 0; i < a / 5; i++ ){
    if( a == 9 ) break;
    cout << "V";
  }
  if( a != 9 ) a %= 5;
  for( int i = 0; i < a / 1; i++ ){
    if( a/1 == 4 ){
      cout << "IV";
      break;
    }
    if( a == 9 ){
      cout << "IX";
      break;
    }
    else cout << "I";
  }
  a %= 1;
  return 0;
}
