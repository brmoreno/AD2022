//variables globales
float x;
float y;
float w;
float h;

float r;
float dr;

float ro;
float dro;
float ve;
float dve;
float az;
float daz;


//setup
void setup(){
  size(500,500);
  background(255);
  x = 250;
  y = 250;
  w = 100;
  h = 100;
  r = 0;
  dr = 0.01;
  
   ro = random(6);
   dro = random (-0.1,0.1);
   ve = random(6);
   dve = random (-0.1,0.1);
   az = random(6);
   daz = random (-0.1,0.1);
}

//draw
// como le hago para que la elipse se mueva más rápido
// como le hago para que la elipse de mueva más lento
// como le hago para que se mueva en sentid contrario
// como le hago para que se mueva además en forma vertical


void draw(){
  //background(255);
  noStroke();
  r+=dr;
  ro += dro;
  ve += dve;
  az += daz;
  float rojo = sin(ro)*255;
  float verde = sin(ve)*255;
  float azul = sin(az)*255;
  fill(rojo,verde,azul);
  w=sin(r)*400;
  ellipse(x,y,w,w);
}
