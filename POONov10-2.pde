class Cubo{
  PVector pos;
  float t;
  color c;
  float rx;
  float ry;
  
  Cubo(PVector pos_, float t_,  color c_, float rx_, float ry_){
    pos = pos_;
    t = t_;
    c = c_;
    rx = rx_;
    ry = ry_;
  }
  
  void mover(){
    float dx = pos.x - mouseX;
    float dy = pos.x - mouseY;
    //rx = dx*0.01;
    //ry = dy*0.01;
   
     
     float dist = pos.dist(new PVector(mouseX,mouseY));
     rx = dist*0.05;
     ry = dist*0.05;
     if(dx<0){
       rx*=-1;
     }
     if(dy<0){
       ry*=-1;
     }
  }
  
  void display(){
    pushMatrix();
    float dz = sin(pos.x*0.01+dt)*50+ sin(pos.y*0.01+dt)*50;
    translate(pos.x,pos.y,pos.z+dz);
    rotateX(rx);
    rotateY(ry);
    fill(c);
    noStroke();
    box(t);
    popMatrix();
  }
}

Cubo  uno;
ArrayList <Cubo> cubos;
float dt = 0;
float dtt = 0.05;

void setup(){
  size(500,500,P3D);
  uno = new Cubo(new PVector(250,250,0),30,color(random(255),random(255),random(255)),0,0);
  cubos = new ArrayList<Cubo>();
  for(int i = 0; i<width; i+=30){
    for(int j = 0; j<height; j+=30){
     cubos.add(new Cubo(new PVector(i,j,0),30,color(random(255),random(255),random(255)),0,0));
    }
  }
}

void draw(){
  dt+= dtt;
  lights();
  background(0);
 for(Cubo c:cubos){
   c.mover();
   c.display();
 }
 
}
