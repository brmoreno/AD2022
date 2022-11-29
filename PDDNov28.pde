//es todo lo que vimos hoy en un mismo sketch, es necesario modificar la parte que les interesa
ArrayList <Box> parts;

Boundary bd;
RFont f;
RShape grp;
RPoint[] points;
PVector pvs[];
void setup() {
  formas  = new ArrayList <Forma>();
  parts =new ArrayList <Box>();
  size(640,360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,0);
  bd = new Boundary(width/2,height,width,30);
  
  RG.init(this);
  grp = RG.getText("e", "FreeSans.ttf", 400, CENTER);
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(8);
  points = grp.getPoints();
  pvs = new PVector[points.length];
  for(int i = 0; i<pvs.length; i++){
    pvs[i] = new PVector(points[i].x+width/2,points[i].y+height/2+100);
   // parts.add(new PartConA(random(width), random(height), 5, pvs[i]));
  }
}

float px = 0;

void draw(){
  px+=5;
  background(255);
  box2d.step();
  bd.display();
 
  for(Box p:parts){
    p.display();
  }
 
  //for(PartConA p:parts){
  //  p.mover();
  //}
  //if(mousePressed){
    for(int i = 0; i<5; i++){
    parts.add(new Box(px,height/2));
    }
  //}
}


class Boundary {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;
  
  // But we also have to make a body for box2d to know about it
  Body b;

  Boundary(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    // Define the polygon
    PolygonShape sd = new PolygonShape();
    // Figure out the box2d coordinates
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    // We're just a box
    sd.setAsBox(box2dW, box2dH);


    // Create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    
    // Attached the shape to the body using a Fixture
    b.createFixture(sd,1);
  }

  // Draw the boundary, if it were at an angle we'd have to do something fancier
  void display() {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }

}

class Box {

  // We need to keep track of a Body and a width and height
  Body body;
  float w;
  float h;

  // Constructor
  Box(float x, float y) {
    w = random(4, 16);
    h = random(4, 16);
    // Add the box to the box2d world
    makeBody(new Vec2(x, y), w, h);
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+w*h) {
      killBody();
      return true;
    }
    return false;
  }

  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    rect(0, 0, w, h);
    popMatrix();
  }

  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center, float w_, float h_) {

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createFixture(fd);

    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(random(-5, 5), random(-5, 5)));
    body.setAngularVelocity(random(-5, 5));
  }
}

class Forma{
  ArrayList <Particle> parts;
  
  Forma(PVector pos[]){
    parts = new ArrayList<Particle>();
    for(int i = 0; i<pos.length;i++){
      PVector p = pos[i];
      parts.add(new Particle(p.x,p.y,2));
    }
    
    
   for(int i = 0; i<parts.size()-1; i++){
     for(int j = i+1; j<i+2 && j<parts.size()-1 ; j++){
       DistanceJointDef djd = new DistanceJointDef();
       djd.bodyA = parts.get(i).body;
       djd.bodyB = parts.get(j).body;
       Vec2 posA = parts.get(i).body.getWorldCenter();
       Vec2 posB = parts.get(j).body.getWorldCenter();
       djd.length = dist(posA.x,posA.y,posB.x,posB.y);
       djd.frequencyHz = 3;
       djd.dampingRatio = 0.5;
       DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);       
     }
   }  
    
  }
  
     
  void display(){
    fill(0);
    noStroke();
    beginShape();
   for(int i = 0; i<parts.size(); i++){
     Vec2 pos = box2d.getBodyPixelCoord(parts.get(i).body);
     vertex(pos.x,pos.y);

   }
   endShape();
   for(int i = 0; i<parts.size(); i++){

     parts.get(i).display();
   }
   
 }
 
}

class PartConA extends Particle {
  PVector a;
  
  PartConA(float x, float y, float r_, PVector a_){
    super(x,y,r_);
    a = a_;
  }
  
  void mover(){
    applyForce(a);
  }
}

class Particle {
  Body body;
  float r; 
  color col;

  Particle(float x, float y, float r_) {
    r = r_;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.world.createBody(bd);
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r); 
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 0.3;
    fd.friction = 0.3;
    fd.restitution = 1;    
    body.createFixture(fd);
    col = color(255,0,0);
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }
  
  void applyForce(PVector n) {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // si el body esta a una distancia < radio del nodo
    PVector v = n.copy().sub(new PVector(pos.x,pos.y));
    v.normalize().mult(20);
    body.applyForce(new Vec2 (v.x,-v.y), body.getWorldCenter());
    
  }
  
  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+r*2) {
      killBody();
      return true;
    }
    return false;
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    fill(col);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);
    line(0,0,r,0);
    popMatrix();
  }
}
