PVector pv1;
PVector pvs[];
void setup(){
  size(800,400);
  pv1 = new PVector(150,0);
  pvs = new PVector[800];
  for(int i = 0; i<800; i++){
    pvs[i] = new PVector();
  }
}

void draw(){
  translate(width/4,height/2);
  background(255);
  stroke(0);
  ellipse(0,0,300,300);
  pv1.rotate(0.05);
  line(0,0,pv1.x,pv1.y);
  line(0,0,pv1.x,0);
  line(pv1.x,0,pv1.x,pv1.y);
  ellipse(pv1.x,pv1.y,10,10);
  line(pv1.x,pv1.y,width/4,pv1.y);
  translate(width/4,0);
  for(int i = 799; i>0; i--){
    pvs[i] = pvs[i-1].copy();
    ellipse(i,pvs[i].y,3,3);
  }
  pvs[0] = pv1.copy();  
}
