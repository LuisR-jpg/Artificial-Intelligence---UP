#include <iostream>
using namespace std;
struct Tiempo{
  int horas, minutos, segundos;
} etapas[100];
int main(){
  cout << "ingrese el numero de etapas: ";
  int n, h = 0, m = 0, s = 0;
  cin >> n;
  for( int i = 0; i < n; i++ ){
    cout << "Horas: ";
    cin >> etapas[i].horas;
    cout << "Minutos: ";
    cin >> etapas[i].minutos;
    cout << "Segundos: ";
    cin >> etapas[i].segundos;
    s += etapas[i].segundos;
    m += etapas[i].minutos;
    h += etapas[i].horas;
  }
  m += s / 60;
  s %= 60;
  h += m / 60;
  m %= 60;
  cout << "El tiempo total es: " << h << " hrs + " << m << " min + " << s << " seg." << endl;
  return 0;
}
