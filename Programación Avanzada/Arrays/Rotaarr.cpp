#include <iostream>
using namespace std;
int main(){
  int n, k; //Tamaño aleatorio del arreglo y se rota 3 veces
  cout << "Ingresa 2 enteros, el tamano del arreglo y las veces que se rotara: ";
  cin >> n >> k;
  cout << "Ingresa " << n << " enteros." << endl;
  int ori[n], res[n];
  for( int i = 0; i < n; i++ )
    cin >> ori[i];
  for( int i = 0; i < n; i++ )
    res[(i+k)%n] = ori[i];
  for( int i = 0; i < n; i++ )
    cout << res[i] << " ";
  return 0;
}
