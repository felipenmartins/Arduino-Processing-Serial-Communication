char val;
int ledPin = 5;
int heartLedPin = 6;            // to indicate program health
boolean ledState = LOW;
long currentMillis;
long previousMillis = 0;

void setup() {
  pinMode(ledPin, OUTPUT);
  pinMode(heartLedPin, OUTPUT);
  digitalWrite(heartLedPin, HIGH);  // heart beat LED ON
  Serial.begin(57600);
  establishContact();
  digitalWrite(heartLedPin, LOW);   // heart beat LED OFF
}

void loop() {
  if (Serial.available() > 0){
    val = Serial.read();
    if (val == '1'){
      ledState = !ledState;
      digitalWrite(ledPin, ledState);
    }
    delay(10);
  }
  else{
    Serial.print('A');
    Serial.println(analogRead(A0));
    Serial.print('B');
    Serial.println(analogRead(A1));
    Serial.print('C');
    Serial.println(analogRead(A2));
    Serial.print('D');
    Serial.println(analogRead(A3));
    Serial.print('E');
    Serial.println(analogRead(A4));
    delay(50);
  }

  heartBeat();    // execute heart beat
}

void establishContact(){
  while (Serial.available() <=0){
    Serial.println('A');
    delay(300);
  }
}

void heartBeat(){
  // heart beat LED toogles every 500ms.
  currentMillis = millis();
  if (currentMillis - previousMillis > 500){
    previousMillis = currentMillis;
    digitalWrite(heartLedPin, !digitalRead(heartLedPin));
  }
}

