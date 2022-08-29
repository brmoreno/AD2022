class Particula{
  // Atributos
  float tamano;
  color c;
  float x;
  float y;
  float dx;
  float dy;
  
  //Métodos
  Particula(float x_,float y_,float t_, color c_, float dx_, float dy_){
    tamano = t_;
    x = x_;
    y = y_;
    c = c_;
    dx = dx_;
    dy = dy_;
  }
  
  void mover(){
    x+=dx;
    y+=dy;
  }
  
  void colision(){
    if(x<0 || x>width){
      dx*=-1;
    }
    if(y<0 || y>height){
      dy*=-1;
    }
  }
  
  void display(){
    fill(c);
    noStroke();
    ellipse(x,y,tamano,tamano);
  } 
}

Particula una;
Particula otra;

void setup(){
  size(500,500);
  una = new Particula(200,200,60,color(255,0,0),0.75,0.5);
  otra = new Particula(100,100,20,color(0,0,255),-0.5,-1);
}

void draw(){
  background(255);
  //una.mover();
  una.colision();
  una.display();
  otra.mover();
  otra.colision();
  otra.display();
}
