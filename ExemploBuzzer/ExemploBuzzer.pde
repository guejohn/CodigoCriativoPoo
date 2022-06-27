import processing.serial.*;

PImage fundo, btn_tocar, beep;
int aux1=0, aux2=0;
Serial myPort;

public void setup (){
  //Interface e título
  surface.setTitle("Exemplo - Buzzer");
  size(800,600);
  
   // arduino
  myPort = new Serial(this, Serial.list()[1], 9600);
  
  
  //imagens
  fundo=loadImage("img/fundo.png");
  btn_tocar=loadImage("img/play_off.png");
  beep=loadImage("img/beep_off.png");   
  
}

//Inserindo imagens
void draw(){
  background(fundo);
  image(btn_tocar, 420, 200);
  image(beep, 300, 75);
}

void mousePressed(){
  
  //Botão tocar
    if((mouseX > 420 && mouseX < 740) && (mouseY > 200 && mouseY < 305) && aux1==0) {
      btn_tocar=loadImage("img/play_on.png");
      beep=loadImage("img/beep_on.png");
      aux1=1;
      myPort.write("1");
  }
  else if((mouseX > 420 && mouseX < 740) && (mouseY > 205 && mouseY <305 ) && aux1==1) {
      btn_tocar=loadImage("img/play_off.png");
      beep=loadImage("img/beep_off.png");
      aux1=0;
      myPort.write("2");
  }
  
}
