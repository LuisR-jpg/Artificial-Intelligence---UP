class MainClass {
    public static  void Main(string[] args) {
        Creator creator1 = new ConcreteCreatorA();
        Creator creator2 = new ConcreteCreatorB();

        Product product1 = creator1.FactoryMethod();
        Product product2 = creator2.FactoryMethod();
    }
}