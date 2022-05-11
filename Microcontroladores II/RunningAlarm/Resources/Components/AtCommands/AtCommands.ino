
void setup()
{
  Serial1.begin(38400);       // Inicializamos el puerto serie BT (Para Modo AT 2)
  Serial.begin(9600);   // Inicializamos  el puerto serie  
}
 
void loop()
{
  if(Serial1.available())
  {
    Serial.write(Serial1.read());
  }
 
  if(Serial.available()) 
  {
     Serial1.write(Serial.read());
  }
}
