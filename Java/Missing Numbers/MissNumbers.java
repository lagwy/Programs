import java.io.*;
import java.io.InputStreamReader;
import java.util.Arrays;

public class MissNumbers {
  public static void main(String[] args) {
    File file = new File("test.dat");
    try {
      FileInputStream fisFile = new FileInputStream("test.dat");
      BufferedReader brReader = new BufferedReader(new InputStreamReader(fisFile));
      int iNumber = Integer.parseInt(brReader.readLine());
      // Leer lineas del archivo
      // String sLinea;
      // while ((sLinea = brReader.readLine()) != null)   {
      String readLine = "";
      while ((readLine = brReader.readLine()) != null) {
          String[] numbers = readLine.split(" ");

          int[] intNumbers = new int[numbers.length] ;
          for (int j = 0; j < numbers.length; j++){
            intNumbers[j] = Integer.parseInt(numbers[j]);
          }
          // Sort array
          Arrays.sort(intNumbers);
          int first = intNumbers[0];
          String missing = "";
          int last = intNumbers[intNumbers.length - 1];
          for (int j = first + 1; j <= last - 1; j++){
            if (Arrays.binarySearch(intNumbers, j) < 0 ){
              if(j == last - 1)
                missing = missing + j;
              else
                missing = missing + j + " ";
            }
          }
            System.out.println(missing);
      }
    } catch (Exception e){
      System.out.println("Failed " + e);
    }
  }
}
