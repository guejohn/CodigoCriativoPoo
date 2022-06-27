//2-Way motor control

int motorPin1 =  5;    // One motor wire connected to digital pin 5
int motorPin2 =  6;    // One motor wire connected to digital pin 6
char valor;

// The setup() method runs once, when the sketch starts

void setup()   {                
  // initialize the digital pins as an output:
  pinMode(motorPin1, OUTPUT); 
  pinMode(motorPin2, OUTPUT);  
  Serial.begin(9600);
}

// the loop() method runs over and over again,
// as long as the Arduino has power
void loop()                     
{
  if(Serial.available()){
    valor = Serial.read(); 
  }
  if(valor== '1'){
      rotateLeftFull(100);
  }
}

void rotateLeftFull(int length){
  digitalWrite(motorPin1, HIGH); //rotates motor
  digitalWrite(motorPin2, LOW);    // set the Pin motorPin2 LOW
  delay(length); //waits
  digitalWrite(motorPin1, LOW);    // set the Pin motorPin1 LOW
}
