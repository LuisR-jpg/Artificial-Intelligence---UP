#include <iostream>
using namespace std;
class BST{
  public: 
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
    Node *root;
    BST(){
      root = NULL;
      cout << "\tBST()" << endl;
    } 
    ~BST(){
      cout << "\tBST()" << endl;
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
    /*
    friend ostream &operator << (ostream &output, const BST &n){
      output << n.root -> data << endl;
      if( n.root -> left ) output << n.root -> left;
      if( n.root -> right ) output << n.root -> right;
      return output;
    }
    */
}; 
void print(BST r){
  cout << r.root << endl;
  if( r.root -> left ) print(r.root -> left);
  if( r.root -> right ) print(r.root -> right);
}
int main(){
  BST b;
  for(int i = 0; i < 10; i++)
    b.insert(i);
  print(b.root);
  return 0;
}
