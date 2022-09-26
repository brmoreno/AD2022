PImage imagen;
PImage recorte;

void setup(){
  size(450,450);




  imagen = loadImage("gatocubrebocas.png");
}

void draw(){
  int px = round(random(0,width-100));
  int py = round(random(0,height-100));
  int w = round(random(50,100));
  int h = round(random(50,100));
  recorte = imagen.get(px,py,w,h);
  float dx = random(-15,15);
  float dy = random(-15,15);
  tint(random(155,255),random(155,255),random(255));
  image(recorte,px+dx,py+dy);
  noTint();
  saveFrame("imagenGato/####.png");
}
