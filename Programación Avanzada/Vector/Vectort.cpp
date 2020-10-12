#include <iostream>
#include <vector>
using namespace std;
int main(){
  vector<vector<int>> mat(3, vector<int>(3, 7));
  mat[1].push_back(8);
  //Push_back mete el argumento, emplace_back construye el objeto y luego lo mete
  //vect.emplace_back('a', 24); //Util para strings y pairs
  mat.push_back(vector<int>(10, 8));
  for( int i = 0; i < (int)mat.size(); i++ ){
    for( int j = 0; j < (int)mat[i].size(); j++ ){
      cout << mat[i][j] << " ";
    }
    cout << endl;
  }
  return 0;
}
