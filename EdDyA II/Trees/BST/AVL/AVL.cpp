#include <iostream>
#include <algorithm>
using namespace std;
template<class dato>
class AVL{
  public:
    class Node{
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
	  if(!left) left = node, parent = this;
	  else left -> insert(node, root);
	}
	else{
	  if(!right) right = node, parent = this;
	  else right -> insert(node, root);
	}
	return mbalance(root);
      }
      Node *mbalance(Node *root){
	int lheight = left? left -> height: 0;
	int rheight = right? right -> height: 0;
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
	Node *p = node -> parent, *a = node, *b = node -> left;
	Node *su = b -> left, *sd = b -> right, *st = a -> right;
	a -> left = sd;
	if(sd) sd -> parent = a;
	b -> right = a, a -> parent = b;
	a -> mbalance(root);
	b -> mbalance(root);
	if(!p) return b;
	else if(p -> left == a) p -> left = b;
	else if(p -> right == a) p -> right = b;
	b -> parent = b;
	return root;
      }
      Node *rotate_left(Node *node, Node *root){
	return root;
      }
    };
    Node *root;
    AVL(){
      root = NULL;
    }






    ~AVL(){cout << "Implementa\n";}





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
    friend ostream &operator << (ostream &output, AVL &tree){
      if(tree.root) tree.print(tree.root);
      else output << "Arbol Vacío" << endl;
      return output;
    }
};
int main(){
  AVL<int> a;
  cout << a;
  return 0;
}
