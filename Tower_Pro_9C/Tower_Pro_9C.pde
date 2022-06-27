import processing.serial.*;

PImage backgroundImg, btn_on, btn_off;
int oi=0;
Serial myPort;

//Estrutura para alterar imagem
void muda(){   
    while(true){
      if(oi==2){
        backgroundImg=loadImage("img/9CL.png");
        delay(1000);
        backgroundImg=loadImage("img/9CR.png");
        delay(1000);
      }
      else {
        break;
      }
    }
}

public void setup (){
  surface.setTitle("Tower Pro 9C");
  size(800,600);
  
  //arduino
  myPort = new Serial (this, Serial.list()[1], 9600);
  
  //imagens
  backgroundImg=loadImage("img/9CR.png");
  btn_on=loadImage("img/on_off.png");
  btn_off=loadImage("img/off_off.png");
}

void draw(){
  background(backgroundImg);
  image(btn_on, 420, 200);
  image(btn_off, 420, 310);
}

void mousePressed(){
    if((mouseX > 420 && mouseX < 740) && (mouseY > 200 && mouseY < 305)) {
    oi=2;
    myPort.write("1");
    thread("muda");
    }
    else if((mouseX > 420 && mouseX < 740) && (mouseY > 310 && mouseY < 415)){
    oi=1;
    myPort.write("2");
    }
}
