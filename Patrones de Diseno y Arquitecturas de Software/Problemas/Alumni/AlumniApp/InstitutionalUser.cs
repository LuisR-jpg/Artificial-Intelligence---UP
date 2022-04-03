using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;

namespace AlumniApp
{
    /// <summary>
    /// Abstract Creator of the Factory Method Pattern
    /// </summary>
    abstract class InstitutionalUserCreator
    {
        public abstract InstitutionalUser createUser(User user); 
    }
    /// <summary>
    /// Abstract Product of the Factory Method Pattern
    /// </summary>
    public abstract class InstitutionalUser
    {
        private static InstitutionalUser currentUser = null;
        protected List<Button> buttons = new List<Button>();
        protected Size listSize;
        protected Dictionary<string, string> info = new Dictionary<string, string>();
        public static InstitutionalUser LogIn()
        {
            Form logIn = new Welcome
            {
                Size = GraphicalInterface.formSize,
                StartPosition = FormStartPosition.CenterScreen,
                FormBorderStyle = FormBorderStyle.FixedDialog,
                MaximizeBox = false,
                MinimizeBox = false
            };
            logIn.ShowDialog();
            return currentUser;
        }
        public static bool ValidateUser(string name, string password)
        {
            DataConnection conn = DataConnection.GetInstance();
            User user = conn.FindUserByName(name); 
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
        public abstract List<Control> GetGrades();
        public abstract List<string> DownloadGrades();
        public string GetName()
        {
            return info["Name"];
        }
        protected Button CreateButton(string name = "Information", string text = "View Profile Information", int n = 0)
        {
            int yS = 100, xS = 300;
            return new Button
            {
                Text = text,
                Name = name,
                Size = new Size(xS, yS),
                Location = new Point(GraphicalInterface.formSize.Width / 2 - xS / 2, n*yS + 75)
            };
        }
        public Label CreateLabel(string text)
        {
            int lblWidth = 150;
            Label lbl = new Label
            {
                Text = text,
                Location = new Point(GraphicalInterface.formSize.Width / 2 - lblWidth / 2, 15),
                Size = new Size(lblWidth, 35),
                BackColor = Color.White,
                TextAlign = ContentAlignment.MiddleCenter,
                ForeColor = Color.Black,
                Font = new Font(FontFamily.GenericSansSerif, 15, FontStyle.Italic),
                BorderStyle = BorderStyle.FixedSingle
            };
            return lbl;
        }
        protected virtual TreeView CreateTree()
        {
            int sX = 300, sY = 150;
            TreeView tree = new TreeView
            {
                Size = new Size(sX, sY),
                Location = new Point(GraphicalInterface.formSize.Width / 2 - sX / 2, 10)                
            };
            return tree;
        }
        public Form CreateForm(string title, string returnBtn)
        {
            Form form = new Form
            {
                Size = GraphicalInterface.formSize,
                Text = title,
                StartPosition = FormStartPosition.CenterScreen,
                FormBorderStyle = FormBorderStyle.FixedDialog,
                MaximizeBox = false,
                MinimizeBox = false
            };
            Button btnLogOut = new Button
            {
                Text = returnBtn
            };
            btnLogOut.Click += (object s, EventArgs e) => form.Close(); 
            form.Controls.Add(btnLogOut);
            return form;
        }
        public virtual List<Control> GetInformation()
        {
            int j = 0, sX = 300, sY = 65 + 10*(info.Count);
            ListView l = new ListView();
            listSize = new Size(sX, sY);
            int posX = GraphicalInterface.formSize.Width / 2 - listSize.Width / 2;
            l.Bounds = new Rectangle(new Point(posX, 10), listSize);
            l.View = View.Details;
            l.LabelEdit = false;
            l.AllowColumnReorder = false;
            l.CheckBoxes = false;
            l.FullRowSelect = true;
            l.GridLines = false;
            l.Sorting = SortOrder.None;
            ListViewItem[] items = new ListViewItem[info.Count];
            foreach (var field in info)
            {
                ListViewItem i = new ListViewItem(field.Key);
                i.SubItems.Add(field.Value);
                items[j++] = i;
            }
            // Width of -2 indicates auto-size.
            l.Columns.Add("Property", -2, HorizontalAlignment.Center);
            l.Columns.Add("Value", -2, HorizontalAlignment.Left);
            l.Items.AddRange(items);
            return new List<Control>(new Control[]{ l });
        } 
    }
    /// <summary>
    /// Concrete Creator of the Factory Method Pattern
    /// </summary>
    class StudentCreator: InstitutionalUserCreator
    {
        public override InstitutionalUser createUser(User user)
        {
            return new Student(user);
        }
    }
    /// <summary>
    /// Concrete Creator of the Factory Method Pattern
    /// </summary>
    class TeacherCreator : InstitutionalUserCreator
    {
        public override InstitutionalUser createUser(User user)
        {
            return new Teacher(user);
        }
    }
    /// <summary>
    /// Concrete Creator of the Factory Method Pattern
    /// </summary>
    class SupervisorCreator : InstitutionalUserCreator
    {
        public override InstitutionalUser createUser(User user)
        {
            Button getInfo = new Button();

            return new Supervisor(user);
        }
    }
    /// <summary>
    /// Concrete implementation of the bridge pattern and Concrete Product of the factory method pattern.
    /// </summary>
    class Student: InstitutionalUser
    {
        List<Object> subjects = new List<Object>();
        private float gAvg = 0;

        public Student(User user)
        {
            info["Name"] = user.fullName;
            info["Role"] = user.role;
            info["City"] = user.birthCity;
            info["Year of Birth"] = user.birthYear;
            info["Career"] = user.career;
            info["id"] = user.id.ToString();
            subjects = user.subjects;
        }
        public override List<Button> GetOptions()
        {
            buttons.Add(CreateButton());
            buttons.Add(CreateButton("Grades", "See my grades", 1));
            return buttons;
        }
        public override List<Control> GetInformation()
        {
            Control list = base.GetInformation()[0];
            Control tree = GetGrades()[0];
            tree.Location = new Point(tree.Location.X, 140);
            tree.Size = new Size(tree.Size.Width, tree.Size.Height - 15);
            return new List<Control>(new Control[] { list, tree });
        }
        public override List<Control> GetGrades()
        {
            TreeView tree = CreateTree();
            gAvg = 0;
            DataConnection conn = DataConnection.GetInstance();
            tree.BeginUpdate();
            tree.Nodes.Add(info["Name"]);
            int nOfNode = 0;
            foreach(Object i in subjects)
            {
                compactSubject mySubject = compactSubject.Cast(i);
                Subject s = conn.FindSubjectByID(mySubject.subjectID); 
                float avg = 0;
                foreach(int g in mySubject.grades)
                    avg += g;
                avg /= mySubject.grades.Length;
                gAvg += avg;
                tree.Nodes[0].Nodes.Add(s.name);
                tree.Nodes[0].Nodes[nOfNode].Nodes.Add("Average: " + avg.ToString() + "/100");
                for (int j = 0; j < mySubject.grades.Length; j++)
                    tree.Nodes[0].Nodes[nOfNode].Nodes[0].Nodes.Add("Grade " + (j + 1).ToString() + ": " + mySubject.grades[j].ToString() + "/100");
                nOfNode++;
            }
            gAvg /= subjects.Count;
            tree.Nodes[0].Nodes.Add("Global Average: " + gAvg.ToString());
            tree.EndUpdate();

            Control button = CreateButton("Download", "Download Grades", 1);
            return new List<Control> { tree, button };
        }
        public override List<string> DownloadGrades()
        {
            List<string> g = new List<string>();
            DataConnection conn = DataConnection.GetInstance();
            g.Add(GetName());
            foreach(object i in subjects)
            {
                compactSubject s = compactSubject.Cast(i);
                Subject subject = conn.FindSubjectByID(s.subjectID);
                g.Add("\t" + subject.name);
                int sID = Int32.Parse(info["id"]);
                int[] grades = conn.FindGradesByUserAndSubject(sID, s.subjectID);
                int j = 1;
                foreach (int grade in grades)
                    g.Add("\t\tGrade " + j++ + ": " + grade.ToString() + "/100");
            }
            return g;
        }
    }
    /// <summary>
    /// Concrete implementation of the bridge pattern and Concrete Product of the factory method pattern.
    /// </summary>
    class Teacher : InstitutionalUser
    {
        private List<Object> subjects;
        public Teacher(User user)
        {
            info["Name"] = user.fullName;
            info["Role"] = user.role;
            info["City"] = user.birthCity;
            info["Year of Birth"] = user.birthYear;
            info["id"] = user.id.ToString();
            subjects = user.subjects;
        }
        public override List<Button> GetOptions()
        {
            buttons.Add(CreateButton());
            buttons.Add(CreateButton("Grades", "See students' grades", 1));
            return buttons;
        }

        public override List<Control> GetGrades()
        {
            TreeView tree = CreateTree();
            DataConnection conn = DataConnection.GetInstance();
            tree.BeginUpdate();
            tree.Nodes.Add(info["Name"]);
            int nOfSubject = 0;
            foreach (Object i in subjects)
            {
                int mySubject = JsonConvert.DeserializeObject<int>(i.ToString());
                Subject s = conn.FindSubjectByID(mySubject);
                tree.Nodes[0].Nodes.Add(s.name);
                InstitutionalUserCreator creator = new StudentCreator();
                int nOfStudent = 0;
                foreach (int studentID in s.studentsID)
                {
                    User u = conn.FindUserByID(studentID);
                    Student student = (Student)creator.createUser(u);
                    float avg = 0;
                    int[] grades = conn.FindGradesByUserAndSubject(studentID, mySubject);
                    foreach (int g in grades)
                        avg += g;
                    avg /= grades.Length;
                    tree.Nodes[0].Nodes[nOfSubject].Nodes.Add(student.GetName());
                    tree.Nodes[0].Nodes[nOfSubject].Nodes[nOfStudent].Nodes.Add("Average: " + avg.ToString() + "/100");
                    for (int j = 0; j < grades.Length; j++)
                        tree.Nodes[0].Nodes[nOfSubject].Nodes[nOfStudent].Nodes[0].Nodes.Add("Grade " + (j + 1).ToString() + ": " + grades[j].ToString() + "/100");
                    nOfStudent++;
                }
                nOfSubject++;
            }
            tree.EndUpdate();
            return new List<Control> { tree };
        }
        protected override TreeView CreateTree()
        {
            TreeView t = base.CreateTree();
            t.Size = new Size(t.Size.Width, 250);
            return t;
        }
        public override List<string> DownloadGrades()
        {
            return null;
        }
        
    }
    /// <summary>
    /// Concrete implementation of the bridge pattern and Concrete Product of the factory method pattern.
    /// </summary>
    class Supervisor : InstitutionalUser
    {
        public Supervisor(User user)
        {
            info["Name"] = user.fullName;
            info["Role"] = user.role;
            info["id"] = user.id.ToString();
        }
        public override List<Button> GetOptions()
        {
            buttons.Add(CreateButton());
            return buttons;
        }

        public override List<Control> GetGrades()
        {
            return null;
        }
        public override List<string> DownloadGrades()
        {
            return null;
        }
    }
}
