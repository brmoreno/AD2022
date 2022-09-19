PVector pv1;
PVector pv2;
PGraphics pg;

void setup(){
  size(400,400);
  pv1 = new PVector(150,0);
  pv2 = new PVector(50,0);
  pg = createGraphics(width,height);
  pg.beginDraw();
  pg.background(255);
  pg.endDraw();
}

void draw(){
  pg.beginDraw();
  pg.translate(width/2,height/2);
  pg.noStroke();
  pg.fill(255,0,0);
  pg.ellipse(pv1.x+pv2.x,pv1.y+pv2.y,5,5);
  pg.endDraw();
  image(pg,0,0);
  translate(width/2,height/2);
  
  
  stroke(0);
  ellipse(0,0,300,300);
  noFill();
  ellipse(pv1.x,pv1.y,3,3);
  ellipse(pv1.x,pv1.y,100,100);
  pv1.rotate(0.01);
  pv2.rotate(0.07);
  line(0,0,pv1.x,pv1.y);
  line(pv1.x,pv1.y, pv1.x+pv2.x,pv1.y+pv2.y);
  
}
