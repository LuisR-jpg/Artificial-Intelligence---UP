#include <iostream>
#include <string.h>
using namespace std;
struct Corredor{
  char nombre[20];
  int edad;
  char sexo[10];
  char club[20];
} cu;
int main(){
  char categoria[20];
  cout << "Nombre: ";
  cin.getline(cu.nombre, 20, '\n');
  cout << "Edad: ";
  cin >> cu.edad;
  fflush(stdin);
  cout << "Sexo: ";
  cin.getline(cu.sexo, 10, '\n');
  cout << "Club: ";
  cin.getline(cu.club, 20, '\n');
  if( cu.edad <= 18 ) strcpy(categoria, "Juvenil");
  else if( cu.edad <= 40 ) strcpy(categoria, "Senior");
  else strcpy(categoria, "Veterano");
  cout << "Nombre: " << cu.nombre << endl;
  cout << "Edad: " << cu.edad << endl;
  cout << "Sexo: " << cu.sexo << endl;
  cout << "Club: " << cu.club << endl;
  cout << "Categoria: " << categoria << endl;
  return 0;
}
