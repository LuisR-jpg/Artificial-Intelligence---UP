using System;
using System.Collections.Generic;
using System.Drawing;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;

namespace AlumniApp
{
    abstract class InstitutionalUserCreator
    {
        public abstract InstitutionalUser createUser(User user); 
    }
    public abstract class InstitutionalUser
    {
        private static InstitutionalUser currentUser = null;
        protected List<Button> buttons = new List<Button>();
        protected ListView list;
        protected Size listSize;
        public static InstitutionalUser LogIn()
        {
            Form logIn = new Welcome();
            logIn.Size = GraphicalInterface.formSize;
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
            currentUser = creator.createUser(user);
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
        protected ListView CreateList(int sX = 300, int sY = 65)
        {
            ListView l = new ListView();
            listSize = new Size(sX, sY);
            int posX = GraphicalInterface.formSize.Width / 2 - listSize.Width / 2;
            int posY = (GraphicalInterface.formSize.Height - listSize.Height);
            l.Bounds = new Rectangle(new Point(posX, 0), listSize);
            l.View = View.Details;
            l.LabelEdit = false;
            l.AllowColumnReorder = false;
            l.CheckBoxes = false;
            l.FullRowSelect = true;
            l.GridLines = false;
            l.Sorting = SortOrder.None;
            return l;
        }
    }
    class StudentCreator: InstitutionalUserCreator
    {
        public override InstitutionalUser createUser(User user)
        {
            return new Student();
        }
    }
    class TeacherCreator : InstitutionalUserCreator
    {
        public override InstitutionalUser createUser(User user)
        {
            return new Teacher();
        }
    }
    class SupervisorCreator : InstitutionalUserCreator
    {
        public override InstitutionalUser createUser(User user)
        {
            Button getInfo = new Button();

            return new Supervisor(user);
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
        private string fullName;
        private string role;
        public Supervisor(User user)
        {
            fullName = user.fullName;
            role = user.role;
        }
        public override List<Button> GetOptions()
        {
            Button getInfo = new Button();
            getInfo.Text = "View Profile Information";
            buttons.Add(getInfo);
            return buttons;
        }
        public override ListView GetInformation()
        {
            list = CreateList();
            ListViewItem nameItem = new ListViewItem("Name", 1);
            nameItem.SubItems.Add(fullName);
            ListViewItem roleItem = new ListViewItem("Role");
            roleItem.SubItems.Add(role);

            // Width of -2 indicates auto-size.
            list.Columns.Add("Property", -2, HorizontalAlignment.Left);
            list.Columns.Add("Value", -2, HorizontalAlignment.Left);

            list.Items.AddRange(new ListViewItem[] { nameItem, roleItem });
            return list;
        }
    }
}
