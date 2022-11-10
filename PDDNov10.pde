class Part {
  Body body;
  float r;
  color c;

  Part(float r_, float x, float y) {
    r = r_;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.world.createBody(bd);
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    body.createFixture(fd);
    c= color(255,0,0);
  }

  void applyForce(Nodo n_) {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // si el body esta a una distancia < radio del nodo
    float dist = dist(n_.pos.x,n_.pos.y,pos.x,pos.y);
    if(dist < n_.t){
      float fact = map(dist,0,n_.t,1,0);
      PVector v = n_.pos.copy().sub(new PVector(pos.x,pos.y));
      v.normalize().mult(fact).mult(n_.f);
      body.applyForce(new Vec2 (v.x,-v.y), body.getWorldCenter());
    }
  }


  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    fill(c);
    noStroke();
    ellipse(0,0,r*3,r*3);
    popMatrix();
  }
}

class Nodo{
  PVector pos;
  float t;
  float f;
  PVector mov;
  
  Nodo(){
    pos = new PVector(random(width),random(height));
    t = random(50,200);
    f = random(-50,50);
    mov = PVector.random2D();
  }
  
  void display(){
    noStroke();
    fill(0,0,255);
    ellipse(pos.x,pos.y,t*2,t*2);
    stroke(255);
    
  }
  void mover(){
    pos.add(mov);
    if(pos.x<0|| pos.x>width){
      mov.x*=-1;
    }
    if(pos.y<0|| pos.y>width){
      mov.y*=-1;
    }
  }
}

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList <Part> parts;
ArrayList <Nodo> nodos;

void setup(){
  size(500,500);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,0);
  
  parts = new ArrayList <Part> ();
  for(int i = 0 ; i<1000; i++){
    parts.add(new Part(random(1,6),random(width),random(height)));
  }
  nodos = new ArrayList <Nodo>();
  for(int i = 0; i<50; i++){
    nodos. add(new Nodo());
  }
  nodos.get(0).pos = new PVector(width/2,height/2);
  nodos.get(0).mov = new PVector(0,0);
  nodos.get(0).f = 20;
  nodos.get(0).t = dist(0,0,width*2,height*2);
  
  nodos.get(1).pos = new PVector(width/2,height/2);
  nodos.get(1).mov = new PVector(0,0);
  nodos.get(1).f = -100;
  nodos.get(1).t = dist(0,0,100,100);
  background(255);
}

void draw(){
  
    box2d.step();
  for(Nodo n:nodos){
      n.mover();
   }
  background(255);
  for(Part p:parts){
    p.display();
    for(Nodo n:nodos){
      p.applyForce(n);
    }
  }
  
}
