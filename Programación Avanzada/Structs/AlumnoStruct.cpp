#include<iostream>
#include<string.h>
using namespace std;
struct Promedio{
    float nota1;
    float nota2;
    float nota3;
};
struct Alumno{
    char nombre[20];
    char sexo[10];
    int edad;
    struct Promedio prom;
} alumnos[100];
int main(){
    float promedio_alumno[100];
    int pos = 0, n;
    float mayor = 0;
    cout << "Ingrese la cantidad de alumnos a ingresar: " << endl; 
    cin >> n;
    for(int i = 0; i < n; i++){
        fflush(stdin);
        cout << "Nombre: "; cin.getline(alumnos[i].nombre,20,'\n');
        cout << "Sexo: "; cin.getline(alumnos[i].sexo,10,'\n');
        cout << "Edad: "; cin >> alumnos[i].edad;
        
        cout << "Notas de examen" << endl;
        cout << "Nota1: "; cin >> alumnos[i].prom.nota1;
        cout << "Nota2: "; cin >> alumnos[i].prom.nota2;
        cout << "Nota3: "; cin >> alumnos[i].prom.nota3;

        promedio_alumno[i] = (alumnos[i].prom.nota1+alumnos[i].prom.nota2+alumnos[i].prom.nota3)/3;
    
        if( promedio_alumno[i] > mayor )
        {
            mayor = promedio_alumno[i];
            pos = i;
        }
    }

    cout << endl;
    cout << "Nombre: " << alumnos[pos].nombre << endl;
    cout << "Sexo: " << alumnos[pos].sexo << endl;
    cout << "Edad: " << alumnos[pos].edad << endl;
    cout << "Promedio: " << promedio_alumno[pos] << endl;

    return 0;
}
