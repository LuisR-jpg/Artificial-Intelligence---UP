/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package codigo;

/**
 *
 * @author scago
 */
import java.io.File;

public class Principal {
    public static void main(String[] args) {
        String ruta = "C:\\Users\\scago\\Documents\\GitHub\\IA_School\\Semestres\\Compiladores\\Java\\Go_LexicalAnalyzer\\src\\codigo\\Lexer.flex";
        generarLexer(ruta);
    }
    public static void generarLexer(String ruta){
        File archivo = new File(ruta);
        JFlex.Main.generate(archivo);
    }
}