#include <iostream>
using namespace std;
int main(){
  int n, num[100], *dirnums, menor = 99999;
  cin >> n;
  for( int i = 0; i < n; i++ ){
    cout << i+1 << " Digite un numero ";
    cin >> num[i];
  }
  dirnums = num;
  cout << num << endl;
  cout << dirnums << endl;
  cout << *dirnums << endl;
  for(int i = 0; i < n; i++ )
    cout << *(dirnums + i) << " "; //No modifca al puntero
//    cout << *(dirnums++) << " "; //Se recorre el arreglo con todo y puntero
  return 0;
}
