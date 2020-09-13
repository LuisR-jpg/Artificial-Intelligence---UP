#include <iostream>
int main(){
  int h;
  std::cin >> h;
  for( int i = 0, b = 2*h-2; i < h*2-1; i++, b-- )
    for( int j = 0; j < h*2-1; j++ )
      std::cout << (j == i || j == b? '*': ' ') << (j+2 == 2*h? "\n": "");
  return 0;
}
