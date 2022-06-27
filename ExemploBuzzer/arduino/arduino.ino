char valor;

int buzzer = 8; // BUZZER
float seno;
int frequencia;


void setup() {
  // Definir LEDs como OUTPUTs
  pinMode(buzzer, OUTPUT);
  // Iniciar comunicacao serie
  Serial.begin(9600);
}

void loop() {
  if (Serial.available())
  {
    // Guardar valor lido e recebido do Processing
    valor = Serial.read();
  }

    
  if(valor=='1'){
    for(int x=0;x<180;x++){
    //converte graus para radiando e depois obtém o valor do seno
    seno=(sin(x*3.1416/180));
    //gera uma frequência a partir do valor do seno
    frequencia = 2000+(int(seno*1000));
    tone(buzzer,frequencia);
    delay(2);
 }}

// FALAR

else if (valor == '1')
  {
    loop();
  }

  // FALAR - OFF
  
   else if (valor == '2')
  {
    noTone(buzzer);
  }


}
