using System;
using System.Collections.Generic;
using System.Drawing;
using ZXing;
using ZXing.Common;

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
            string text = Newtonsoft.Json.JsonConvert.SerializeObject(store);
            BarcodeWriter barcodeWriter = new BarcodeWriter();
            barcodeWriter.Format = BarcodeFormat.QR_CODE;
            Bitmap bitmap = barcodeWriter.Write(text);
            bitmap.Save("imagen.bmp");
        }
        public static void QRToStore()
        {
            Bitmap bitmap = new Bitmap("imagen.bmp");
            LuminanceSource source = new BitmapLuminanceSource(bitmap);
            BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(source));
            Result result = new MultiFormatReader().decode(binaryBitmap);
            Console.WriteLine(result.Text);
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
