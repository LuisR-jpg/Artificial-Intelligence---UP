import java.util.*;
import java.io.*;

public class Prefix_Posfix_Stack {

    private static Stack<String> tokenize(String expression) {
        Stack s = new Stack();
        for (int i = expression.length() - 1; i >= 0; i--) 
            s.push("" + expression.charAt(i));
        return s;
    }

    public static void main(String[] args) {
        // Get expression
        Scanner input = new Scanner(System.in);
        System.out.println("Ingrese una expresión:");
        String expresion = input.nextLine();
        
        Stack<String> formula = tokenize(expresion);
        Stack<Double> operando = new Stack<>();
        Stack<Character> operadores = new Stack<>();
        int res = 0;
        Map<Character, Integer> priorities = Map.of(
                ')', 40,
                '^', 30,
                '*', 20,
                '/', 20,
                '+', 10,
                '-', 10
        );


        while (!formula.empty()) {
            String x = formula.pop();
            
            char operator;

            System.out.println(x);

            // It's digit
            try {
                operando.push(Double.parseDouble(x));
                System.out.println("Digit");
                continue;
            } catch(NumberFormatException e) {
                assert x.length() == 1: String.format("(%s) no es reconocido como operador.", x);
                operator = x.charAt(0);
            }
            
            // Caso 1 y 2: vacío || "("
            if (operadores.empty() || operator == '(') 
                operadores.push(operator);
            else if (!operadores.empty()) {
                char operador_top = operadores.peek();
                if (priorities.get(operator) > priorities.get(operador_top)) {
                    operadores.push(operator);
                    continue;
                }
                else{
                    Double b = operando.pop();
                    Double a = operando.pop();
                    char op = operadores.pop();
                    System.out.print(a+" "+b+" "+op);
                    switch(op){
                        case '^':
                            operando.push(Math.pow(a, b));
                            break;
                        case '*':
                            operando.push(a*b);
                            break;
                        case '/':
                            operando.push(a/b);
                            break;
                        case '+':
                            break;
//                                int resultado = a + b;
//                                char resultadoChar = Character.forDigit(resultado, 10);
//                                operando.push(resultadoChar);
//                                operadores.pop();
//                                System.out.print("\n"+resultadoChar);
                        case '-':
                            operando.push(a-b);
                            break;
                        default:
                            System.out.print("\nNo conozco ese operador. Sorry.");
                            break;
                    }
                }
            }
            else if (operator == ')'){
                continue;
            }
        }
        if(!operando.empty()) System.out.println(operando.pop());
    }
}