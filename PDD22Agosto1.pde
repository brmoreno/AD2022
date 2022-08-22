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
      posActual.add(PVector.random2D().mult(4));
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

void setup(){
  size(500,500);
  background(255);
  Browniano uno = new Browniano(50000);
  Browniano dos = new Browniano(50000);
  for(int i = 0; i<uno.n; i++){
    PVector p = uno.pos.get(i).add(new PVector(abs(uno.minX),abs(uno.minY)));
    noStroke();
    fill(0,10);
    ellipse(p.x,p.y,10,10);
  }
  
  for(int i = 0; i<dos.n; i++){
    PVector p = dos.pos.get(i).add(new PVector(abs(dos.minX),abs(dos.minY)));
    noStroke();
    fill(255,0,0,10);
    ellipse(p.x,p.y,10,10);
  }  
}
