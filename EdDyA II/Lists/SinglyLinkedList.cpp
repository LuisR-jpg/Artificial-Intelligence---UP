//Enteros
#include <iostream>
using namespace std;
class SinglyLinkedList{
  public:
    class Node{
      public:
        int data;
        Node *next;
        Node(int data){
          cout << "\tNode(" << data << ")" << endl;
          this -> data = data;
          this -> next = NULL; //nullptr
        }
        ~Node(){
          cout << "\t~Node(" << data << ")" << endl;
        }
        friend ostream& operator << (ostream& output, const Node &n){
          output << "Data: " << n.data << "\tNext: " << n.next << endl;
          return output;
        }
    };
    Node* head;
    SinglyLinkedList(){
      head = NULL;
      cout << "\tSinglyLinkedList()" << endl;
    }
    ~SinglyLinkedList(){
      cout << "\t~SinglyLinkedList()" << endl;
      Node *a = head;
      while( a ){
	Node *b = a -> next;
	delete a;
	a = b;
      }
    }
    void insert_head(int data){
      Node *n = new Node(data);
      if( head ) n -> next = head;
      head = n;
    }
    void insert_tail(int data){
      Node *n = new Node(data);
      if( !head ) head = n;
      else{
        Node *a = head;
        while( a -> next != NULL ) a = a -> next;
        a -> next = n;
      }
    }
    void remove(int data){
      if( !head ) return;
      if( data == head -> data ){
	Node *a = head;
	head = head -> next;
	delete a;
      }
      else{
	Node *a = head;
	while( a -> next && a -> next -> data != data )
	  a = a -> next;
	if( a -> next ){
	  Node *b = a -> next;
	  a -> next = a -> next -> next;
	  delete b;
	}
      }
    }
    friend ostream &operator << (ostream &output, const SinglyLinkedList &l){
      Node *n = l.head;
      while( n ){
	output << *n;
	n = n -> next;
      }
      return output;
    }
};
int main(){
  SinglyLinkedList lista;
  lista.insert_head(1);
  lista.insert_head(2);
  lista.insert_head(3);
//  cout << lista;
//  lista.remove(2);
//  lista.remove(5);
//  lista.remove(3);
//  lista.remove(1);
//  lista.remove(5);
  cout << lista;
  return 0;
}

