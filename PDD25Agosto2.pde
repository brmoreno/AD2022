class Browniano{
  PVector posActual;
  ArrayList <PVector> pos;
  int n;
  float maxX;
  float maxY;
  float minX;
  float minY;
  
  Browniano(int n_){
    posActual = new PVector();
    pos = new ArrayList <PVector> ();
    n = n_;
    for(int i = 0; i<n; i++){
      posActual.add(PVector.random2D().mult(2));
      pos.add(posActual.copy());
      if(posActual.x>maxX){
        maxX= posActual.x;
      }
      if(posActual.x<minX){
        minX= posActual.x;
      }
      if(posActual.y>maxY){
        maxY= posActual.y;
      }
      if(posActual.y<minY){
        minY= posActual.y;
      }
    }
  }
}

Browniano uno;
float r;
float s;
void setup(){
   size(400,400);
   uno = new Browniano(3000);
   r = 0;
   s = 1;
}

void draw(){
  
  background(255);
  for(int i = 0; i<uno.n; i++){
    PVector p = uno.pos.get(i).copy();
    p.rotate(r).mult(s);
    p.add(mouseX,mouseY);
    noStroke();
    fill(255,0,0);
    ellipse(p.x,p.y,3,3);
  }
  
  if(keyPressed){
    switch(key){
      case 'a':
      r+=0.1;
      break;
      case 's':
      r-=0.1;
      break;
      case 'z':
      s+=0.05;
      break;
      case 'x':
      s-=0.05;
      break;
    }
  }
}
