
void setup(){
  size(500,500);
}

void draw(){
  background(255);
  asterisco(width/2,height/2,mouseX);
}

void asterisco(int x_, int y_, int n_){
  pushMatrix();
  translate(x_,y_);
  for(int i = 0; i<n_; i++){
    pushMatrix();
    rotate(i*TWO_PI/n_);
    rect(0,0,200,20);
    popMatrix();
  }
  popMatrix();  
}
