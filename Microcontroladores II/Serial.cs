using System;
using System.IO.Ports;
using System.Windows.Forms;
using System.Threading;

namespace SerialPortExample
{
  class SerialPortProgram
  {
    private SerialPort port = new SerialPort("COM2", 4800, Parity.None, 8, StopBits.Two);

    [STAThread]
    static void Main(string[] args)
    { 
      new SerialPortProgram();
    }

    private SerialPortProgram()
    {
      try
      {
        Console.WriteLine("Incoming Data:");
        port.DataReceived += new SerialDataReceivedEventHandler(port_DataReceived);
        port.Open();
      }
      catch {
        Console.WriteLine("Couldn't connect to serial");
      }
      Application.Run();
    }
    private void port_DataReceived(object sender, SerialDataReceivedEventArgs e)
    {
      Console.WriteLine(port.ReadByte()/255.0*5.0);
      Thread.Sleep(250);
      port.DiscardInBuffer();
      //Console.WriteLine("Adios");
    }
  }
}