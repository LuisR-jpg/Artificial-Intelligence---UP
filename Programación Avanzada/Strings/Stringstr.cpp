#include <iostream>
#include <string.h>
using namespace std;
int main(){
  char hola[] = "hola", ola[] = "pi";
  char* ret = strstr(hola, ola);
  if( ret == NULL ) cout << "nais";
  cout << ret << " " << &ret << " " << *ret;
  return 0;
}
