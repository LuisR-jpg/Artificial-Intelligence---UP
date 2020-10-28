//No funciona, vease Compressing en el mismo folder
#include <iostream>
#include <cstring>
using namespace std;
int main(){
  cout << "Ingrese una cadena de texto: ";
  unsigned char cad[100];
  const char *aux = cad;
  cin.getline(cad, 100, '\n');
  int n = strlen(cad), c = 1, p = n-1, q = 0;
//  for( int i = 1; i < n; i++ ){
//    cout << cad[i] << " " << "c: " << c << "\tp: " << p << endl;
//    if( cad[i-1] == cad[i] ){
//      c++;
//    }
//    else{
//      p++;
//      if( c > 1 ){
//	cad[p++] = c;
//	if( c > 9 ){
//	  p++;
//	}
//      c = 1;
//      }
//    }
//  }
  for( int i = n-1; i >= 0; i-- ){
//    cout << cad[i] << " " << "c: " << c << "\tp: " << p << endl;
    if( i > 0 && cad[i] == cad[i-1] ){
      c++;
      cad[i] = char(254);
    }
    else{
      if( c > 1 ){
	cad[i+1] = c + 150;
      }
      c = 1;
    }
  }
  cout << cad << endl;
  for( int i = n-1; i >= 0; i-- ){
//    cout << cad[i] << endl;
    if( cad[i] != char(254) ) cad[p--] = cad[i];
  }
  cout << cad << endl;
  //cout << n-1 << " " << p << endl;
  for( int i = p+1; i < n; i++ ){
    c = 0;
    cout << "zero: " << cad[i] << " " << int(cad[i]) << endl;
    if( cad[i] < 150 ){
      if( i < n-1 && cad[i+1] > 149 ){
	cout << "uno: " << cad[i+1] - 150 << endl;
	c += int(cad[i+1]) - 150;
      }
      for( int j = i+1; j < n; j++ ){
	if( cad[i] == cad[j] ){
	  if( j < n -1 && cad[j+1] < 150 ) c++;
	  else c += cad[j+1] - 150;
	  cout << "dos: " << c << endl;
	}
      }
      cout << c << endl;
      cad[q++] = cad[i];
      if( c / 10 ){
	cad[q++] = c / 10 + '0';
      }
      cad[q++] = c % 10 + '0';
    }
    cout << endl;
  }
  cout << endl;
  cout << cad << endl;
  for( int i = 0; i < n; i++ )
    cout << cad[i] << " ";
  return 0;
}
