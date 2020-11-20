#include <iostream>
#include <algorithm>
using namespace std;
template<class dato>
class AVL{
  public:
    class Node{
      public: 
        dato data;
        Node *left, *right, *parent;
        int balance, height;
        Node(dato d){
	  data = d;
  	  left = right = parent = NULL;
  	  balance = 0, height = 1;
        }
        ~Node(){}
        Node* insert(Node *node, Node *root){
	  if(node -> data <= data){
  	    if(!left) left = node, node -> parent = this;
  	    else left -> insert(node, root);
  	  }
  	  else{
  	    if(!right) right = node, node -> parent = this;
  	    else right -> insert(node, root);
  	  }
  	  return mbalance(root);
        }
        Node *mbalance(Node *root){
	  int lheight = (left? left -> height: 0);
	  int rheight = (right? right -> height: 0);
      	  height = max(lheight, rheight) + 1;
      	  balance = lheight - rheight;
      	  if(balance == -2 && right -> balance <= 0) root = rotate_left(this, root);
      	  else if(balance == -2 && right -> balance == 1){
      	    root = rotate_right(right, root);
      	    root = rotate_left(this, root);
      	  }
      	  else if(balance == 2 && left -> balance == -1){
      	    root = rotate_left(left, root);
      	    root = rotate_right(this, root);
      	  }
      	  else if(balance == 2 && left -> balance >= 0) root = rotate_right(this, root);
      	  return root;
        }
        Node *rotate_right(Node *node, Node *root){
	  Node *p = node -> parent, *a = node, *b = node -> left, *sd = b -> right;
  	  a -> left = sd;
  	  if(sd) sd -> parent = a;
  	  b -> right = a, a -> parent = b;
  	  b -> parent = p;
  	  if(!p){
	    a -> mbalance(root);
  	    b -> mbalance(root);
	    return b;
	  }
  	  else if(p -> left == a) p -> left = b;
  	  else if(p -> right == a) p -> right = b;
  	  a -> mbalance(root);
  	  b -> mbalance(root);
  	  return root;
        }
        Node *rotate_left(Node *node, Node *root){
	  Node *p = node -> parent, *b = node, *a = node -> right, *sd = a -> left;
	  b -> right = sd;
	  if(sd) sd -> parent = b;
	  a -> left = b, b -> parent = a;
	  a -> parent = p;
	  if(!p){
	    b -> mbalance(root);
	    a -> mbalance(root);
	    return a;
	  }
	  else if(p -> left == b) p -> left = a;
	  else if(p -> right == b) p -> right = a;
	  b -> mbalance(root);
	  a -> mbalance(root);
	  return root;
        }
    };
    Node *root;
    AVL(){
      root = NULL;
    }
    ~AVL(){
      if(root) destruir(root);
    }
    void destruir(Node *n){
      if(n -> left) destruir(n -> left);
      if(n -> right) destruir(n -> right);
      delete n;
    }
    void insert(dato data){
      Node *n = new Node(data);
      if(!root) root = n;
      else root = root -> insert(n, root);
    }
    Node* _search(dato data){
      Node *p = NULL, *n = root;
      while(n){
	if(data < n -> data) p = n, n = n -> left;
	else if(data > n -> data) p = n, n = n -> right;
	else return p;
      }
      return NULL;
    }
    void _remove(Node *p, Node *n){
      if(!(n -> left || n -> right)){
	if(!p) root = NULL;
	else if(p -> left == n) p -> left = NULL;
	else if(p -> right == n) p -> right = NULL;
      }
      else if((!n -> left && n -> right) || (n -> left && !n -> right)){
	if(!p){
	  if(n -> left) root = n -> left;
	  else if(n -> right) root = n -> right;
	}
	else if(p -> left == n){
	  if(n -> left) p -> left = n -> left;
	  else if(n -> right) p -> left = n -> right;
	}
	else if(p -> right == n){
	  if(n -> left) p -> right = n -> left;
	  else if(n -> right) p -> right = n -> right;
	}
      }
      else if(n -> left && n -> right){
	Node *pd = n, *nd = n -> left;
	while(nd -> right) pd = nd, nd = nd -> right;
	_remove(pd, nd);
	nd -> left = n -> left;
	nd -> right = n -> right; 
	if(!p) root = nd;
	else if(p -> left == n) p -> left = nd;
	else if(p -> right == n) p -> right = nd;
      }
    }
    void remove(dato data){
      Node *p = _search(data), *n;
      if(p) n = (p -> left && p -> left -> data == data? p -> left: p -> right);
      else n = root;
      if(!n || n -> data != data) return;
      _remove(p, n);
      delete n;
      if(root){
	if(!p) root -> mbalance(root);
	else root -> mbalance(p);
      }
    }
    void print(Node *r, int i = 0){
      if(r -> left) print(r -> left, i + 1);
      for(int a = 0; a < i; a++, cout << "\t");
      cout << r -> data << endl;
      if(r -> right) print(r -> right, i + 1);
    }
    void printTree(){
      if(!root) cout << "Arbol Vacio";
      else cout << _print(root);
      cout << endl;
    }
    string _print(Node *n, string sp = ""){
      string s = sp + to_string(n -> data) + "\tH: " + to_string(n -> height) + "\tB: " + to_string(n -> balance) + "\n";
      if(n -> left) s += _print(n -> left, sp + "\tL: ");
      if(n -> right) s += _print(n -> right, sp + "\tR: ");
      return s;
    }
    friend ostream &operator << (ostream &output, AVL &tree){
      if(tree.root) tree.print(tree.root);
      else output << "Arbol Vacio" << endl;
      return output;
    }
};
int main(){
  AVL<int> a;
  //int arr[] = {10, 5, 1};
  int arr[] = {72, 66, 81, 18, 60, 53, 48, 27, 10, 50, 9, 40, 45};
  //int arr[] = {1, 2, 3, 4, 5, 6};
  //int arr[] = {5, 4, 3, 2, 1, 10};
  int n = sizeof(arr)/sizeof(arr[0]);
  for(int i = 0; i < n; i++) a.insert(arr[i]);
  //cout << a << endl;
  a.printTree();
  /*
  for(int i = 0; i < n; i++) a.remove(arr[i]);
  */
  //cout << a << endl;

    a.remove(48);
    a.printTree();
    a.remove(72);
    a.remove(66);
    a.remove(81);
    a.remove(18);
    a.remove(60);
    a.remove(53);
    a.printTree();
    a.remove(27);
    a.remove(10);
    a.remove(50);
    a.remove(9);
    a.remove(40);
    a.remove(45);
    a.printTree();
  return 0;
}
