//Algoritmo que puede ser usado para ordenar cosas que no solo sean numeros.
void radix(Queue<Fecha> fechas){      //Se pasa como argumento una cola con fechas
  Queue<Fecha>[] aux = new Queue[10]; //Se declara una cola para poder utilizar sus casillas como cubetas
  for( int i = 0; i < 10; i++ )       //Visita cada casilla de la cola que recién creamos
    aux[i] = new LinkedList();        //Inicializa cada una como una lista enlazada para poder almacenar las fechas
  for( int i = 1; i < 9; i++ ){       //Se ordena la fecha en cada uno de sus 8 niveles (u_dia, d_dia, u_mes, d_mes, u_año, d_año, c_año, m_año)
    while( !fechas.isEmpty() ){       //Mientras aún haya cosas dentro de nuestra queue de fechas, las va a ordenar
      Fecha tem = fechas.poll();      //Se saca el elemento que esté en la queue
      aux[tem.nivel(i)].add(tem);     //Y se añade a la queue auxiliar el elemento, este es acomodado en su respectiva casilla dependiendo del nivel.
    }
    for( int j = 0; j < 10; j++ )     //Ahora se recorre la queue auxiliar completa
      while( !aux[j].isEmpty() )      //Se va a entrar al ciclo mientras aun existan elementos dentro de cada casilla
        fechas.add(aux[j].poll());    //Regresamos las fechas ya ordenadas en ese nivel a la queue original.
  }
} 
public class Fecha{  //Clase Fecha para que funcione radix
  int day, month, year;
  Fecha(){
    this.year = (int)random(1, 2021);
    this.month = (int)random(1, 13);
    this.day = (int)random(1, diaMonth(this.month, this.year)+1);
  }
  Fecha( int day, int month, int year ){
    this.year = year;
    this.month = month;
    this.day = day;
  }
  public int diaMonth(int m, int y){
    if( m == 2 ) return (y % 4 == 0 && y % 100 != 0) || y % 400 == 0? 29: 28;
    if( (m <= 7 && m % 2 == 1) || (m >= 8 && m % 2 == 0) ) return 31;   
    else return 30;
  }
  public String toString(){
    return day + "/" + toStringM(month) + "/" + year + " ";
  }
  private String toStringM(int m){
    switch(m){
      case 1: return "Ene";
      case 2: return "Feb";
      case 3: return "Mar";
      case 4: return "Abr";
      case 5: return "May";
      case 6: return "Jun";
      case 7: return "Jul";
      case 8: return "Ago";
      case 9: return "Sep";
      case 10: return "Oct";
      case 11: return "Nov";
      case 12: return "Dic";
    }
    return "Error";
  }
  public int nivel( int n ){
    switch(n){
      case 1: return day % 10;
      case 2: return day / 10;
      case 3: return month % 10;
      case 4: return month / 10;
      case 5: return year % 10;
      case 6: return (year / 10) % 10;
      case 7: return (year / 100) % 10;
      case 8: return year / 1000;
    }
    return -1;
  }
}
//Función para generar datos necesarios y poder probar radix sort
void fechas( int n ){
  Queue<Fecha> lista = new LinkedList();
  for( int i = 0; i < n; i++ ){
    Fecha aux = new Fecha();
    print(aux);
    lista.add(aux);
  }
  radix(lista);
  println();
  for( int i = 0; i < n; i++ )
    print(lista.poll());
}
