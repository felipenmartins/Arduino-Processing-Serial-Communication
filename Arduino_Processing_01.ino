char val;
int ledPin = 5;
boolean ledState = LOW;

void setup() {
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (Serial.available() > 0){
    val = Serial.read();
    if (val == '1'){
      ledState = !ledState;
      digitalWrite(ledPin, ledState);
    }
    delay(100);
  }
  else{
    Serial.println(analogRead(A0));
    delay(50);
  }
}

