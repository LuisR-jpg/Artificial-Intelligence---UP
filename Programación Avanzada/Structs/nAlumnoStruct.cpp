#include <iostream>
#include <string.h>
using namespace std;
struct Alumno{
  char nombre[20];
  int edad;
  double promedio;
} alumnos[300];
int main(){
  int mayor = 0, pos = 0, n;
  cout << "Ingresa la cantidad de alumnos: ";
  cin >> n;
  for( int i = 0; i < n; i++ ){
    fflush(stdin);
    cout << "Nombre: ";
    cin.getline(alumnos[i].nombre, 20, '\n');
    cout << "Edad: ";
    cin >> alumnos[i].edad;
    cout << "Promedio: ";
    cin >> alumnos[i].promedio;
    if( alumnos[i].promedio > mayor ){
      mayor = alumnos[i].promedio;
      pos = i;
    }
  }
  cout << "El mejor promedio es: " << alumnos[pos].promedio << endl;
  cout << "Nombre: " << alumnos[pos].nombre << endl;
  cout << "Edad: " << alumnos[pos].edad << endl;
  return 0;
}
