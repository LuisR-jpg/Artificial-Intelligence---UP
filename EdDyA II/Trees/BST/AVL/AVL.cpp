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
  	    if(!left){
	      left = node;
	      node -> parent = this;
	    }
  	    else left -> insert(node, root);
  	  }
  	  else{
  	    if(!right){
	      right = node;
	      node -> parent = this;
	    }
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
  cout << a << endl;
  a.printTree();
  return 0;
}
