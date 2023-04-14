import java.util.*;
import java.io.*;

public class Prefix_Posfix_Stack {

    private static Stack<String> tokenize(String expression) {
        Stack s = new Stack();
        for (int i = expression.length() - 1; i >= 0; i--) 
            s.push("" + expression.charAt(i));
        return s;
    }

    private static Double calculate(Double a, Double b, char operador){
        Double result = 0.0;
        switch(operador){
            case '^':
                result = Math.pow(a, b);
                break;
            case '*':
                result = a * b;
                break;
            case '/':
                result = a / b;
                break;
            case '+':
                result = a + b;
                break;
            case '-':
                result = a - b;
                break;
            default:
                System.out.print(operador);
                System.out.print(" ");
                System.out.println("\tNo conozco ese operador. Sorry.");
                break;
        }
        return result;
    }

    public static void main(String[] args) {
        // Get expression
        Scanner input = new Scanner(System.in);
        System.out.println("Ingresar expresión:");
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
                '-', 10,
                '(', 0
        );

        while (!formula.empty()) {
            String x = formula.pop();
            
            char operator;

            // It's digit
            try {
                operando.push(Double.parseDouble(x));
                continue;
            } catch(NumberFormatException e) {
                assert x.length() == 1: String.format("(%s) no es reconocido como operador.", x);
                operator = x.charAt(0);
            }
            
            // Caso 1 y 2: vacío || "("
            if (operadores.empty() || operator == '(') 
                operadores.push(operator);
            else if (!operadores.empty()  && operator != ')') {
                char operador_top = operadores.peek();
                if (priorities.get(operator) > priorities.get(operador_top)) {
                    operadores.push(operator);
                    continue;
                }
                else{
                    Double b = operando.pop();
                    Double a = operando.pop();
                    char op = operadores.pop();
                    operando.push(calculate(a, b, op));
                    operadores.push(operator);
                }
            }
            else if (operator == ')'){
                do {
                    Double b = operando.pop(), a = operando.pop();
                    char op = operadores.pop();
                    operando.push(calculate(a, b, op));
                } while(operadores.peek() != '(');
                operadores.pop();
            }
        }
        while(!operadores.empty()){
            Double b = operando.pop();
            Double a = operando.pop();
            char operador = operadores.pop();
            operando.push(calculate(a, b, operador));
        }
        if(!operando.empty()) System.out.println(operando.pop());
    }
}