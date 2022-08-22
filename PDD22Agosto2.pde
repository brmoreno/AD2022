PVector pos;
PVector mov;
int d;
float offset; 
void setup(){
  size(500,500);
  background(255);
  pos = new PVector(width/2,height/2);
  mov = PVector.random2D();
  offset = random(10,50);
}

void draw(){
  d++;
  fill(0);
  ellipse(pos.x,pos.y,2,2); 
  pos.add(mov);
  if(d>offset){
    mov = PVector.random2D();
    d=0;
    offset = random(10,50);
  }
}
