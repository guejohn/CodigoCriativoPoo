//import processing.serial.*;

//Variáveis
PImage backgroundImage, btn_ligar;
int teste, aux1, valor=0;
//Serial myPort;

public void setup (){
  //Arduino
  //myPort = new Serial(this, Serial.list()[0], 19200);
  
  //Interface
  surface.setTitle("HC-SR04");
  size(1280,720);
  fill(255);
  textSize(40);
  
  //Imagens
  backgroundImage=loadImage("img/sonar.png");
  btn_ligar=loadImage("img/on_off.png");
}

void draw(){
  fill(0);
  background(backgroundImage);
  image(btn_ligar, 835, 300);
  
  if(aux1==1){
    //Printar a distância
    teste = (int)random(1,50);
    delay(100);
    fill(255);
    text("Distância em centímetros: "+valor, width/2, height/1.2);

  }
}

void som(){
  while(true){
    if(aux1==1){
      delay(250);
      backgroundImage=loadImage("img/sonar1.png");
      delay(250);
      backgroundImage=loadImage("img/sonar2.png");
      delay(250);
      backgroundImage=loadImage("img/sonar3.png");
      delay(250);
      backgroundImage=loadImage("img/sonar4.png");
      delay(250);
    }
    else {
      backgroundImage=loadImage("img/sonar.png");
      break;
    }
  }
}

void mousePressed(){
  if((mouseX >835 && mouseX < 1155) && (mouseY >= 300 && mouseY < 405) && aux1==0){
    btn_ligar=loadImage("img/on_on.png");
    thread("som");
    //myPort.write("1");
    aux1=1;
    //valor = myPort.read();
    println(valor);
  }
  else if((mouseX >835 && mouseX < 1155) && (mouseY >= 300 && mouseY < 405) && aux1==1){
    btn_ligar=loadImage("img/on_off.png");
    aux1=0;
  }
}
