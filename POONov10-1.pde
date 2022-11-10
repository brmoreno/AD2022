class Cubo{
  PVector pos;
  float t;
  color c;
  float rx;
  float ry;
  float r;
  float dr ;
  float dt;
  float ddt;
  
  Cubo(PVector pos_, float t_,  color c_, float rx_, float ry_){
    pos = pos_;
    t = t_;
    c = c_;
    rx = rx_;
    ry = ry_;
    dr = random(-0.01,0.01);
    dt = random(TWO_PI);
    ddt = random(0.05);
  }
  
  
  
  void display(){
    dt+=ddt;
    pos.setMag(abs(sin(dt)*200));
    pos.rotate(dr);
    pushMatrix();

    translate(pos.x,pos.y,pos.z);
    rotateX(rx);
    rotateY(ry);
    
    noStroke();
    scale(50);
   
    fill(c);
    shape(mono,0,0);
    popMatrix();
  }
}

ArrayList <Cubo> cubos;
PShape mono;

void setup(){ 
  size(500,500,P3D);
  cubos = new ArrayList <Cubo>();
  for(int i = 0; i<100; i++){
    //Cubo(PVector pos_, float t_,  color c_, float rx_, float ry_){
    cubos.add(new Cubo(PVector.random3D(),30, color(random(255),random(255),random(255)),random(TWO_PI),random(TWO_PI)));
  }
  
  mono = loadShape("mono.obj");
   mono.disableStyle();
}

void draw(){
lights();
  translate(width/2,height/2);
  rotateX(mouseX*0.005);
  background(255);
  
  for(Cubo c:cubos){
    c.display();
  }

}
