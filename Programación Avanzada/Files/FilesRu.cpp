#include <iostream>
#include <string.h>
#include <fstream>
using namespace std;
int arr[100000] = {0};
void llenar(){
  ifstream jaja;
  for(int i = 0; i < 2; i++ ){
    if( !i ) jaja.open("f1.txt", ios::in);
    else jaja.open("f2.txt", ios::in);
    string a;
    while( !jaja.eof() ){
      getline(jaja, a);
      int b = 0;
      cout << "\t\t" << sizeof(a)/sizeof(a[0]) << endl;
      for( int i = 0; i < sizeof(a)/sizeof(a[0]); i++ ){
	if( a[i] == ':' ){
	  int c = 0;
	  b /= 10;
	  while( b ){
	    c += b % 10;
	    c *= 10, b /= 10;
	  }
	  c /= 10;
	  cout << "\t" << c << endl;
//	  arr[c]++, b = 0;
	}
	else{
	  b += a[i] - '0'; 
	  b *= 10;
	}
      }
    }
  }
}
int main(){
  llenar();
  for( int i = 0; i < 1000000; i++ )
    if( arr[i] ) cout << arr[i] << " ";
  return 0;
}
  
