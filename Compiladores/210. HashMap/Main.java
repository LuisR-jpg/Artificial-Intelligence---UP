// Import the HashMap class
import java.util.HashMap;
import java.util.Scanner;

public class Main {
  public static void main(String[] args) {
  	Scanner s = new Scanner(System.in);
    HashMap<String, String> sites = new HashMap<String, String>();
	for(int i = 0; i < 5; i++){
        System.out.print("Insert Key: ");
    	String l = s.nextLine();
        if(sites.containsKey(l)){
        	System.out.println("Key already exists");
            i--;
        }
        else {
          System.out.print("Insert Value: ");
        	String c = s.nextLine();
            sites.put(l, c);
        }
    }
    for (String i: sites.keySet()) {
      System.out.println("Alias: " + i + "\tSite: " + sites.get(i));
    }
  }
}
