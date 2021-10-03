import java.util.*;
import java.io.*;
public class SistemaAlmacenamiento{
	static List<Pieza> estante = new ArrayList<Pieza>();
	static Scanner cin = new Scanner(System.in);
	public static void main(String[] args){	
		System.out.println("---Sistema de Almacenamiento---");
		while(true){
			int x = -1;
			while(x > 4 || x < 0)
				x = desplegar();
			if( x == 0 )
				break;
			else if( x == 1 ){
				Pieza pieza = ingresar();
				System.out.println(pieza);
				agregar(pieza);
			}
			else if( x == 2 )
				for( Pieza i: estante )
					System.out.println(i);
			else if( x == 3 )
				for( int i = 0; i < estante.size(); i++ )
					System.out.println((i+1) + ". " + estante.get(i).nombre);	
			else if( x == 4 ){
				for( int i = 0; i < estante.size(); i++ )
					System.out.println((i+1) + ". " + estante.get(i));
				int a = cin.nextInt();
				estante.remove(a-1);
			}
		}
		return;
	}
	static int desplegar(){
		String[] opciones = {"Salir", "Agregar", "Consulta", "Actualizar", "Borrar"};
		for( int i = 0; i < opciones.length; i++ )
			System.out.println(i + ". " + opciones[i]);
		int res = cin.nextInt();
		if( res >= opciones.length ){
			System.out.println("Valor de entrada invalido");
			return 1000;
		}
		return res;
	}
	static Pieza ingresar(){
		cin.nextLine();
		String nombre, descripcion;
		int cantidad;
		double precio;
		nombre = cin.nextLine();
		descripcion = cin.nextLine();
		cantidad = cin.nextInt();
		precio = cin.nextDouble();
		return new Pieza(nombre, descripcion, cantidad, precio);
	}
	static void agregar(Pieza pieza){	
		estante.add(pieza);
		for( int i = estante.size()-1; i > 0; i-- ){
			Pieza aux = estante.get(i-1);
			String nom1 = aux.nombre;
			System.out.println(nom1 + " " + nom1.charAt(0));
			if( aux.nombre.charAt(0) > estante.get(i).nombre.charAt(0) )
				Collections.swap(estante, i-1, i);
		}
	}
}