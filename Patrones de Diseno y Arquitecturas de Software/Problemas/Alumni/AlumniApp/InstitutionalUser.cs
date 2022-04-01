using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;

namespace AlumniApp
{
    abstract class InstitutionalUserCreator
    {
        public abstract InstitutionalUser createUser(); 
    }
    public abstract class InstitutionalUser
    {
        private static InstitutionalUser currentUser = null;
        protected List<Button> buttons = new List<Button>();
        protected ListView list = new ListView();
        public static InstitutionalUser LogIn()
        {
            Form logIn = new Welcome();
            Application.Run(logIn);
            return currentUser;
        }
        public static bool FindUser(string name, string password)
        {
            DataConnection conn = DataConnection.GetInstance();
            Data data = conn.GetData();
            string userName = cleanString(name);
            User user = data.users.Find(x => cleanString(x.fullName) == userName);
            if (user == null) return false;
            string hashedPassword = ComputeSha256Hash(password);
            if (hashedPassword != user.password) return false;
            CreateUser(user);
            return true;
        }
        private static void CreateUser(User user)
        {

            InstitutionalUserCreator creator = null;
            switch (user.role)
            {
                case "student":
                    creator = new StudentCreator();
                    break;
                case "teacher":
                    creator = new TeacherCreator();
                    break;
                case "supervisor":
                    creator = new SupervisorCreator();
                    break;
            }
            currentUser = creator.createUser();
        }
        private static string cleanString(String s)
        {
            return s.Replace(" ", String.Empty).ToLower();
        }
        private static string ComputeSha256Hash(string rawData)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                    builder.Append(bytes[i].ToString("x2"));
                return builder.ToString();
            }
        }
        public abstract List<Button> GetOptions();
        public abstract ListView GetInformation();
    }
    class StudentCreator: InstitutionalUserCreator
    {
        public override InstitutionalUser createUser()
        {
            return new Student();
        }
    }
    class TeacherCreator : InstitutionalUserCreator
    {
        public override InstitutionalUser createUser()
        {
            return new Teacher();
        }
    }
    class SupervisorCreator : InstitutionalUserCreator
    {
        public override InstitutionalUser createUser()
        {
            Button getInfo = new Button();

            return new Supervisor();
        }
    }
    class Student: InstitutionalUser
    {
        public override List<Button> GetOptions()
        {
            return buttons;
        }
        public override ListView GetInformation()
        {
            return list;
        }
    }
    class Teacher : InstitutionalUser
    {
        public override List<Button> GetOptions()
        {
            return buttons;
        }
        public override ListView GetInformation()
        {
            return list;
        }
    }
    class Supervisor : InstitutionalUser
    {
        public override List<Button> GetOptions()
        {
            Button getInfo = new Button();
            getInfo.Text = "View Profile Information";
            buttons.Add(getInfo);
            return buttons;
        }
        public override ListView GetInformation()
        {
            //list.Bounds = new Rectangle(new Point(10, 10), new Size(300, 200));

            // Set the view to show details.
            listView1.View = View.Details;
            // Allow the user to edit item text.
            listView1.LabelEdit = true;
            // Allow the user to rearrange columns.
            listView1.AllowColumnReorder = true;
            // Display check boxes.
            listView1.CheckBoxes = true;
            // Select the item and subitems when selection is made.
            listView1.FullRowSelect = true;
            // Display grid lines.
            listView1.GridLines = true;
            // Sort the items in the list in ascending order.
            listView1.Sorting = SortOrder.Ascending;

            // Create three items and three sets of subitems for each item.
            ListViewItem item1 = new ListViewItem("item1", 0);
            // Place a check mark next to the item.
            item1.Checked = true;
            item1.SubItems.Add("1");
            item1.SubItems.Add("2");
            item1.SubItems.Add("3");
            ListViewItem item2 = new ListViewItem("item2", 1);
            item2.SubItems.Add("4");
            item2.SubItems.Add("5");
            item2.SubItems.Add("6");
            ListViewItem item3 = new ListViewItem("item3", 0);
            // Place a check mark next to the item.
            item3.Checked = true;
            item3.SubItems.Add("7");
            item3.SubItems.Add("8");
            item3.SubItems.Add("9");

            // Create columns for the items and subitems.
            // Width of -2 indicates auto-size.
            listView1.Columns.Add("Item Column", -2, HorizontalAlignment.Left);
            listView1.Columns.Add("Column 2", -2, HorizontalAlignment.Left);
            listView1.Columns.Add("Column 3", -2, HorizontalAlignment.Left);
            listView1.Columns.Add("Column 4", -2, HorizontalAlignment.Center);

            //Add the items to the ListView.
            listView1.Items.AddRange(new ListViewItem[] { item1, item2, item3 });

            // Create two ImageList objects.
            ImageList imageListSmall = new ImageList();
            ImageList imageListLarge = new ImageList();

            // Initialize the ImageList objects with bitmaps.
            imageListSmall.Images.Add(Bitmap.FromFile("C:\\MySmallImage1.bmp"));
            imageListSmall.Images.Add(Bitmap.FromFile("C:\\MySmallImage2.bmp"));
            imageListLarge.Images.Add(Bitmap.FromFile("C:\\MyLargeImage1.bmp"));
            imageListLarge.Images.Add(Bitmap.FromFile("C:\\MyLargeImage2.bmp"));

            //Assign the ImageList objects to the ListView.
            listView1.LargeImageList = imageListLarge;
            listView1.SmallImageList = imageListSmall;

            // Add the ListView to the control collection.
            this.Controls.Add(listView1);
            return list;
        }
    }
}
