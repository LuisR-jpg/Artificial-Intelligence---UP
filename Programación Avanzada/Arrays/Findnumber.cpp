#include <iostream>
using namespace std;
int num[] = {1, 3, 5, 6};
int find(int);
int main(){
  cout << find(5);
  return 0;
}
int find(int a){
  for( int i = 0; i < sizeof(num)/sizeof(num[0]); i++ ){
    if( num[i] >= a )
      return i;
  }
  return sizeof(num)/sizeof(num[0]);
}
