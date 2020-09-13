#include <iostream>
using namespace std;
int main(){
  int *dir, numero = 10;
  dir = &numero;
  cout << dir << endl;
  cout << *dir << endl;
  cout << &dir << endl;
  numero += 5;			//Todos hacen lo mismo
  numero = *dir + 5; 		//Hacen
  *dir = *dir + 5;		//Lo
  cout << numero << endl;	//Mismo
  int var = 500, *pu, **pd, ***pt;
  pu = &var;
  pd = &pu;
  pt = &pd;
  cout << var << endl;
  cout << pu << endl;
  cout << pd << endl;
  cout << pt << endl;
  cout << ***pt << endl;
  return 0;
}
