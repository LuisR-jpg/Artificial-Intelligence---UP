import java.util.*;
import java.io.*;

public class Prefix_Posfix_Stack {

    private static Stack tokenize(String expression) {
        Stack s = new Stack();

        return s;
    }

    public static void main(String[] args) {
        Stack s = new Stack();
        Stack<Character> operando = new Stack<>();
        Stack<Character> operadores = new Stack<>();
        Scanner input = new Scanner(System.in);
        String expresion;
        int res=0;
        Map<Character, Integer> priorities = Map.of(
                ')', 1,
                '^', 2,
                '*', 3,
                '/', 3,
                '+', 4,
                '-', 4
        );

        // Get expression
        System.out.print("Ingrese una expresión:\n");
        expresion = input.nextLine();

        // Store expression
        for (int i = expresion.length() - 1; i >= 0; i--) {
            s.push(expresion.charAt(i));
        }

        while (!s.empty()) {
            String x = s.peek();
            if (Character.isDigit(x)) {                           //operando
                operando.push(x);
            } else {                                                  //operador
                // Caso 1 y 2: vacío || "("
                if (operadores.empty() || x == '(') {
                    operadores.push(x);
                } else {
                    char operador_top = operadores.peek();
                    if (priorities.get(x) > priorities.get(operador_top)) {
                        operadores.push(x);
                    }else{
                        int a = Character.getNumericValue(operando.pop());
                        int b = Character.getNumericValue(operando.pop());
                        int op = (char)operadores.pop();
                        System.out.print(a+" "+b+" "+op);
                        switch(op){
                            case '^':
                                operando.push((char)(a^b));
                                break;
                            case '*':
                                operando.push((char)(a*b));
                                break;
                            case '/':
                                operando.push((char)(a/b));
                                break;
                            case '+':
//                                int resultado = a + b;
//                                char resultadoChar = Character.forDigit(resultado, 10);
//                                operando.push(resultadoChar);
//                                operadores.pop();
//                                System.out.print("\n"+resultadoChar);
                                break;
                            case '-':
                                operando.push((char)(a-b));
                                break;
                            default:
                                System.out.print("\nNo conozco ese operador. Sorry.");
                                break;
                        }
                        
                        
                    }
                }

            }
            s.pop();
            
        }
    }
}