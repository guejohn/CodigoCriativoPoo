char valor;
int ledAmareloMeio = 9;  // 
int ledAmarelo = 10; //Amarelo meio
int ledVermelho = 11; // Vermelho esquerdo
int ledPrincipal = 13; // Principal
int Buzzer = 12; 
float seno;
int frequencia;



void setup() {
  // Definir LEDs como OUTPUTs
  pinMode(ledAmareloMeio, OUTPUT);
  pinMode(ledAmarelo, OUTPUT);
  pinMode(ledVermelho, OUTPUT);
  pinMode(ledPrincipal, OUTPUT);
  pinMode(Buzzer, OUTPUT);
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
    digitalWrite(ledPrincipal, HIGH);
    delay(1000);
    digitalWrite(ledPrincipal, LOW);
    }
    
  if(valor=='3'){
    for(int x=0;x<180;x++){
    //converte graus para radiando e depois obtém o valor do seno
    seno=(sin(x*3.1416/180));
    //gera uma frequência a partir do valor do seno
    frequencia = 2000+(int(seno*1000));
    tone(Buzzer,frequencia);
    delay(2);
 }}


  // BOTAO ACORDAR - OFF

  
  if (valor == '0')
  { digitalWrite(ledPrincipal, LOW);
  }

  // BOTAO ACORDAR - ON
  
  else if (valor == '1')
  {
    digitalWrite(ledPrincipal, HIGH);
  }




// BOTAO PISCAR - ON

  
  if (valor == '2')
  { 
    loop();
    
  }

// FALAR

else if (valor == '3')
  {
    loop();
  }

  // FALAR - OFF
  
   else if (valor == '8')
  {
    noTone(Buzzer);
  }



// MODOS



  //  ATAQUE ON
  
  else if (valor == '4')
  {
    digitalWrite(ledVermelho, HIGH);
    digitalWrite(ledAmareloMeio, HIGH);
  }

  // ATAQUE - OFF
  
   else if (valor == '5')
  {
   digitalWrite(ledVermelho, LOW);
   digitalWrite(ledAmareloMeio, LOW);
  }

  

  //  DEFESA ON
  
  else if (valor == '6')
  {
    digitalWrite(ledAmarelo, HIGH);
  }

  // DEFESA - OFF
  
   else if (valor == '7')
  {
    digitalWrite(ledAmarelo, LOW);
  }
  





}
