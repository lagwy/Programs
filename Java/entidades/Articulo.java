package entidades;
import java.util.*;

public class Articulo {
	private int id;
	private String nombre;
	private String fecha;
	private String formato;
	private int ejemplaresVendidos;
	private EditorenJefe editJefe;
	private Vector <Autor> autores;
	private Vector <Juez> jueces;

	public void buscarArticulo(String nombre) {

	}
	public boolean verificarRepetido(String fecha, String autor){
		return true;
	}
}