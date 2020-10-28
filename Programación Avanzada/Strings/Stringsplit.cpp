#include <iostream>
#include <string.h>
using namespace std;
int main(){
  char str[50] = "Hola PA UPAgs Mexico";
  char *token = strtok(str, " ");
  while( token != NULL ){
    cout << token << endl;
    token = strtok(NULL, " "); 
  }
  return 0;
}
