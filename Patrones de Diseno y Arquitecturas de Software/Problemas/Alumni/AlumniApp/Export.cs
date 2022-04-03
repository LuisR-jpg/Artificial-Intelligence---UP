using word = Microsoft.Office.Interop.Word;
using System.Reflection;
using System.IO;
using System.Configuration;
using System.Collections.Generic;
using System;

namespace AlumniApp
{
    /// <summary>
    /// Singleton that wraps the Factory Method in charged of generating the output file.
    /// </summary>
    public sealed class Export
    {
        private static Export instance;
        private readonly Output targetOutput;
        private Export()
        {
            OutputCreator creator;
            switch (ConfigurationManager.AppSettings["exportTo"])
            {
                default:
                case "PlainText":
                    creator = new PlainCreator();
                    break;
                case "WordDocument":
                    creator = new DocxCreator();
                    break;
            }
            targetOutput = creator.CreateTarget();
        }
        public static Export GetInstance()
        {
            if (instance == null)
                instance = new Export();
            return instance;
        }
        public bool Write(string name, List<string> txt)
        {
            return targetOutput.Write(name, txt);
        }
    }
    /// <summary>
    /// Concrete Creator of the Factory Method Pattern
    /// </summary>
    public class DocxCreator: OutputCreator
    {
        public override Output CreateTarget()
        {
            return new DocxOutput();
        }
    }
    /// <summary>
    /// Concrete Creator of the Factory Method Pattern
    /// </summary>
    public class PlainCreator : OutputCreator
    {
        public override Output CreateTarget()
        {
            return new PlainOutput();
        }
    }
    /// <summary>
    /// Concrete Creator of the Factory Method Pattern
    /// </summary>
    public class PlainOutput : Output
    {

        public override bool Write(string studentName, string text)
        {
            try
            {
                using (StreamWriter writer = new StreamWriter(GetFileName(studentName), false))
                {
                    writer.WriteLine(text);
                }
                return true;
            }
            catch
            {
                return false;
            }
        }
        public override string GetFileName(string name)
        {
            return base.GetFileName(name) + ".txt";
        }
    }
    /// <summary>
    /// Concrete Creator of the Factory Method Pattern
    /// </summary>
    public class DocxOutput: Output
    {
        public override bool Write(string studentName, string text)
        {
            try
            {
                word.Application app = new word.Application();
                word.Document doc = app.Documents.Add();
                doc.Content.Text = text;

                doc.SaveAs2(GetFileName(studentName));
                doc.Close();
                app.Quit();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public override string GetFileName(string name)
        {
            return base.GetFileName(name) + ".docx";
        }
    }
    /// <summary>
    /// Abstract Creator of the Factory Method Pattern
    /// </summary>
    public abstract class OutputCreator {
        public abstract Output CreateTarget();
    }
    /// <summary>
    /// Abstract Product of the Factory Method Pattern
    /// </summary>
    public abstract class Output
    {
        protected readonly string route;
        public Output()
        {
            route = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
        }
        public virtual string GetFileName(string name)
        {
            return route + "\\" + name.Replace(" ", String.Empty);
        }
        public bool Write(string studentName, List<string> lines)
        {
            string txt = "";
            foreach (string line in lines)
                txt += line + "\n";
            return Write(studentName, txt);
        }
        public abstract bool Write(string studentName, string text);
    }
}
