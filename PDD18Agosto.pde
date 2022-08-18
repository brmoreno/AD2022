ArrayList <Particula> particulas;
PGraphics pg;

void setup(){
  size(500,500);
  particulas = new ArrayList <Particula>();
  for(int i = 0; i<100; i++){
    particulas.add(new Particula());
  }
  background(255);
  pg = createGraphics(width,height);
}

void draw(){
  background(random(255));
  image(pg,0,0);
  for(Particula p: particulas){
    p.display();
    p.mover();
  }
  
}

void keyPressed(){
  pg = createGraphics(width,height);
}

class Particula {
  PVector pos;
  PVector dir;
  float rojo;
  float verde;
  float azul;
  float t;
  float r;
  float contador;
  float limite;

  
  Particula(){
    pos = new PVector(random(width),random(height));
    dir = PVector.random2D();
    rojo = random(255);
    verde = random(255);
    azul = random(255);
    t = 20;
    r = random(-0.01,0.01);
    contador = 0;
    limite = random(20,50);

  }
  
  void mover(){
  
    pos.add(dir);
    dir.rotate(r);
    contador++;
    if(contador > limite){
      r = random(-0.1,0.1);
      limite = random(50,100);
    }
    if(pos.x<0+t){
       dir.x = abs(dir.x); 
    }
    
    if(pos.x>width-t){
       dir.x = -abs(dir.x); 
    }
    if(pos.y<0+t){
       dir.y = abs(dir.y); 
    }
    
    if(pos.y>height-t){
       dir.y = -abs(dir.y); 
    } 
    
  }
  
  void display(){
    noStroke();
    fill(rojo,verde,azul);
    pg.beginDraw();
    pg.noStroke();
    pg.fill(rojo,verde,azul);
    pg.ellipse(pos.x,pos.y,1,1);
    pg.endDraw();
    ellipse(pos.x,pos.y,t,t);
  }
}
