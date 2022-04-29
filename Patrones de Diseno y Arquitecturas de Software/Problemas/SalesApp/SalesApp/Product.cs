namespace SalesApp
{
    public class Product
    {
        private int id;
        private readonly string name;
        private float price;
        public Product(int id, string name, float price)
        {
            this.id = id;
            this.name = name;
            this.price = price;
        }
        public void SetID(int id)
        {
            this.id = id;
        }
        public void SetPrice(float price)
        {
            this.price = price;
        }
    }
    public class FrozenVegetables: Product
    {
        public FrozenVegetables(int id = -1, string name = "Frozen Vegetables", float price = 30.0f): base(id, name, price) {}

    }
    public class Soda : Product
    {
        public Soda(int id = -1, string name = "Soda", float price = 20.0f) : base(id, name, price) { }

    }
    public class Bread : Product
    {
        public Bread(int id = -1, string name = "Bread", float price = 5.0f) : base(id, name, price) { }

    }
}
