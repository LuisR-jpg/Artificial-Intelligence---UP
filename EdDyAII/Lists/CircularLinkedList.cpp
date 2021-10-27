#include <iostream>
using namespace std;
class CircularLinkedList{
  public:
    class Node{
      public: 
	int data;
	Node *next;
	Node(int data){
	  cout << "\tNode(" << data << ")" << endl;
	  this -> data = data;
	  this -> next = next;
	}
	~Node(){
	  cout << "\t~Node(" << data << ")" << endl;
	}
	friend ostream &operator << (ostream &output, const Node &n){
	  output << "Data: " << n.data << "\t&: " << &n << "\tNext: " << n.next << endl;
	  return output;
	}
    };
    Node *head;
    CircularLinkedList(){
      head = NULL;
      cout << "\tCircularLinkedList()" << endl;
    }
    ~CircularLinkedList(){
      if( head ){
	Node *a = head;
      	do{
      	  Node *b = a -> next;
      	  delete a;
      	  a = b;
      	} 
      	while( a != head );
      }
      cout << "\t~CircularLinkedList()" << endl;
    }
    void insert_head(int data){
      Node *n = new Node(data);
      if( !head ) head = n;
      Node *a = head;
      n -> next = head;
      while( a -> next != head ) a = a -> next;
      a -> next = head = n;
    }
    void insert_tail(int data){
      Node *n = new Node(data);
      if( !head ) head = n;
      Node *a = n -> next = head;
      while( a -> next != head ) a = a -> next;
      a -> next = n;
    }
    void remove(int data){
      Node *b, *a = head;
      if( !a ) return;
      bool h = head -> data != data;
      while( a -> next != head ){
	if( h && a -> next -> data == data ) break;
	a = a -> next;
      }
      b = a -> next;
      if( b -> data != data ) return;
      a -> next = a -> next -> next;
      if( !h ) head = (head == head -> next? NULL: a -> next);
      delete b;
    }
    friend ostream &operator << (ostream &output, const CircularLinkedList &l){
      Node *a = l.head;
      if( !a ) return output;
      do{
	output << *a;
	a = a -> next;
      }
      while( a != l.head );
      return output;
    }
};
int main(){
  CircularLinkedList lista;
  for( int i = 0; i < 10; i++ )
    lista.insert_head(10-1-i);
  for( int i = 10; i < 20; i++ )
    lista.insert_tail(i);
  lista.remove(0);
  lista.remove(100);
  lista.remove(19);
  lista.remove(9);
  for( int i = 3; i < 11; i++ )
    lista.remove(i);
  cout << lista;
  return 0;
}
