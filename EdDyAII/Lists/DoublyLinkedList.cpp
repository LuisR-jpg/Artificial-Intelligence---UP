#include <iostream>
using namespace std;
class DoublyLinkedList{
  public:
    class Node{
      public: 
	int data;
	Node *prev, *next;
	Node(int data){
	  cout << "\tNode(" << data << ")" << endl;
	  this -> data = data;
	  this -> prev = this -> next = NULL;
	}
	~Node(){
	  cout << "\t~Node(" << data << ")" << endl;
	}
	friend ostream &operator << (ostream &output, const Node &n){
	  output << "Data: " << n.data << "\tPrev: " << n.prev << "\t&: " << &n << "\tNext: " << n.next << endl;
	  return output;
	}
    };
    Node *head, *tail;
    DoublyLinkedList(){
      head = tail = NULL;
      cout << "\tDoublyLinkedList()" << endl;
    }
    ~DoublyLinkedList(){
      Node *a = head;
      while( a ){
	Node *b = a -> next;
	delete a;
	a = b;
      }
      cout << "\t~DoublyLinkedList()" << endl;
    }
    void push_front(int data){
      Node *n = new Node(data);
      if( !head ) tail = n;
      else head -> prev = n;
      n -> next = head;
      head = n;
    }
    void push_back(int data){
      Node *n = new Node(data);
      if( !tail ) head = n;
      else tail -> next = n;
      n -> prev = tail;
      tail = n;
    }
    void pop_front(){
      if( !head ) return;
      Node *a = head;
      if( head == tail ) head = tail = NULL;
      else head = head -> next, head -> prev = NULL;
      delete a;
    }
    void pop_back(){
      if( !tail ) return;
      Node *a = tail;
      if( head == tail ) head = tail = NULL;
      else tail = tail -> prev, tail -> next = NULL;
      delete a;
    }
    void remove(int data){
      Node *a = head;
      while( a && a -> data != data ) a = a -> next;
      if( a == head && head == tail ) head = tail = NULL;
      if( !a ) return;
      if( a == head ) head -> next -> prev = NULL, head = head -> next;
      if( a == tail ) tail -> prev -> next = NULL, tail = tail -> prev;
      if( a -> prev ) a -> prev -> next = a -> next;
      if( a -> next ) a -> next -> prev = a -> prev;
      delete a;
    }
    void print_reverse(){
      Node *a = tail;
      while( a ){
	cout << *a;
	a = a -> prev;
      }
    }
    friend ostream &operator << (ostream &output, const DoublyLinkedList &l){
      Node *n = l.head;
      while ( n ){
	output << *n;
	n = n -> next;
      }
      return output;
    }
};
int main(){
  DoublyLinkedList lista;
  for( int i = 0; i < 100; i++ )
    lista.push_front(i);
  for( int i = 0; i < 105; i++ )
    lista.remove(i);
  for( int i = 0; i < 100; i++ )
    lista.push_front(i);
  for( int i = 0; i < 105; i++ )
    lista.pop_front();
  for( int i = 0; i < 100; i++ )
    lista.push_front(i);
  for( int i = 0; i < 105; i++ )
    lista.pop_back();
  for( int i = 0; i < 100; i++ )
    lista.push_back(i);
  for( int i = 0; i < 105; i++ )
    lista.pop_back();
  for( int i = 0; i < 100; i++ )
    lista.push_back(i);
  for( int i = 0; i < 105; i++ )
    lista.pop_front();
  cout << lista << endl;
  lista.push_front(0);
  lista.push_front(5);
  lista.push_front(1);
  cout << lista << endl;
  lista.print_reverse();
  return 0;
}
