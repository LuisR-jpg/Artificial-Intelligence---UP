#include <iostream>
using namespace std;
int peso[] = {5, 3, 8}, ganancia[] = {1, 9, 16}, capacidad = 10;
//int peso[] = {1, 2, 2, 2}, ganancia[] = {5, 3, 2, 20}, capacidad = 5;
//int peso[] = {20, 10, 5}, ganancia[] = {1, 5, 5}, capacidad = 20;
const int n = sizeof(peso)/sizeof(int);
int res[n], ga = 0;
void mochila(int cap, int w[], int g[]){
  double obj[n][3];
  for( int i = 0; i < n; i++ ){
    obj[i][0] = peso[i];
    obj[i][1] = double(ganancia[i])/double(peso[i]);
    obj[i][2] = i;
  }
  for( int i = 0; i < n-1; i++ ){
    for( int j = i+1; j > 0 && obj[j][1] > obj[j-1][1]; j-- ){
      double aux[] = {obj[j][0], obj[j][1], obj[j][2]};
      obj[j][0] = obj[j-1][0]; obj[j][1] = obj[j-1][1]; obj[j][2] = obj[j-1][2];
      obj[j-1][0] = aux[0]; obj[j-1][1] = aux[1]; obj[j-1][2] = aux[2];
    }
  }
  for( int i = 0; i < n; i++ ){
    if( cap >= obj[i][0] ){
      res[int(obj[i][2])] = 1;
      cap -= obj[i][0];
      ga += obj[i][1] * obj[i][0];
    }
  }
  cout << "La ganancia es de: " << ga << endl;
  return;
}
int main(){
  mochila(capacidad, peso, ganancia);
  for(int i = 0; i < n; i++)
    cout << res[i] << " ";
  return 0; 
}
