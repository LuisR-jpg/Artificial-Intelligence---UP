#include <iostream>
using namespace std;
int deno[] = {100, 50, 20, 10, 5, 2, 1}, money[7];
void cambio(int dinero, int arr[]){
  for( int i = 0; i < 7; i++ ){
    arr[i] = dinero/deno[i];
    dinero %= deno[i];
  }
}
int main(){
  cout << "Ingrese la cantidad: ";
  int n;
  cin >> n;
  cambio(n, money);
  for( int i = 0; i < 7; i++ )
    cout << deno[i] << ": " << money[i] << endl;
  return 0;
}
