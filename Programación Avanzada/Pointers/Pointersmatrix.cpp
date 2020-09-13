#include <iostream>
using namespace std;
int main(){
  int **pm;
  int cols, rows;
  cout << "Ingrese rows: ";
  cin >> rows;
  cout << "Ingrese cols: ";
  cin >> cols;
  pm = new int*[rows];
  for( int i = 0; i < rows; i++ )
    pm[i] = new int[cols];
  for( int i = 0; i < rows; i++ ){
    for( int j = 0; j < cols; j++ ){
      pm[i][j] = i + j;
      cout << pm[i][j] << " --> ";
      cout << &pm[i][j] << endl;
    }
    cout << endl;
  }
  cout << endl;
  for( int i = 0; i < rows; i++ ){
    for( int j = 0; j < cols; j++ ){
      *(*(pm + i) + j) = i + j;
      cout << *(*(pm + i) + j) << " --> ";
      cout << (*(pm + i) + j) << endl;
    }
    cout << endl;
  }
  return 0;
}
