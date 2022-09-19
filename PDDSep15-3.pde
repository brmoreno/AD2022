class Epi{
  float t[];
  float a[];
  float da[];
  int n;
  
  Epi(int n_, int min_, int max_ ){
    n = n_;
    t = new float [n];
    a = new float [n];
    da = new float [n];
    for(int i = 0; i<n; i++){
      t[i] = random(min_, max_);
      a[i] = random(TWO_PI);
      da[i] = random(-0.1,0.1);
    }
    
  }
  
  void rota(){
    for(int i = 0; i<n; i++){
      a[i] += da[i];
    }
  }
  
  
  float px(){
    float x = 0;
    for(int i = 0; i<n; i++){
      x+= cos(a[i])*t[i];
    }
    return x;
  }
  
  float py(){
    float y = 0;
    for(int i = 0; i<n; i++){
      y+= sin(a[i])*t[i];
    }
    return y;
  }
  
  float px(int pos_){
    float x = 0;
    for(int i = 0; i<pos_; i++){
      x+= cos(a[i])*t[i];
    }
    return x;
  }
  
  float py(int pos_){
    float y = 0;
    for(int i = 0; i<pos_; i++){
      y+= sin(a[i])*t[i];
    }
    return y;
  }
}

color cols[] = new color[10];
Epi uno;
void setup(){
  size(600,600);
  uno = new Epi(10,30,100);
  background(255);
  for(int i = 0; i<10; i++){
    cols[i] = color(random(255),random(255),0);
  }
}
float px;
void draw(){
  px+=0.1;
  translate(px,height/2);
  uno.rota();
  for(int i = 1; i <10; i++){
    stroke(cols[i],50);
    line(uno.px(i),uno.py(i),uno.px(i-1),uno.py(i-1));
  }
}
