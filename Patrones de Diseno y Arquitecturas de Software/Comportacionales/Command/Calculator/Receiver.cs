namespace Calculator 
{
    public class Receiver 
    {
        float number;
        float result;
        char o;
        public Receiver()
        {
            number = 0;
        }
        public void SetNumber(float number)
        {
            this.number = number;
        }
        public void Seto(char o)
        {
            this.o = o;
        }
        public float Operation()
        {
            float r = 0;
            switch(o)
            {
                case '+':
                    r = Sum();
                    break;
                case '-':
                    r = Substract();
                    break;
                case '*':
                    r = Multiply();
                    break;
                case '/':
                    r = Divide();
                    break;
                case '=':
                    r = Equals();
                    break;
                default:
                    r = result = number;
                    break;
            }
            return r;
        }
        public float Sum()
        {
            this.result += number;
            return result;
        }
        public float Substract()
        {
            this.result -= number;
            return result;
        }
        public float Multiply()
        {
            this.result *= number;
            return result;
        }
        public float Divide()
        {
            this.result /= number;
            return result;
        }
        public float Equals()
        {
            return result;
        }
    }
}