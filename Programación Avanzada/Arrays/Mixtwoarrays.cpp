#include <iostream>
using namespace std;
int main(){
  char arru[] = {'a', 'b', 'c'}, arrd[] = {'d', 'e', 'f'};
  char arrt[(sizeof(arru)+sizeof(arrd))/sizeof(char)];
  for( int i = 0; i < sizeof(arru)/sizeof(char); i++ )
    arrt[i] = arru[i];
  for( int i = sizeof(arru)/sizeof(char); i < sizeof(arrt)/sizeof(char); i++ )
    arrt[i] = arrd[i-sizeof(arru)/sizeof(char)];
  for( int i = 0; i < sizeof(arrt)/sizeof(char); i++ )
    cout << arrt[i];
  return 0;
}
