class Nodo{
  PVector pos;
  float a;
  PVector f;
  
  Nodo(){
    pos = new PVector(random(width),random(height));
    a = random(50,250);
    f = PVector.random2D().mult(random(1,5));
  }
  
  void display(){
    noStroke();
    fill(0,0,255,30);
    ellipse(pos.x,pos.y,a,a);
    stroke(0);
    line(pos.x,pos.y,pos.x+f.x*20,pos.y+f.y*20);
  }
}

class Agente{
  PVector pos;
  
  Agente(){
    pos = new PVector(random(width),random(height));
  }
  Agente(float x_, float y_){
    pos = new PVector(x_,y_);
  }
  
  void display(){
    noStroke();
    fill(255,0,0,30);
    ellipse(pos.x,pos.y,2,2);
  }
  
  void movimiento( ArrayList <Nodo> n_){
    float dx = 0;
    float dy = 0;
    for(int i = 0; i<n_.size(); i++){
      Nodo n = n_.get(i);
      float dist = pos.dist(n.pos);
      if(dist<n.a){
        float factor = map(dist,0,n.a,1,0);
        dx+=factor*n.f.x;
        dy+=factor*n.f.y;
      }
    }
    pos.add(dx,dy);
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
      agentes.add(new Agente(i,j));
    }
  }
}

void draw(){
  //background(255);
 
  for(Agente a:agentes){
    a.display();
    a.movimiento(nodos);   
  }
}
