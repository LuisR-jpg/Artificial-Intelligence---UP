#include <iostream>
#include "BinarySearchTree.h"
using namespace std;
int p[1000], e[1000], n, i = -1;
int index(int x){
  for(int i = 0; i < n; i++)
    if(e[i] == x) return i;
  return -1;
}
BST::Node* makeTree(int l = 0, int r = n - 1){
  i++;
  if(i >= n || l > r) return NULL;
  BST::Node *a = new BST::Node(p[i]);
  if(l == r) return a;
  int in = index(p[i]);
  if(l < in) a -> left = makeTree(l, in - 1);
  if(r > in) a -> right = makeTree(in + 1, r);
  return a;
}
int main(){
  //BST t;
  //t.insert(5);
  //t.insert(8);
  //t.insert(2);
  //t.insert(4);
  //t.insert(1);
  //t.insert(7);
  //t.insert(9);
  //t.insert(3);
  //t.insert(6);

  BST t = createRandom();

  t.preOrden();
  cout << endl;
  t.enOrden();
  cout << endl;
  t.postOrden();

  //pre = {2, 73, 50, 44, 22, 5, 44, 35, 48, 70, 54, 71, 83, 77, 99};
  //en = {2, 5, 22, 35, 44, 44, 48, 50, 54, 70, 71, 73, 77, 83, 99};
  //pre = {2, 3, 4, 1, 5};
  //en = {4, 3, 1, 2, 5};

  n = en.size();
  for(int i = 0; i < n; i++)
    p[i] = pre[i], e[i] = en[i];
  cout << endl << endl;
  BST ans = BST(makeTree());
  ans.preOrden();
  cout << endl;
  ans.enOrden();
  cout << endl;
  ans.postOrden();
  cout << endl;
  return 0;
}
