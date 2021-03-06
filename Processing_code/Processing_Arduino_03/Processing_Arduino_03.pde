import processing.serial.*;                // imports serial library

Serial myPort;                             // serial port used for communication
String val;                                // string received via serial port
int valueA0 = 0;
int valueA1 = 0;
int valueA2 = 0;
int valueA3 = 0;
int valueA4 = 0;
boolean firstContact = false;              // true if serial comm is stablished
boolean ledStatus = false;

void setup(){
  size(500,500);                            // size of the window
  myPort = new Serial(this, Serial.list()[0], 57600);  // serial comm initialization
  
  // stores all characters in buffer until receives a "new line" ('\n')
  myPort.bufferUntil('\n'); 
  
  ellipseMode(CENTER);
}

void draw(){
  background(0,0,100);                        // defines background color
  //rectMode(CENTER);

  fill(0,0,50);                               // defines fill color 
  rect(width/2-100,height/2+100,20,-250);        // draw a rectangle
  rect(width/2-50,height/2+100,20,-250);        // draw a rectangle
  rect(width/2,height/2+100,20,-250);        // draw a rectangle
  rect(width/2+50,height/2+100,20,-250);        // draw a rectangle
  rect(width/2+100,height/2+100,20,-250);        // draw a rectangle

  fill(150,0,100);                              // defines fill color
  // The following rectangles are drawn on top of the previous ones, but with different
  // color and a height that deends on the value received via seria port
  rect(width/2-100,height/2+100,20,-map(valueA0,0,1023,0,250));
  rect(width/2-50,height/2+100,20,-map(valueA1,0,1023,0,250));
  rect(width/2,height/2+100,20,-map(valueA2,0,1023,0,250));
  rect(width/2+50,height/2+100,20,-map(valueA3,0,1023,0,250));
  rect(width/2+100,height/2+100,20,-map(valueA4,0,1023,0,250));
  
  // The color of the circle depends on the status of the led
  if (ledStatus)
    fill(255,255,0);    // yellow
  else
    fill(0);            // black
  ellipse(50,50,30,30);
  
}

// serialEvent is executed every time a character "new line" is received
void serialEvent(Serial myPort){
  val = myPort.readStringUntil('\n');        // reads all characters
  // only does something if a character has been received
  if (val != null){
    val = trim(val);                   // eliminates spaces and special characters
    println(val);                      // prints the string on the console
    
    if (firstContact == false){        // check if contact was already stablished
      if (val.equals("A")){            // if not, check if the character received was "A".
        myPort.clear();                // if "A" was received, clear the serial buffer,
        firstContact = true;           // make firstContact true,
        myPort.write("A");             // and send "A" back to the Arduino via serial.
        println("Contact stablished.");
      }
    }
    else{                              // if this is not the first contact,
      // Check the the first character to match the string to its correspondent value
      if (val.charAt(0)=='A')
        valueA0 = int(val.substring(1)); // transforms the numbers into one integer value
      if (val.charAt(0)=='B')
        valueA1 = int(val.substring(1)); // transforms the numbers into one integer value
      if (val.charAt(0)=='C')
        valueA2 = int(val.substring(1)); // transforms the numbers into one integer value
      if (val.charAt(0)=='D')
        valueA3 = int(val.substring(1)); // transforms the numbers into one integer value
      if (val.charAt(0)=='E')
        valueA4 = int(val.substring(1)); // transforms the numbers into one integer value
    }
  }
}

// mouseClicked is executed every time the mouse is clicked
void mouseClicked(){
  myPort.write("1");             // send "1" to the Arduino via serial,
  println("Toggle LED");         // toggles the led status and print message.
  ledStatus = !ledStatus;
}

