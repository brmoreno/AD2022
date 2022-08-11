//variables globales
float x;
float y;
float w;
float h;

//setup
void setup(){
  size(500,500);
  background(255);
  x = 0;
  y = 250;
  w = 100;
  h = 100;
}

//draw
// como le hago para que la elipse se mueva más rápido
// como le hago para que la elipse de mueva más lento
// como le hago para que se mueva en sentid contrario
// como le hago para que se mueva además en forma vertical


void draw(){
  background(255);
  x+=1;
  fill(255,0,0);
  noStroke();
  ellipse(x,y,w,h);
}
