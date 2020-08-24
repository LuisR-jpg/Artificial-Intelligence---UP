#include <iostream>
#include <string.h>
using namespace std;
int main(){
  char cad[100];
  cin.getline(cad, 100, '\n');
  int cub[100] = {0};
  for( int i = 0; i < strlen(cad); i++ ){
    cub[int(cad[i]-65)]++;
  }
  for( int i = 0; i < strlen(cad); i++ )
    if(cub[cad[i]-65] == 1){
      cout << i;
      break;
    }
  return 0;
}
