import processing.serial.*;
Serial myPort;

PImage led, btn_acender, btn_desligar, btn_piscar;
int aux1=0, aux2=0, aux3=0, oi=0;

public void setup (){
  //Interface e título
  surface.setTitle("Exemplo - Led");
  size(800,600);
  
   // arduino
  myPort = new Serial(this, Serial.list()[1], 9600);
  
  //imagens
  led=loadImage("img/off.png");
  btn_acender=loadImage("img/turnon_off.png");
  btn_desligar=loadImage("img/turnoff_off.png");
  btn_piscar=loadImage("img/blink_off.png");
}

//Inserindo imagens
void draw(){
  background(led);
  image(btn_acender, 420, 110);
  image(btn_desligar, 420, 215);
  image(btn_piscar, 420, 320);
}

void piscar(){   
    while(true){
    if(oi==2){
    led=loadImage("img/on.png");
    delay(1000);
    led=loadImage("img/off.png");
    delay(1000);
}
else { break; }}
}

void mousePressed(){
  
  
  //Botão acender
  if((mouseX > 420 && mouseX < 740) && (mouseY > 110 && mouseY < 215) && aux1==0) {
    btn_acender=loadImage("img/turnon_on.png");
    btn_desligar=loadImage("img/turnoff_off.png");
    btn_piscar=loadImage("img/blink_off.png");
    led=loadImage("img/on.png");
    aux1=1;
    aux2=0;
    aux3=0;
    myPort.write("1");
    oi=1;
  }
  else if((mouseX > 420 && mouseX < 740) && (mouseY > 110 && mouseY < 215) && aux1==1) {
    btn_acender=loadImage("img/turnon_off.png");
    btn_desligar=loadImage("img/turnoff_off.png");
    btn_piscar=loadImage("img/blink_off.png");
    led=loadImage("img/off.png");
    aux1=0;
    aux2=0;
    aux3=0;
    myPort.write("0");
    oi=1;
  }
  
  //Botão apagar
  if((mouseX > 420 && mouseX < 740) && (mouseY > 215 && mouseY < 320) && aux2==0) {
    btn_acender=loadImage("img/turnon_off.png");
    btn_desligar=loadImage("img/turnoff_on.png");
    btn_piscar=loadImage("img/blink_off.png");
    led=loadImage("img/off.png");
    aux1=0;
    aux2=1;
    aux3=0;
    oi=1;
    myPort.write("0");
  }
  else if((mouseX > 420 && mouseX < 740) && (mouseY > 215 && mouseY < 320) && aux2==1) {
    btn_acender=loadImage("img/turnon_off.png");
    btn_desligar=loadImage("img/turnoff_off.png");
    btn_piscar=loadImage("img/blink_off.png");
    led=loadImage("img/off.png");
    aux1=0;
    aux2=0;
    aux3=0;
    oi=1;
    myPort.write("0");
  }
  
  //Botão piscar
  if((mouseX > 420 && mouseX < 740) && (mouseY > 320 && mouseY < 425) && aux3==0) {
    btn_acender=loadImage("img/turnon_off.png");
    btn_desligar=loadImage("img/turnoff_off.png");
    thread("piscar");
    aux1=0;
    aux2=0;
    aux3=1;
    oi=2;
    myPort.write("2");
  }
  else if((mouseX > 420 && mouseX < 740) && (mouseY > 320 && mouseY < 425) && aux3==1) {
    btn_acender=loadImage("img/turnon_off.png");
    btn_desligar=loadImage("img/turnoff_off.png");
    btn_piscar=loadImage("img/blink_off .png");
    led=loadImage("img/off.png");
    aux1=0;
    aux2=0;
    aux3=0;
    oi=1;
    myPort.write("0");
  }
}
