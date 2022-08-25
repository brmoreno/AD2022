float r;
float s;

void setup(){
  size(500,500);
  background(255);
  r = 0;
  s = 1;
}


void draw(){
  background(255);
  mario(mouseX,mouseY);
  if(keyPressed){
    switch(key){
      case 'a':
        r+=0.1;
      break;
      case 's':
        r-= 0.1;
      break;
      case 'z':
        s+=0.01;
      break;
      case 'x':
        s-= 0.01;
      break;
    }
  }
}

void mario(int x_, int y_){
  pushMatrix();
  
  translate(x_,y_);
  scale(s);
  rotate(r);
  
  translate(-105,-60);
  
  noStroke();
  fill(255,0,0);
  rect(45,0,90,15);
  rect(30,15,150,15);
  rect(165,15,15,15);
  fill(140,96,18);
  rect(30,30,45,15);
  fill(245,204,135);
  rect(75,30,45,15);
  fill(0,0,0);
  rect(120,30,15,15);
  fill(245,204,135);
  rect(135,30,15,15);
  fill(140,96,18);
  rect(15,45,15,15);
  fill(245,204,135);
  rect(30,45,15,15);
  fill(140,96,18);
  rect(45,45,15,15);
  fill(245,204,135);
  rect(60,45,60,15);
  fill(0,0,0);
  rect(120,45,15,15);
  fill(245,204,135);
  rect(135,45,45,15);
  fill(140,96,18);
  rect(15,60,15,15);
  fill(245,204,135);
  rect(30,60,15,15);
  fill(140,96,18);
  rect(45,60,30,15);
  fill(245,204,135);
  rect(75,60,60,15);
  fill(0,0,0);
  rect(135,60,15,15);
  fill(245,204,135);
  rect(150,60,45,15);
  fill(140,96,18);
  rect(15,75,30,15);
  fill(245,204,135);
  rect(45,75,75,15);
  fill(0,0,0);
  rect(120,75,60,15);
  fill(245,204,135);
  rect(45,90,120,15);
  popMatrix();
}
