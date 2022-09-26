PImage imagen;
ArrayList <Enemigo> gatos;

void setup(){
  size(450,450);
  imagen = loadImage("gatocubrebocas.png");
  gatos = new ArrayList <Enemigo> ();
  
  for(int i = 0; i<10; i++){
    gatos.add(new Enemigo(random(width), random(height),random(20,40)));
  }
  background(255);
}

void draw(){
  
  for(Enemigo e:gatos){
    e.display();
    e.mover();
  }
}

void mousePressed(){
  gatos.add(new Enemigo(mouseX, mouseY,random(20,40)));
}

class Enemigo{
  float t;
  color c;
  float x;
  float y;
  float dx;
  float dy;
  int comp;
  float r;
  float dr;
  Enemigo(float x_, float y_, float t_){
    x= x_;
    y= y_;
    t= t_;
    comp = 2;
    c = color(0,0,255);
    float angulo = random(TWO_PI);
    dx = cos(angulo)*2;
    dy = sin(angulo)*2;
    r= random(TWO_PI);
    dr= random(-0.1,0.1);
  }
  
  void mover(){
    switch(comp){
      case 0:
      break;
      case 1:
        x+= random(-2,2);
        y+= random(-2,2);
      break;
      case 2:
      x+=dx;
      y+=dy;
      if(x<0 || x>width){
        dx*= -1;
      }
      if(y<0 || y>height){
        dy*= -1;
      }
      break;
    }
  }
  
  void display(){
    noStroke();
    c = imagen.get(round(x),round(y));
    fill(c);
    pushMatrix();
    translate(x,y);
    rotate(r);
    stroke(c);
    line(0,0,t,0);
    popMatrix();
    r+=dr;
  }
}
