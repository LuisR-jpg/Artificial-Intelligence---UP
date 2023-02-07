/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package regex;
import java.util.regex.*;
import java.util.Scanner;
/**
 *
 * @author lalor
 */
public class RegEx {
    private static void checkMatch(String str, String pat){
        Pattern pattern = Pattern.compile(pat);
        Matcher matcher = pattern.matcher(str);
        System.out.println(pat + " " + (matcher.matches()? "si": "no") + " hace match en " + str);
    }
    public static void main(String[] args) {
        /*
        //One
        checkMatch("abc", "abc");
        checkMatch("abc", "cba");        
        checkMatch("abc", ".*abc.*");
        checkMatch("cba", ".*abc.*");
        checkMatch("abcxxx", "^abc.*");
        checkMatch("xxxabc", "^abc.*");
        checkMatch("Abc", "^[aA]bc.*");
        checkMatch("xabc", "^[aA]bc.*");
        checkMatch("aBCDe", "[a-zA-Z]{5,10}");
        checkMatch("hola", "[a-zA-Z]{5,10}");        
        checkMatch("123", "^[^\\d].*");
        checkMatch("x123", "^[^\\d].*");
        checkMatch("123", ".*[^\\d]$");
        checkMatch("123x", ".*[^\\d]$");
        checkMatch("aaa", "(a|b)+");
        checkMatch("xxx", "(a|b)+");
        checkMatch("123", ".*1(?!2).*");
        checkMatch("111", ".*1(?!2).*");
        */
        
        /*
        //Two
        Scanner sc = new Scanner(System.in);
        String email;
        System.out.println("Introduce email: ");
        email = sc.nextLine();
        checkMatch(email, "^[\\w-]+(\\.[\\w-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
        */
        
        /*
        //Tres
        if ("123".matches(".*1(?!2).*")) System.out.println("Si matchea");
        else System.out.println("No matchea");
        */
        
        String str = "blanco-rojo:amarillo.verde_azul";
        String [] cadenas = str.split("[-:._]");
        for(int i = 0; i<cadenas.length; i++)
            System.out.println(cadenas[i]);


    }
}
