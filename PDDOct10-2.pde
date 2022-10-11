class Nodo{
  PVector pos;
  float a;
  float f;
  
  Nodo(){
    pos = new PVector(random(width),random(height));
    a = random(50,250);
    f = random(-3,3);
  }
  
  void display(){
    noStroke();
    fill(0,0,255,30);
    ellipse(pos.x,pos.y,a,a);
    stroke(0);
  }
}

class Agente{
  PVector pos;
  float t;
  PVector di;
  Agente(){
    pos = new PVector(random(width),random(height));
    di = new PVector(-3,0);
  }
  Agente(float x_, float y_){
    pos = new PVector(x_,y_);
    t = 8;
    di = new PVector(0,0);
  }
  
  void display(){
    stroke(0);
    strokeWeight(0.2);
    fill(255);
    ellipse(pos.x,pos.y,t,t);
  }
  
  void movimiento(ArrayList <Nodo> n_){
    float dx = 0;
    float dy = 0;
    t-=0.2;
    t =constrain(t,0,40);
    for(int i = 0; i<n_.size(); i++){
      Nodo n = n_.get(i);
      float dist = pos.dist(n.pos);
      if(dist<n.a){
        float factor = map(dist,0,n.a,1,0);
        PVector direccion = PVector.sub(n.pos,pos).normalize().mult(factor).mult(n.f);
        dx+=direccion.x;
        dy+=direccion.y;
      }
    }
    PVector d = new PVector(dx,dy);
    d.normalize().mult(1);
    pos.add(d);
  }
}

ArrayList<Nodo> nodos;
ArrayList <Agente> agentes;
void setup(){
  background(255);
  size(600,600);
  nodos = new ArrayList <Nodo>();
  agentes = new ArrayList <Agente>();
  for(int i = 0; i<70; i++){
    nodos.add(new Nodo());
  }
  for(int i = 0 ; i<width; i+=10){
    for(int j = 0; j<height; j+= 10){
      agentes.add(new Agente(i+random(-5,5),j+random(-5,5)));
    }
  }
}

void draw(){
  for(Agente a:agentes){
    a.display();
    a.movimiento(nodos);   
  }
}
