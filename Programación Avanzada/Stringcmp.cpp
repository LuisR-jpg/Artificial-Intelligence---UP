#include <iostream>
#include <string.h>
using namespace std;
int main(){
  char wu[20], wd[20];
  cin.getline(wu, 20, '\n');
  cin.getline(wd, 20, '\n');
  cout << strcmp(wu, wd); //-1: Si la segunda palabra es mayor alfabeticamente, 0: Si son iguales, 1: Si la primera es mayor 
  return 0;
}
