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
Browniano dos;
Browniano tres;
float r;
float s;
void setup(){
   size(800,200);
   uno = new Browniano(800);
   dos = new Browniano(800);
   tres = new Browniano(800);
   r = 0;
   s = 1;
   
   for(int i = 0; i<uno.n;i++){
     PVector p = uno.pos.get(i);
     noStroke();
     float r = map(p.x,uno.minX,uno.maxX,0,255);
     p = dos.pos.get(i);
     float g = map(p.x,dos.minX,dos.maxX,0,255);
     p = tres.pos.get(i);
     float b = map(p.x,tres.minX,tres.maxX,0,255);
     fill(r,g,b);
     rect(i,0,1,height);
   }
}
