PVector pos;
PVector mov;
int d;
float offset; 
float dr;
float r;
void setup(){
  size(500,500);
  background(255);
  pos = new PVector(width/2,height/2);
  mov = PVector.random2D();
  offset = 1;
  r = 0;
  
}

void draw(){
  d++;
  fill(0);
  ellipse(pos.x,pos.y,2,2); 
  pos.add(mov);
  if(d>offset){
    dr = random(-0.001,0.001);
    mov.rotate(r);
    r+=dr;

    offset = 1;
  }
}
