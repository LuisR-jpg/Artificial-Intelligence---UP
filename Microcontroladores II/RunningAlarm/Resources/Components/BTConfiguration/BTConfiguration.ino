int inbyte = 0;   // for incoming serial data

void setup() {
        //Serial1.begin(9600);     // opens serial port, sets data rate to 9600 bps
        Serial.begin(9600);     // opens serial port, sets data rate to 9600 bps
}

void loop() {
 // if (Serial1.available() > 0)
    if (Serial.available() > 0)
    {
      //inbyte = Serial1.read();
      //Serial.println(inbyte);
      Serial.println(Serial.read());
  }
}
