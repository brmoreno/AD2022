float x[] = new float [100];
float y[] = new float [100];
float t[] = new float [100];
color c[] = new color[100];
float dx[] = new float[100];
float dy[] = new float[100];

void setup(){
  size(500,500);
  for( int i = 0; i<x.length; i++){
    x[i] = random(width);
    y[i] = random(height);
    t[i] = random(10,50);
    c[i] = color(random(255),random(0,85),random(120,255));
    dx[i] = random(-1,1);
    dy[i] = random(-1,1);
  }
}

void draw(){
  background(255);
  for(int i = 0; i<100; i++){
    x[i]+= dx[i];
    y[i] += dy[i];
    noStroke();
    fill(c[i]);
    ellipse(x[i],y[i],t[i],t[i]);
  }
}

