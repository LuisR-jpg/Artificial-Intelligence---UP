#include <iostream>
using namespace std;
class Node{
  public: 
    int data;
    Node *left, *right;
    Node(int data){
      this -> data = data;
      this -> left = this -> right = NULL;
      cout << "\tNode(" << data << ")" << endl;
    }
    ~Node(){
      cout << "\t\t~Node(" << data << ")" << endl;
    }
    friend ostream &operator << (ostream &output, const Node &n){
      output << "Data: " << n.data << endl;
      return output;
    }
};
class BST{
  public: 
    Node *root;
    BST(){
      root = NULL;
      cout << "\tBST()" << endl;
    } 
    ~BST(){
      cout << "\t~BST()" << endl;
    }
    void insert(int data){
      Node *n = new Node(data);
      if(!root){
	root = n;
	return;
      }
      Node *a = root;
      for(;;){
	if(n -> data <= a -> data){
	  if(a -> left) a = a -> left;
	  else{
	    a -> left = n;
	    return;
	  }
	}
	else{
	  if(a -> right) a = a -> right;
	  else{
	    a -> right = n;
	    return;
	  }
	}
      }
    }
    bool contains(int data){
      Node *a = root;
      if( !a ) return false;
      while(a){
	if(data == a -> data) return true;
	else if(a -> left && data < a -> data) a = a -> left;
	else if(a -> right && data > a -> data) a = a -> right;
	else return false;
      }
      return false;
    }
    int remove(int data){
      Node *a = root;
      if( !a ) return -123;
      while(a){
	if(data == a -> data){
	  Node *b = a;
	  if(a -> left || a -> right){
	    if(a -> left){
	      a = a -> left;
	      while(a -> right) a -> right;
	    }
	    else{
	      a = a -> right;
	      while(a -> left) a -> left;
	    }

	  }
	  return a -> data;
	}
	else if(a -> left && data < a -> data) a = a -> left;
	else if(a -> right && data > a -> data) a = a -> right;
	else return false;
      }
      return false;
    }

    /*
    friend ostream &operator << (ostream &output, const BST &n){
      output << n.root -> data << endl;
      if( n.root -> left ) output << n.root -> left;
      if( n.root -> right ) output << n.root -> right;
      return output;
    }
    */
}; 
void preOrden(Node *r){
  cout << *r;
  if( r -> left ) preOrden(r -> left);
  if( r -> right ) preOrden(r -> right);
}
void enOrden(Node *r){
  if( r -> left ) enOrden(r -> left);
  cout << *r;
  if( r -> right ) enOrden(r -> right);
}
void postOrden(Node *r){
  if( r -> left ) postOrden(r -> left);
  if( r -> right ) postOrden(r -> right);
  cout << *r;
}
int main(){
  BST b;
  for(int i = -3; i < 12; i++)
    b.insert(i);
  preOrden(b.root);
  cout << endl;
  enOrden(b.root);
  cout << endl;
  postOrden(b.root);
  cout << endl;
  for(int i = -5; i < 15; i++)
    cout << i << ":\t" << b.contains(i) << endl;
  return 0;
}
