class Nodo{
  PVector pos;
  float t;
  PVector d;
  
  Nodo(){
    pos = new PVector(random(width), random(height));
    t= random(50,100);
    d = PVector.random2D().mult(random(3,50));
  } 
}

class Agente{
  PVector pos;
  
  Agente(float x_, float y_){
    pos = new PVector(x_,y_);  
  }
  
  void display(){
    noStroke();
    fill(0);
    ellipse(pos.x,pos.y,3,3);
  }
  
  void mover(ArrayList <Nodo> n_){
    PVector mov = new PVector(0,0);
    for(Nodo n:n_){
      float dist = pos.dist(n.pos);
      if(dist<n.t){
        float factor = map(dist,0,n.t,1,0);
        PVector p = n.d.copy().mult(factor);
        mov.add(p);
      }
    }
    pos.add(mov);
  }  
}


class Linea{
  ArrayList <Agente> agentes;
  
  Linea(PVector inicio_, float t_){
    agentes = new ArrayList <Agente>();
    for(int i =0 ; i<t_; i+= 10){
      agentes. add(new Agente(inicio_.x,inicio_.y+i));
    }
  }
  
  void display(){
    beginShape();
    noFill();
    for(int i = 0; i<agentes.size();i++){ 
      vertex(agentes.get(i).pos.x,agentes.get(i).pos.y);
    }
    endShape();
  }
  
  void mover(ArrayList <Nodo> n_){
    for(Agente a:agentes){
      a.mover(n_);
    }
  } 
}

ArrayList <Nodo> nodos;
ArrayList <Linea> lineas;
Linea uno;
void setup(){
  background(255);
  size(600,600);
  nodos = new ArrayList <Nodo>();
  lineas = new ArrayList <Linea>();
  for(int i = 0 ; i<100; i++){
    nodos.add(new Nodo());
  }
  
  for(int i = 0; i<width; i+=15){
    lineas.add(new Linea(new PVector(i,-50),700));
  }
 
  for(Linea l:lineas){
    l.mover(nodos);
    l.display();
  }
}
