char valor;
int led = 9;

void setup() {
  // Definir LEDs como OUTPUTs
  pinMode(led, OUTPUT);
  // Iniciar comunicacao serie
  Serial.begin(9600);
}

void loop() {
  if (Serial.available())
  {
    // Guardar valor lido e recebido do Processing
    valor = Serial.read();
  }

  if(valor=='2'){
    delay(1000);
    digitalWrite(led, HIGH);
    digitalWrite(led, HIGH);
    delay(1000);
    digitalWrite(led, LOW);
    digitalWrite(led, LOW);  
    }}


  // BOTAO ACORDAR - OFF

  
  if (valor == '0')
  { 
    digitalWrite(led, LOW);
  }

  // BOTAO ACORDAR - ON
  
  else if (valor == '1')
  {
    digitalWrite(led, HIGH);
  }



// BOTAO PISCAR - ON

  
  if (valor == '2')
  { 
    loop();
    
  }




}
