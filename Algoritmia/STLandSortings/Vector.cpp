#include <vector>
#include <bits/stdc++.h>
using namespace std;
int main(){
  int n = 3, k = 10;
  vector<int> u; //Declara un vector vacío.
  vector<int> d(n); //Declara un vector de tamaño n, inicializado en 0.
  vector<int> t(n, k); //Vector de tamaño n, con valores iniciales = k
  vector<int> v = {1, 2, 3}; //Se crea un vector a partir de un listado.

  /* CAPACIDAD */
  v.size(); //*size_type: Número de elementos.
  v.empty(); //bool: 1 si está vacío, 0 si no.

  /* ACCESO */
  //v[i]: Como en arreglos, accede a la posición i del vector.
  int a = v[0]; 
  v[1] = 10;
  
  v.front(); //Referencia al primer elemento del vector.
  v.back(); //Ref al último. 

  /* MODIFICADORES */
  v.push_back(k); //Inserta 'k' al final del vector.
  v.pop_back(); //Elimina el último elemento.


  v.assign(n, k); //Asigna el varlo k a los primeros n elementos.
  v.clear(); //Borra todos los elementos. 

  for(int i = 0; i < v.size(); i++)
    cout << v[i] << " ";
  /*
  */

  vector<string> vec = {"Nissan", "Renault", "Lambo"};
  for(auto x: vec)
    cout << x << endl;

  return 0;
}
