using System;
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
            return new Supervisor();
        }
    }
    class Student: InstitutionalUser
    {

    }
    class Teacher : InstitutionalUser
    {

    }
    class Supervisor : InstitutionalUser
    {

    }
}
