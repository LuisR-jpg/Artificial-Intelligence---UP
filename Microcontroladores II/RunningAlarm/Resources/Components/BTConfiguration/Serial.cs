using System;
using System.IO.Ports;
using System.Windows.Forms;
using System.Threading;

//+UART:9600,0,0 BRate, StopBits, Parity+UART:9600,0,0



namespace SerialPortExample
{
  class SerialPortProgram
  {
    private SerialPort port = new SerialPort("COM10", 9600, Parity.None, 8, StopBits.One);

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
      Console.WriteLine(port.ReadByte());
      Thread.Sleep(250);
      port.DiscardInBuffer();
      //Console.WriteLine("Adios");
    }
  }
}