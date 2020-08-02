public class Pieza{
	public String nombre;
	public String descripcion = "";
	public long cantidad = 1;
	public double precio;
	public Pieza(){}
	public Pieza(String nombre, double precio){
		this.nombre = nombre;
		this.precio = precio;
	}
	public Pieza(String nombre, String descripcion, long cantidad, double precio){
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.cantidad = cantidad;
		this.precio = precio;
	}
	public String toString(){
		return "Nombre: " + nombre + "\n" + "Descripcion: " + descripcion +
			"\nCantidad: " + cantidad + "\tPrecio: " + precio;
	}
}