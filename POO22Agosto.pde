float x[] = new float [100];
float y[] = new float [100];
float t[] = new float [100];
color c[] = new color[100];
color c2[] = new color[100];
float dx[] = new float[100];
float dy[] = new float[100];
int n[] = new int[100];

void setup(){
  size(500,500);
  for( int i = 0; i<x.length; i++){
    x[i] = random(width);
    y[i] = random(height);
    t[i] = random(40,100);
    c[i] = color(random(255),random(0,85),random(120,255));
    c2[i] = color(random(200,255),random(150,255),random(0,105));
    dx[i] = random(-1,1);
    dy[i] = random(-1,1);
    n[i] = round(random(2,8));
  }
}

void draw(){
  background(255);
  for(int i = 0; i<100; i++){
    x[i]+= dx[i];
    y[i] += dy[i];
    if(x[i]+t[i]/2>width){
      dx[i]*= -1;
    }
    
    if(x[i]-t[i]/2<0){
      dx[i]*= -1;
    }
    
    if(y[i]+t[i]/2>height){
      dy[i]*= -1;
    }
    
    if(y[i]-t[i]/2<0){
      dy[i]*= -1;
    }   
    particula1(x[i],y[i],t[i],c[i],c2[i],n[i]);
  }
}

void particula1(float x_, float y_, float t_, color c_, color c2_, int n_){
  noStroke();
  for( int i = 0; i<n_; i++){
    if(i%2 == 0){
      fill(c_);
    }
    else{
      fill(c2_);
    }
    float t = t_ - t_/n_*1f*i ;
    ellipse(x_,y_,t,t);
  }
}
