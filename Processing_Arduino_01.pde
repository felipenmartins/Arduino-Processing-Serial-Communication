import processing.serial.*;        // import the Serial library

Serial myPort;                     // declares serial port variable
String val;                        // value received via serial port
boolean firstContact = false;      // true if serial communication is stablished

void setup(){
  size(200,200);
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');
}

void draw(){
  
}

void serialEvent(Serial myPort){
  val = myPort.readStringUntil('\n');
  if (val != null){
    val = trim(val);
    println(val);
    if (mousePressed == true){
      myPort.write('1');
      println('1');
    }
  }
}


