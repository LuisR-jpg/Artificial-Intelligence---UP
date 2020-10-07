//Todo tipo de dato
//Cuando se hace con clases propias hay que sobrecargar los cout, ==, etc
#include <iostream>
using namespace std;
class Persona{
  public: 
    string nombre;
    int edad;
    friend ostream &operator << (ostream &output, const Persona &p){
      output << p.nombre << ": " << p.edad;
      return output;
    }
    bool operator == (const Persona &p){ //Recibe uno, y el otro es this
      if( this -> nombre == p.nombre && this -> edad == p.edad ) 
	return true;
      return false;
    }
    bool operator != (const Persona &p){
      if( this -> nombre != p.nombre || this -> edad != p.edad )
	return true;
      return false;
    }
};
template<class Sarita> //Clase generica, como una variable para el tipo de dato
class SinglyLinkedList{
  public:
    class Node{
      public:
        Sarita data;
        Node *next;
        Node(Sarita data){
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
      Node *a = head;
      while( a ){
	Node *b = a -> next;
	delete a;
	a = b;
      }
      cout << "\t~SinglyLinkedList()" << endl;
    }
    void insert_head(Sarita data){
      Node *n = new Node(data);
      if( head ) n -> next = head;
      head = n;
    }
    void insert_tail(Sarita data){
      Node *n = new Node(data);
      if( !head ) head = n;
      else{
        Node *a = head;
        while( a -> next != NULL ) a = a -> next;
        a -> next = n;
      }
    }
    void remove(Sarita data){
      if( !head ) return;
      if( data == head -> data ){ //Awas, el == debe estar implementado
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
//  SinglyLinkedList<double> lista;
//  lista.insert_head(1);
//  lista.insert_head(2);
//  lista.insert_head(3);
////  cout << lista;
////  lista.remove(2);
////  lista.remove(5);
////  lista.remove(3);
////  lista.remove(1);
////  lista.remove(5);
//  lista.remove(3);
//  cout << lista;
  SinglyLinkedList<Persona> grupo;
  Persona a, b;
  a.nombre = "Lalito", a.edad = 15;
  b.nombre = "LuisR", b.edad = 20;
  grupo.insert_head(a);
  grupo.insert_tail(b);
  grupo.remove(a);
  cout << grupo;
  return 0;
}

