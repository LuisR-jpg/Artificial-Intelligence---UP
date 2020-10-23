#include <iostream>
#include "BinarySearchTree.h"
using namespace std;
int p[1000], e[1000], n;
int index(int x){
  for(int i = 0; i < n; i++)
    if(p[i] == x) return i;
  return -1;
}
Node* makeTree(int i = 0, int l = 0, int r = n - 1){
  if(l == r) return NULL;
  Node *a = new Node(p[i]);
  int in = index(p[i]);
  //a -> left(makeTree( , l, in - 1);
  //a -> right(makeTree( , l + 1, in);
  return a;
}
int main(){
  BST t = createRandom();
  //BST t;
  //t.insert(2);
  //t.insert(1);
  preOrden(t.root);
  cout << endl;
  enOrden(t.root);
  cout << endl;
  n = en.size();
  for(int i = 0; i < n; i++)
    p[i] = pre[i], e[i] = en[i];
//  for(int i = 0; i < pre.size(); i++)
//    cout << p[i] << " " << e[i] << endl;
  cout << endl;
  postOrden(t.root);
  BST ans(makeTree());
  return 0;
}
