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
	  output << "\tPrev: " << n.prev << "\tData: " << n.data << "\tNext: " << n.next << endl;
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
      if( !head ) return;

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
//  lista.push_front(1);
//  lista.push_front(2);
//  lista.push_front(3);
//  lista.push_back(4);
//  lista.push_back(6);
//  lista.push_back(7);
//  cout << lista;
//  lista.pop_front();
//  lista.pop_front();
//  lista.pop_back();
//  lista.pop_back();
//  cout << lista;
//  lista.pop_back();
//  lista.pop_back();
//  lista.pop_back();
//  lista.pop_back();
  lista.pop_back();
  return 0;
}
