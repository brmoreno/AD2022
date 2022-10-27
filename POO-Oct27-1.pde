import processing.video.*;
Capture cam;
ArrayList <Particula> particulas;
PFont fuente;

void setup(){
  size(640,480);
  String[] cameras = Capture.list();
  printArray(cameras);
  cam = new Capture(this,cameras[0]);
  cam.start();
  fuente = createFont("Futura",15);
  particulas = new ArrayList <Particula>();
  for(int i = 0; i<width; i+=10){
    for(int j = 0; j<height; j+= 10){
      particulas.add(new Particula(i+10,j+10,10));
    }
  }
}

void draw(){
  
    if (cam.available()) { 
      
    cam.read();
    background(0);
    for(Particula p:particulas){
      p.display();
      p.mover();
    }
  } 
}


class Particula{
  PVector pos;
  PVector mov;
  float t;
  float dt;
  float ddt;
  
  Particula(float x_, float y_, float t_){
    pos = new PVector(x_,y_);
    t = t_;
    dt = random(TWO_PI);
    ddt = random(-0.1,0.1);
    mov = PVector.random2D();
  }
  
  void display(){
    dt+=ddt;
    color c = cam.get(round(pos.x),round(pos.y));
    if(brightness(c)>mouseX){
      fill(0,255,0);
    }
    else{
      fill(0,80,0);
    }
    
    noStroke();
    textFont(fuente);
    char ch = char(round(random(65,127)));
    text(ch,pos.x,pos.y);
  }
  
  void mover(){
    pos.add(mov);
    if(pos.x<0||pos.x>width){
      mov.x*=-1;
    }
    if(pos.y<0||pos.y>height){
      mov.y*=-1;
    }    
  }
}
