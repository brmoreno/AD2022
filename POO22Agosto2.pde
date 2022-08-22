float x,y,t;
boolean arriba,abajo,izq,der;

void setup(){
  size(500,500);
  x = width/2;
  y = height/2;
  t = 50;
}

void draw(){
  background(255);
  noStroke();
  fill(255,0,0);
  ellipse(x,y,t,t);
  if(arriba){
    y--;
  }
  if(abajo){
    y++;
  }
  if(der){
    x++;
  }
  if(izq){
    x--;
  }
}

void keyPressed(){
  if(key == 'w'){
    arriba = true;
  }
  if(key == 's'){
    abajo = true;
  }
  if(key == 'd'){
    der = true;
  }
  if(key == 'a'){
    izq = true;
  }
}

void keyReleased(){
  if(key == 'w'){
    arriba = false;
  }
  if(key == 's'){
    abajo = false;
  }
  if(key == 'd'){
    der = false;
  }
  if(key == 'a'){
    izq = false;
  }
}

void mousePressed(){
}

void mouseReleased(){
}
