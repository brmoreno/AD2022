class Nodo{
  PVector pos;
  PVector v;
  float t;
  
  Nodo(){
    pos = new PVector(random(width),random(height));
    v = PVector.random2D().mult(random(3,7));
    t = random(50,100);
  }
}

class Agente{
  PVector pos;
  PVector d;
  float t;
  color c;
  
  Agente(){
    pos = new PVector(random(width),random(height));
    d = new PVector(2,0);
    t = 20;
    c = gato.get(round(pos.x),round(pos.y));
  }
  
  void display1(){
    float r = 0;
    float g = 0; 
    float b = 0;
    for(int i = round(pos.x-t/2); i<pos.x+t/2; i++){
      for(int j = round(pos.y-t/2);j<pos.y+t/2;j++){
        color c = gato.get(i,j);
        r+= red(c);
        g+= green(c);
        b+= blue(c);        
      }
    }
    r/=t*t;
    g/=t*t;
    b/=t*t;
    
    noStroke();
    fill(r,g,b);
    ellipse(pos.x,pos.y,t,t);
  }
  
  void display2(){
    color cActual = gato.get(round(pos.x),round(pos.y));
    c = lerpColor(c,cActual,0.05);
    noStroke();
    fill(c);
    ellipse(pos.x,pos.y,t,t);
  }
  
  void mover(ArrayList <Nodo> n_){
    t-=0.5;
    t = constrain(t,0,50);
    PVector mov = new PVector(0,0);
    for(Nodo n:n_){
      float dist = n.pos.dist(pos);
      if(dist < n.t){

        float factor = map(dist,0,n.t,1,0);
        mov.add(n.v.copy().mult(factor));
      }
    }
    
    mov.normalize().mult(2);
    pos.add(mov);
  }
  
}

PImage gato;
ArrayList <Agente> agentes;
ArrayList <Nodo> nodos;

void setup(){
  size(450,450);
  gato = loadImage("gatocubrebocas.png");
  agentes = new ArrayList <Agente> ();
  nodos = new ArrayList <Nodo>();
  for(int i=0; i<1000; i++){
    agentes.add(new Agente());
  }
  for(int i = 0; i<50; i++){
    nodos.add(new Nodo());
  }
  background(255);
}

void draw(){
  for(Agente a:agentes){
    a.display2();
    a.mover(nodos);
  }
}
