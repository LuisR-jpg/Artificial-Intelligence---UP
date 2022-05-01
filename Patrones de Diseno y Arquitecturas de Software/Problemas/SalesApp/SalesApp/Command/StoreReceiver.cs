using System;
using System.IO;
using System.Collections.Generic;
using System.Drawing;
using ZXing;
using ZXing.Common;
using Newtonsoft.Json;

namespace SalesApp
{
    public class Store
    {
        private int id;
        private string name;
        Product sodas, vegetables, breads;
        public bool canRaise, hasOrder;

        public Store(string name)
        {
            this.name = name;
            sodas = new Sodas();
            vegetables = new FrozenVegetables();
            breads = new Breads();
            canRaise = true;
            hasOrder = false;
        }
        public void SetID(int id)
        {
            this.id = id;
        }
        public int GetID()
        {
            return id;
        }
        public string GetName()
        {
            return name;
        }
        public void SetSodasQty(int qty)
        {
            sodas.SetQty(qty);
        }
        public void SetVegetablesQty(int qty)
        {
            vegetables.SetQty(qty);
        }
        public void SetBreadsQty(int qty)
        {
            breads.SetQty(qty);
        }
        public int GetSodasQty()
        {
            return sodas.GetQty();
        }
        public int GetVegetablesQty()
        {
            return vegetables.GetQty();
        }
        public int GetBreadsQty()
        {
            return breads.GetQty();
        }
        public float GetRevenue()
        {
            return GetSodasQty() * sodas.GetPrice() + GetBreadsQty() * breads.GetPrice() + GetVegetablesQty() * vegetables.GetPrice();
        }
        public static void StoreToQR(Store store)
        {
            string text = Newtonsoft.Json.JsonConvert.SerializeObject(new ExposedStore(store));
            BarcodeWriter barcodeWriter = new BarcodeWriter();
            barcodeWriter.Format = BarcodeFormat.QR_CODE;
            Bitmap bitmap = barcodeWriter.Write(text);
            string r = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
            r += "\\" + store.GetID().ToString() + store.GetName() + ".bmp";
            bitmap.Save(r);
        }
        public static void QRToStore()
        {
            string r = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
            List<Store> list = new List<Store>();
            DirectoryInfo d = new DirectoryInfo(r);
            FileInfo[] Files = d.GetFiles("*.bmp");
            foreach (FileInfo file in Files)
            {
                Bitmap bitmap = new Bitmap(r + "\\" + file.Name);
                LuminanceSource source = new BitmapLuminanceSource(bitmap);
                BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(source));
                Result result = new MultiFormatReader().decode(binaryBitmap);
                Console.WriteLine(result.Text);
                ExposedStore eStore = JsonConvert.DeserializeObject<ExposedStore>(result.Text);
                eStore.ToStore();
            }
        }
        public class ExposedStore
        {
            public int idStore;
            public string storeName;
            public List<Product> products;
            public ExposedStore() { }
            public ExposedStore(Store store)
            {
                this.idStore = store.GetID();
                this.storeName = store.GetName();
                products = new List<Product>();
                products.Add(new FrozenVegetables());
                products.Add(new Breads());
                products.Add(new Sodas());
            }
            public void ToStore()
            {
                SalesManager manager = new SalesManager(new NewStoreCommand(idStore, storeName, products[0].GetQty(), products[1].GetQty(), products[2].GetQty()));
                manager.Execute();
            }
        }
    }
    public class StoresComparer : IComparer<Store>
    {
        public int Compare(Store a, Store b)
        {
            return -1 * a.GetRevenue().CompareTo(b.GetRevenue());
        }
    }
}
