#include <iostream>
#include "calc_anios.h"
using namespace std;
int main(){
  int tiempo, anios, meses, dias;
  cin >> tiempo;
  calc_anios(tiempo, anios, meses, dias);
  cout << "\t" << dias << "\\" << meses << "\\" << anios << endl;
  return 0;
}
void calc_anios(int tiempo, int &anios, int &meses, int &dias){
  dias = tiempo % 30 + 1; tiempo /= 30;
  meses = tiempo % 12 + 1; 
  anios = tiempo / 12 + 2000;
}

