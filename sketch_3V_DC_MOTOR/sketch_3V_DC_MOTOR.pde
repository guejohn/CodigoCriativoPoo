import processing.serial.*;

//Variáveis e imagens
PImage backgroundImage, btn_ligar, btn_desligar;
int aux;
Serial myPort;

public void setup (){
  //nome da interface
  surface.setTitle("3V DC Motor");
  size(800, 600);
  
  //Arduino
  myPort = new Serial (this, Serial.list()[1], 9600);
  
  //Importando imagens
  backgroundImage=loadImage("img/motor.png");
  btn_ligar=loadImage("img/on_off.png");
  btn_desligar=loadImage("img/off_off.png");
}

void draw(){
  fill(0);
  background(backgroundImage);
  image(btn_ligar, 425, 170);
  image(btn_desligar, 425, 275);  
}

void mousePressed(){
  //Botão ligar
  if((mouseX > 425 && mouseX < 675) && (mouseY > 170 && mouseY < 275)){
    btn_ligar=loadImage("img/on_on.png");
    aux=1;
    myPort.write("1");
   }
   
   //Botão desligar
   if((mouseX > 425 && mouseX < 675) && (mouseY > 275 && mouseY < 380)){
    btn_ligar=loadImage("img/on_off.png");
    aux=0;
    myPort.write("0");
   }
}
