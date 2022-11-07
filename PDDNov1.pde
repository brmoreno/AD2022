import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<Box> boxes;

void setup() {
  size(640,360);
  smooth();
  background(255);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);
  boxes = new ArrayList<Box>();
}

void draw() {
  box2d.step();
  if (mousePressed) {
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
  }
  for (Box b: boxes) {
    b.display();
    b.attract();
  }
}


class Box {
  Body body;
  float w;
  float h;
  int tipo;
  color c;

  Box(float x, float y) {
    w = random(4, 16);
    h = random(4, 16);
    makeBody(new Vec2(x, y), w, h);
    tipo = 1;
    if(random(1)<0.5){
      tipo = 2;
    }
    c= color(random(255),random(255),random(255));
  }

  void killBody() {
    box2d.destroyBody(body);
  }
  
  
  void attract(){
    Vec2 target = box2d.coordPixelsToWorld(100,100);
    if(tipo == 2){
      target = box2d.coordPixelsToWorld(500,300);
    }
    Vec2 bodyVec = body.getWorldCenter();
    target.subLocal(bodyVec);
    if(keyPressed){
      target.addLocal(bodyVec);
    }
    target.normalize();
    target.mulLocal(50);
    body.applyForce(target, bodyVec);
  }


  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(c);
    noStroke();
    rect(0, 0, w, h);
    popMatrix();
  }

  void makeBody(Vec2 center, float w_, float h_) {
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 1;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);
    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(0, 0));
    body.setAngularVelocity(20);
  }
}
