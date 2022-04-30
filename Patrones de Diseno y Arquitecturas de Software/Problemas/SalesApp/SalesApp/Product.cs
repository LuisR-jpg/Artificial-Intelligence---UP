namespace SalesApp
{
    public class Product
    {
        private int id;
        private readonly string name;
        private float price;
        private int qty;
        public Product(int id, string name, float price, int qty)
        {
            this.id = id;
            this.name = name;
            this.price = price;
            this.qty = qty;
        }
        public void SetID(int id)
        {
            this.id = id;
        }
        public float GetPrice()
        {
            return price;
        }
        public void SetPrice(float price)
        {
            this.price = price;
        }
        public void SetQty(int qty)
        {
            this.qty = qty;
        }
        public int GetQty()
        {
            return this.qty;
        }
    }
    public class FrozenVegetables: Product
    {
        public FrozenVegetables(int id = 1, string name = "Frozen Vegetables", float price = 30.0f, int qty = 0): base(id, name, price, qty = 0) {}

    }
    public class Sodas : Product
    {
        public Sodas(int id = 2, string name = "Soda", float price = 20.0f, int qty = 0) : base(id, name, price, qty) { }

    }
    public class Breads : Product
    {
        public Breads(int id = 3, string name = "Bread", float price = 5.0f, int qty = 0) : base(id, name, price, qty) { }

    }
}
