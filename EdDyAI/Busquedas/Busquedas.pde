int n = 20;
void setup(){  
  Estudiante al[] = new Estudiante[n];
  for( int i = 0; i < n; i++ )
    al[i] = new Estudiante();
  printe(al);
  Estudiante alumno = secuencial(al, 10105);
  sorte(al);
  printe(al);
  println("\t" + (alumno == null? "No existe el estudiante": alumno));
  alumno = binaria(al, 10105);
  println("\t" + (alumno == null? "No existe el estudiante": alumno));
}
