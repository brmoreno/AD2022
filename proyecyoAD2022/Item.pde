class Item{
  float t;
  color c;
  float x;
  float y;
  
  Item(float x_, float y_){
    x = x_;
    y = y_;
    c = color(255,255,0);
    t = 20;
  }
  
  void display(){
    noStroke();
    fill(c);
    ellipse(x,y,t,t);
  }
}
