#include <iostream>
#include "BinarySearchTree.h"
using namespace std;
int main(){
  //BST t = createRandom();
  BST t;
  t.insert(2);
  t.insert(1);
  preOrden(t.root);
  cout << endl;
  enOrden(t.root);
  cout << endl;
  postOrden(t.root);
  cout << endl;
  return 0;
}
