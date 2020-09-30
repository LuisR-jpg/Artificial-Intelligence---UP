#include <iostream>
#include <string>
#include <vector>
using namespace std;
int main(){
  vector<int> vu;
  vector<double> vd;
  vector<string> vt;
/* ITERARLO */
  for( int i = 0; i <= 5; i++ ){
    vu.push_back(i); //Se agrega al final
    vd.push_back(i + 0.5);
    vt.push_back(to_string(i) + "hola");
  }
  for( vector<int>::iterator ir = vu.begin(); ir != vu.end(); ++ir ) //Auto es una variable automatica, toma el tipo de dato que iteremos
    cout << *ir << endl;
  for( auto ir = vd.begin(); ir != vd.end(); ir++ )
    cout << *ir << endl;
  for( auto ir = vt.begin(); ir != vt.end(); ir++ )
    cout << *ir << endl;
/* CONOCERLO */
  cout << "Size: " << vu.size() << endl;		//Numero de elementos
  cout << "Capacity: " << vu.capacity() << endl;	//Allocated memory
  cout << "Max Size: " << vu.max_size() << endl;	//Tamaño maximo posible
  vu.resize(4);
  cout << "Size: " << vu.size() << endl;		//Numero de elementos
  cout << "Empty: " << vu.empty() << endl;
/* ACCEDER */
  cout << vu[0] << endl;
  cout << vu.at(3) << endl;
  cout << vu.front() << endl;
  cout << vu.back() << endl;
  return 0;
}
