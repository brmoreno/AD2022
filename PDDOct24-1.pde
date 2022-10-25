class Nodo{
  PVector pos;
  float t;
  float i;
  PVector d;
  PVector d2;
  
  Nodo(){
    pos = new PVector(random(width), random(height));
    t= random(100,200);
    i = random(-2,2);
    d = PVector.random2D().mult(random(1,4));
    d2 = PVector.random2D().mult(random(1,4));
  } 
}

class Agente{
  PVector pos;
  color c;
  color c2;
  float t;
  boolean on;  
  
  Agente(){
    pos = new PVector(random(width),random(height));
    c = color(random(20,60),random(150,255),random(60,120),120);
    c2 = color(random(20,60),random(100,150),random(0,120),120);
    t = random(1,3);
    on = false;
  }  
  
  void display(){
    color cfondo = fondo.get(round(pos.x),round(pos.y));
    if(cfondo == color(0) && on){
      noStroke();
      fill(c);
      ellipse(pos.x,pos.y,t,t);
    } 
    
    if(cfondo == color(255) && on){
      noStroke();
      fill(c2);
      ellipse(pos.x,pos.y,t,t);
    }
  }
  
  
  void mover(ArrayList <Nodo> n_){
    t-= 0.05;
    t = constrain(t,0,30);
    PVector mov = new PVector(0,0);
    for(Nodo n:n_){
      float dist = pos.dist(n.pos);
      if(dist<n.t){
        on = true;
        float factor = map(dist,0,n.t,1,0);
        PVector m = pos.copy().sub(n.pos).rotate(HALF_PI).normalize().mult(factor);
        mov.add(m);
      }
    }
    pos.add(mov.normalize());
  }   
}


float n[][] = new float[600][600];
ArrayList <Nodo> nodos;
ArrayList <Agente> agentes;
PImage fondo;
void setup(){
  size(600,600);
  fondo = createImage(600,600,RGB);
  nodos = new ArrayList <Nodo>();
  agentes = new ArrayList <Agente>();  
  for(int i = 0; i<10; i++){
    nodos.add(new Nodo());
  }  
  for(int i = 0; i<20000; i++){
    agentes.add(new Agente());
  }  
  float max = 0;
  float min = 0;  
  for(int i = 0; i<600; i++){
    for(int j = 0; j<600; j++){
      float v = 0;
      for(Nodo n:nodos){
        float dist = dist(i,j,n.pos.x,n.pos.y);
        if(dist<n.t){
          float factor = map(dist,0,n.t,1,0);
          v+= factor*n.i;
        }
      }      
      n[i][j] = v;
      if(v>max){
        max = v;
      }
      if(v<min){
        min  = v;
      }
    }
  } 
 for(int i = 0; i<600; i++){
   for(int j = 0; j<600; j++){
     float v = n[i][j];
     int v2 = round(map(v,min,max,0,12));
     color c = color(127);
     if(v2%4 ==0){
       c = color(0);
     }    
     if(v2%4 ==2){
       c = color(255);
     }  
     fondo.pixels[i+j*width] = c;
   }
 } 
 background(255);
}

void draw(){  
  for(Agente a:agentes){
    a.display();
    a.mover(nodos);
  }
}
