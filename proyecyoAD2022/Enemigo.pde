class Enemigo{
  float t;
  color c;
  float x;
  float y;
  float dx;
  float dy;
  //voy a almacenar el comportamiento de una forma
  // 0= estático, 1=aleatorio, 2=constante
  int comp;
  Enemigo(float x_, float y_, float t_, int comp_){
    x= x_;
    y= y_;
    t= t_;
    comp =comp_;
    c = color(0,0,255);
    float angulo = random(TWO_PI);
    dx = cos(angulo)*2;
    dy = sin(angulo)*2;
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
    fill(c);
    ellipse(x,y,t,t);
  }
}
