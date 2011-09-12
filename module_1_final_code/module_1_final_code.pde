int ledPin0 = 11; 
int ledPin4 = 12;
int ledPin5 = 13;
int ledPin6 = 10;
int inputPin1 = 3; 
int inputPin2 = 2; 
//PhotoResistor Pin
int lightPin = 0; 
boolean active = false;
 
void setup() {
  Serial.begin(9600);
  pinMode(ledPin4, OUTPUT); 
  pinMode(ledPin0, OUTPUT);
  pinMode(ledPin5, OUTPUT);
  pinMode(ledPin6, OUTPUT);
  pinMode(inputPin1, INPUT); 
  pinMode(inputPin2, INPUT); 
}
 
void loop(){
  CheckButton();
  
  if (active) {
    oneAfterAnotherNoLoop();
  }
  
}


void oneAfterAnotherNoLoop(){
  int delayTime = analogRead(lightPin); 
                                        
  
  Serial.println(delayTime); 
  delayTime = map(delayTime, 100, 500, 50, 200);
  digitalWrite(ledPin6, HIGH); 
  delay(delayTime);
  CheckButton();
  digitalWrite(ledPin0, HIGH); 
  delay(delayTime);
  CheckButton();
  digitalWrite(ledPin4, HIGH); 
  delay(delayTime);
  CheckButton();
  digitalWrite(ledPin5, HIGH); 
  delay(delayTime);
  CheckButton();
   digitalWrite(ledPin6, LOW); 
  delay(delayTime);
  CheckButton();
  digitalWrite(ledPin0, LOW); 
  delay(delayTime);
  CheckButton();
  digitalWrite(ledPin4, LOW); 
  delay(delayTime);
  CheckButton();
  digitalWrite(ledPin5, LOW); 
  delay(delayTime);
  
  CheckButton();
  
}


void CheckButton() {
  if (digitalRead(inputPin1) == LOW) {
    digitalWrite(ledPin0, LOW); 
    digitalWrite(ledPin4, LOW);
    digitalWrite(ledPin5, LOW);
    digitalWrite(ledPin6, LOW);
    active = false;
  } else if (digitalRead(inputPin2) == LOW) {
    digitalWrite(ledPin0, HIGH); 
    digitalWrite(ledPin4, HIGH);
    digitalWrite(ledPin5, HIGH);
    digitalWrite(ledPin6, HIGH);
    active = true; 
  }
}
