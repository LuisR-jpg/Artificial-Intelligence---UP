namespace SalesApp
{
    public class Product
    {
        public int idProduct;
        public readonly string name;
        private float price;
        public int quantity;
        public Product(int idProduct, string name, int quantity, float price)
        {
            this.idProduct = idProduct;
            this.name = name;
            this.price = price;
            this.quantity = quantity;
        }
        public void SetID(int idProduct)
        {
            this.idProduct = idProduct;
        }
        public float GetPrice()
        {
            return price;
        }
        public void SetPrice(float price)
        {
            this.price = price;
        }
        public void SetQty(int quantity)
        {
            this.quantity = quantity;
        }
        public int GetQty()
        {
            return this.quantity;
        }
    }
    public class FrozenVegetables : Product
    {
        public FrozenVegetables(int quantity = 0, string name = "Frozen Vegetables", int idProduct = 1, float price = 30.0f) : base(idProduct, name, quantity, price) { }

    }
    public class Sodas : Product
    {
        public Sodas(int quantity = 0, string name = "Soda", int idProduct = 2, float price = 20.0f) : base(idProduct, name, quantity, price) { }

    }
    public class Breads : Product
    {
        public Breads(int quantity = 0, string name = "Bread", int idProduct = 3, float price = 5.0f) : base(idProduct, name, quantity, price) { }

    }
}
