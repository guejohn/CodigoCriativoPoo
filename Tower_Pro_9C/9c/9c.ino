#include <Servo.h> //INCLUSÃO DA BIBLIOTECA NECESSÁRIA

const int pinoServo = 6; //PINO DIGITAL UTILIZADO PELO SERVO  
char valor;
 
Servo s; //OBJETO DO TIPO SERVO
int pos; //POSIÇÃO DO SERVO
 
void setup (){
  s.attach(pinoServo); //ASSOCIAÇÃO DO PINO DIGITAL AO OBJETO DO TIPO SERVO
  s.write(0);
  Serial.begin(9600);
}

void loop(){

  
    if (Serial.available()){
      valor = Serial.read();
    }

    
    if(valor == '1'){
      for(pos = 0; pos < 180; pos++){
        s.write(pos);
        delay(5);
      }
      delay(10);
      for(pos = 180; pos >= 0; pos--){
        s.write(pos);
        delay(5);
      }
    }

    
    else if (valor == '2'){
      s.write(0);
    }
  }
