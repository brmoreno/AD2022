class Browniano{
  PVector posActual;
  ArrayList <PVector> pos;
  int n;
  float maxX;
  float maxY;
  float minX;
  float minY;
  float magMax;
  
  
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
      if(posActual.mag()>magMax){
        magMax = posActual.mag();
      }
    }
  }
}

Browniano uno;
float nVueltas = 10;
void setup(){
  size(500,500);
  uno = new Browniano(1000);
}
void draw(){
  background(255);
  noFill();
  translate(width/2,height/2);
  PVector a = new PVector(3,0);
  ArrayList <PVector> vectores = new ArrayList<PVector>();  
  for(int i = 0; i<uno.n;i++){
    PVector p = uno.pos.get(i).copy();
    p.mult(2);
    float mag = p.mag();
    a.rotate(TWO_PI*nVueltas/uno.n);
    a.setMag(mag);
    vectores.add(a.copy());
  }
  
  for(int i = 0; i<vectores.size()-2;i++){
    PVector p = vectores.get(i);
    PVector q = vectores.get(i+1);
    PVector r = vectores.get(i+2);
    PVector s = PVector.lerp(p,q,0.5);
    PVector t = PVector.lerp(q,r,0.5);
    bezier(s.x,s.y,q.x,q.y,q.x,q.y,t.x,t.y);  
  }
}
