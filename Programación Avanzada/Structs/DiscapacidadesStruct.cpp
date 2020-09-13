#include <iostream>
#include <string.h>
#include <time.h>
using namespace std;
struct Persona{
  char nombre[20];
  bool tieneDis;
} people[100], si[100], no[100];
int main(){
  srand(time(NULL));
  cout << "Ingrese la cantidad de personas: ";
  int n, a = 0, b = 0;
  cin >> n;
  for( int i = 0; i < n; i++ ){
    fflush(stdin);
    cout << "Nombre: ";
    cin.getline(people[i].nombre, 20, '\n');
    people[i].tieneDis = rand() % 2;
    if( people[i].tieneDis ) si[a++] = people[i];
    else no[b++] = people[i];
  }
  cout << "Gente con discapacidad: " << endl;
  for( int i = 0; i < a; i++ )
    cout << si[i].nombre << endl;
  cout << "Gente sin discapacidad: " << endl;
  for( int i = 0; i < b; i++ )
    cout << no[i].nombre << endl;
  return 0;
}
