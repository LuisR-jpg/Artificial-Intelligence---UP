#include <iostream>
#include <string.h>
using namespace std;
void invert(char str[], int n){
  for( int i = 0; i < n/2; i++ ){
    char aux = str[i];
    str[i] = str[n-1-i];
    str[n-1-i] = aux;
  }
  return;
}
int main(){
  char cad[100];
  cin.getline(cad, 100, '\n');
  invert(cad, strlen(cad));
  cout << cad;
  return 0;
}
