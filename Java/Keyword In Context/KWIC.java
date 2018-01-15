/*
*  KWIC.java
*
*  Programa que muestra las iteraciones de palabras de
*  frases leidas del usuario
*
*  Brogrammers
*  28 de agosto de 2016 V. 1
*/
import java.util.ArrayList;
import java.util.Arrays;
import java.io.*;
import java.io.InputStreamReader;

public class KWIC {
  static BufferedReader brReader = new BufferedReader(new InputStreamReader(System.in));

  ////////////////////////////////////////////////////
  // main
  // Funcion principal del programa, realiza llamadas
  // a otras funciones que integradas realizar
  // las permutaciones
  // Parametros:
  //  Sin parametros de usuario
  // Regresa:
  //  Nada
  ////////////////////////////////////////////////////
  public static void main(String[] args) {
    // Mostrar mensaje de equipo
    System.out.println("KWIC Brogrammers");

    // Variables locales del metodo
    String[] frases = obtenLineas(), permutaciones;

    // Metodo para mostrar las frases
    muestraLineas(frases);

    // Separador de lineas entre las leidas y las que se mostraran
    System.out.println("\n\nPermutaciones: ");
    permutaciones = generaPermutaciones(frases);
    Arrays.sort(permutaciones);

    // Modificar el orden de las frases
    muestraLineas(permutaciones);
  }

  ////////////////////////////////////////////////////
  // generaPermutaciones
  // Funcion que genera las permutaciones de las
  // palabras, la primer palabra la envia al final
  // Parametros:
  //  frases  Arreglo de strings que contiene las
  //          oraciones leidas del teclado
  // Regresa:
  //  permutaciones Arreglo de todas las permutaciones
  //                generadas
  ////////////////////////////////////////////////////
  public static String[] generaPermutaciones(String[] frases){
    ArrayList<String> permutaciones = new ArrayList<String>();
    String actual = "", test = "";
    int cantidadPalabras = 0;
    for (int i = 0; i < frases.length; i++){
      actual = frases[i];
      ArrayList<String> arrString = new ArrayList<String>(Arrays.asList(actual.split(" ")));
      cantidadPalabras = arrString.size();
      for(int j = 0; j < cantidadPalabras; j++){
        String first = arrString.get(0);
        arrString.add(first);
        arrString.remove(0);
        test = arrayToString(arrString.toArray(new String[arrString.size()]));
        permutaciones.add(test.toLowerCase());
      }
    }
    return permutaciones.toArray(new String[permutaciones.size()]);
  }

  ////////////////////////////////////////////////////
  // arrayToString
  // Funcion que recibe un arreglo de palabras y lo
  // convierte a un solo string integrado por todas
  // las palabras
  // Parametros:
  //  strArray  Arreglo de palabras a unir
  // Regresa:
  //  aux       String que contiene todas las palabras
  //            del arreglo
  ////////////////////////////////////////////////////
  public static String arrayToString(String[] strArray){
    String aux = "";
    for (int i = 0; i < strArray.length; i++){
      aux += strArray[i] + " ";
    }
    return aux;
  }

  ////////////////////////////////////////////////////
  // muestraLineas
  // Funcion que muestra en consola las lineas
  // contenidas en arreglo
  // Parametros:
  //  lineas  Arreglo con frases
  // Regresa:
  //  Nada
  ////////////////////////////////////////////////////
  public static void muestraLineas(String[] lineas){
    for (int i = 0; i < lineas.length; i++){
      System.out.println(lineas[i]);
    }
  }

  ////////////////////////////////////////////////////
  // obtenLineas
  // Funcion que lee las lineas introducidas
  // por el usuario mediante el teclado
  // Parametros:
  //  Sin parametros
  // Regresa:
  //  leidos  Arreglo de frases introducidas
  ////////////////////////////////////////////////////
  public static String[] obtenLineas(){
    String[] leidos = null;

    // Mostrar mensaje de apoyo al Programa
    System.out.println("Inserte la cantidad de lineas a procesar: ");
    try{
      int cantidad;
      cantidad = Integer.parseInt(brReader.readLine());
      leidos = new String[cantidad];
      for (int i = 0; i < cantidad; i++){
        leidos[i] = brReader.readLine();
      }

    } catch(Exception e){

    }
    return leidos;
  }

}
