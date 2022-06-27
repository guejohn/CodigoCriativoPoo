import processing.serial.*;

//Variáveis: Imagens e auxiliares
PImage backgroundImage, btn_acordar, btn_dormir, btn_piscar, btn_falar, btn_ataque, btn_defesa, led_atq1, led_atq2, led_dfs, buzzr;
int aux1=0, aux2=0, aux3=0, aux4=0, auxmod1=0, auxmod2=0, blink=0;
Serial myPort;

public void setup(){
  
  // arduino
  myPort = new Serial(this, Serial.list()[1], 9600);
  
  //Nome da interface e tamanho
  surface.setTitle("Robô 2 - Caolho");
  size(1280,720);
  
  // Importando imagens
  backgroundImage=loadImage("img/robot2eyeoff.png");
  btn_acordar=loadImage("img/wakeup_off.png");
  btn_dormir=loadImage("img/sleep_off.png");
  btn_piscar=loadImage("img/blink_off.png");
  btn_falar=loadImage("img/speak_off.png");
  led_atq1=loadImage("img/attack_off.png");
  led_atq2=loadImage("img/attack_off.png");
  led_dfs=loadImage("img/defense_off.png");
  btn_defesa=loadImage("img/defesa_off.png");
  btn_ataque=loadImage("img/ataque_off.png");
  buzzr=loadImage("img/beep_off.png");
}

void piscar(){   
    while(true){
      if(blink==1){
        backgroundImage=loadImage("img/robot2eyeon.png");
        delay(1000);
        backgroundImage=loadImage("img/robot2eyeoff.png");
        delay(1000);
      }
      else {
        break;
      }
    }
}

//Inserir imagens na interface gráfica
void draw(){
  fill(0);
  // Imagens e seus respectivos X,Y
  background(backgroundImage);
  image(btn_acordar, 835, 15);
  image(btn_falar, 835, 120);
  image(btn_dormir, 835, 225);
  image(btn_piscar, 835, 330);
  image(btn_ataque, 835, 435);
  image(btn_defesa, 835, 540);
  image(led_dfs, 287, 602);
  image(led_atq1, 220, 620);
  image(led_atq2, 355, 620);
  image(buzzr, 390, 190);
  
}

// Ações dos botões
void mousePressed(){
  
  
  //Botão acordar
  if((mouseX > 835 && mouseX < 1155) && (mouseY > 15 && mouseY < 120) && aux1==0) {
       
        backgroundImage=loadImage("img/robot2eyeon.png");
        btn_acordar=loadImage("img/wakeup_on.png");
        btn_dormir=loadImage("img/sleep_off.png");
        btn_piscar=loadImage("img/blink_off.png");
        aux1=1;
        aux2=0;
        aux3=0;
        myPort.write("1");
  }
  else if((mouseX > 835 && mouseX < 1085) && (mouseY > 15 && mouseY < 120) && aux1==1) {
       
        backgroundImage=loadImage("img/robot2eyeoff.png");
        btn_acordar=loadImage("img/wakeup_off.png");
        btn_dormir=loadImage("img/sleep_off.png");
        btn_piscar=loadImage("img/blink_off.png");
        aux1=0;
        aux2=0;
        aux3=0;
        myPort.write("0");
  }
  
  //Botão falar
  if((mouseX > 835 && mouseX < 1155) && (mouseY > 120 && mouseY < 225) && aux4==0) {
        btn_falar=loadImage("img/speak_on.png");
        buzzr=loadImage("img/beep_on.png");
        aux4=1;
        myPort.write("3");
        blink=0;
  }
  else if((mouseX > 835 && mouseX < 1085) && (mouseY > 120 && mouseY < 225) && aux4==1) {
        btn_falar=loadImage("img/speak_off.png");
        buzzr=loadImage("img/beep_off.png");
        aux4=0;
        myPort.write("8");
        blink=0;
  }
  
  
  //Botão dormir
  if((mouseX > 835 && mouseX < 1155) && (mouseY > 225 && mouseY < 330) && aux2==0) {
       
        backgroundImage=loadImage("img/robot2eyeoff.png");
        btn_dormir=loadImage("img/sleep_on.png");
        btn_acordar=loadImage("img/wakeup_off.png");
        btn_piscar=loadImage("img/blink_off.png");
        aux2=1;
        myPort.write("0");
        blink=0;

  }
  else if((mouseX > 835 && mouseX < 1085) && (mouseY > 225 && mouseY < 330) && aux2==1) {
       
        backgroundImage=loadImage("img/robot2eyeoff.png");
        btn_dormir=loadImage("img/sleep_off.png");
        btn_acordar=loadImage("img/wakeup_off.png");
        btn_piscar=loadImage("img/blink_off.png");
        aux1=0;
        aux2=0;
        aux3=0;
        myPort.write("0");
        blink=0;
  }
  
  
  //Botão piscar
  if((mouseX > 835 && mouseX < 1155) && (mouseY > 330 && mouseY < 435) && aux3==0) {
        btn_dormir=loadImage("img/sleep_off.png");
        btn_acordar=loadImage("img/wakeup_off.png");
        btn_piscar=loadImage("img/blink_on.png");
        myPort.write("2");
        thread("piscar");
        blink=1;
        aux3=1;
   }
  else if((mouseX > 835 && mouseX < 1155) && (mouseY > 330 && mouseY < 435) && aux3==1) {
        btn_dormir=loadImage("img/sleep_off.png");
        btn_acordar=loadImage("img/wakeup_off.png");
        btn_piscar=loadImage("img/blink_off.png");
        myPort.write("0");
        aux3=0;
        blink=0;
   }
   
   
  //Botão ataque
  if((mouseX > 835 && mouseX < 1155) && (mouseY > 435 && mouseY < 540) && auxmod1==0) {
       
        btn_ataque=loadImage("img/ataque_on.png");
        led_atq1=loadImage("img/attack_on.png");
        led_atq2=loadImage("img/attack_on.png");
        led_dfs=loadImage("img/defense_off.png");
        btn_defesa=loadImage("img/defesa_off.png");
        auxmod1=1;
        auxmod2=0;
        myPort.write("4"); // this
        myPort.write("7");

  }
  else if((mouseX > 835 && mouseX < 1085) && (mouseY > 435 && mouseY < 540) && auxmod1==1) {
        led_atq1=loadImage("img/attack_off.png");
        led_atq2=loadImage("img/attack_off.png");
        led_dfs=loadImage("img/defense_off.png");
        btn_ataque=loadImage("img/ataque_off.png");
        btn_defesa=loadImage("img/defesa_off.png");
        auxmod1=0;
        auxmod2=0;
        myPort.write("5");
  }
  
  
  //Botão defesa
  if((mouseX > 835 && mouseX < 1155) && (mouseY > 540 && mouseY < 645) && auxmod2==0) {
       
        led_atq1=loadImage("img/attack_off.png");
        led_atq2=loadImage("img/attack_off.png");
        led_dfs=loadImage("img/defense_on.png");
        btn_ataque=loadImage("img/ataque_off.png");
        btn_defesa=loadImage("img/defesa_on.png");
        auxmod1=0;
        auxmod2=1;
        myPort.write("6"); // this
        myPort.write("5");

  }
  else if((mouseX > 835 && mouseX < 1085) && (mouseY > 540 && mouseY < 645) && auxmod2==1) {
        led_atq1=loadImage("img/attack_off.png");
        led_atq2=loadImage("img/attack_off.png");
        led_dfs=loadImage("img/defense_off.png");
        btn_ataque=loadImage("img/ataque_off.png");
        btn_defesa=loadImage("img/defesa_off.png");
        auxmod1=0;
        auxmod2=0;
        myPort.write("7");
  }
}
