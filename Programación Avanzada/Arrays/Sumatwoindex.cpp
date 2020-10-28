#include <iostream>
using namespace std;
void target(int);
int nums[] = {2, 7, 11, 15};
int main(){
  target(9);
  return 0;
}
void target(int a){
  for( int i = 0; i < sizeof(nums)/sizeof(nums[0]); i++ ){
    for( int j = 0; j < sizeof(nums)/sizeof(nums[0]); j++ ){
      if( i != j && nums[i] + nums[j] == a ){
	cout << "En indices: " << i << " " << j << ". " << nums[i] << " + " << nums[j] << " = " << a << endl;
	return;
      }
    }
  }
  cout << "No existe la suma posible";
}

