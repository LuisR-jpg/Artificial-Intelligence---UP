Estudiante secuencial( Estudiante[] e, int aidi ){ //Se recibe un conjunto de estudiantes, y el ID que se está buscando
  for( int i = 0; i < e.length; i++ )              //Se recorre el arreglo completo
    if( e[i].ID == aidi ) return e[i];             //Si se encuentra el identificador, hay que regresar el estudiante
  return null;
}
