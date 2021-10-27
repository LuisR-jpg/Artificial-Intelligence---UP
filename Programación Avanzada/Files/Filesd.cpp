#include <iostream>
#include <string>
#include <fstream>
using namespace std;
void write(){
    ofstream archivo;
    string nombre, frase;
    char res;
    cout<<"Nombre del archivo\n";
    getline(cin,nombre);
    archivo.open(nombre,ios::out);
    if(archivo.fail()){
        cout<<"No se pudo abrir\n";
        exit(1);
    }
    do{
        fflush(stdin);
        cout<<"Digite frase"<<endl;
        getline(cin,frase);
        archivo<<frase<<endl;
        cout<<"Agregar otra frase?(y/n)"<<endl;
        cin>>res;
    }
    while(res != 'n');
    archivo.close();
}
int main(){
  write();
  return 0;
}
