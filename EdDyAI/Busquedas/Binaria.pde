//Busqueda binaria. O(logn) 
Estudiante binaria( Estudiante[] e, int aidi ){  //Se recibe un arreglo de alumnos y ID 
  int i = 0, f = e.length-1;                     //Se definen los punteros del inicio y fin
  while( i <= f ){                               //Mientras el inicio se corresponda a su mitad, se entrará al while
    int m = (i + f)/2;                           //Se calcula el valor medio para buscar el elemento
    if( e[m].ID < aidi ) i = m+1;                //Si el elemento que se busca es mayor al actual, se busca en la mitad derecha
    else if( e[m].ID > aidi ) f = m-1;           //Si no, la busqueda se va a hacer en la primera mitad
    else return e[m];                            //Si ninguna de esas opciones, significa que se encontró el elemento y lo vamos a regresar
  }
  return null;                                   //Si no se encontró, se regresa un null
}
public class Estudiante{
  String nombre, apellido, carrera;
  int ID;
  Estudiante(){
    String[] nombres = {"Ulises","Sara","Luis","Chris","Scarlett","Fernanda","Pedro","Raul","Karla"};
    String[] apellidos = {"Robles","Gomez","Sanchez","de Luna","Leos","Carreño"};
    String[] carreras = {"IIA","IM","IBE"};
    nombre = nombres[(int)random(nombres.length)];
    apellido = apellidos[(int)random(apellidos.length)];
    carrera = carreras[(int)random(carreras.length)];
    ID = (int)random(10100, 10130);
  }
  public String toString(){
    return Integer.toString(ID) + " " + carrera + " " + nombre + " " + apellido;
  }
}
