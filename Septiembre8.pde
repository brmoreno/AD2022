float [] x = new float [200];
float [] y = new float [200];
float [] w = new float [200];
float [] h = new float [200];
float [] r = new float [200];
float [] g = new float [200];
float [] b = new float [200];
float [] dx = new float [200];

void setup(){
  size(500,500);  
  for( int i = 0; i< 200; i++){
    x[i] = random(width);
    y[i] = random(height-101);
    w[i] = random(50,100);
    h[i] = random(50,100);
    r[i] = random(-100,100);
    g[i] = random(-100,100);
    b[i] = random(-100,100);
    dx[i] = random(-1,1);
  }
}

void draw(){
 
  background(0);
  loadPixels();
  for(int i = 0; i<200; i++){
    x[i] += dx[i];
    rectangulo(round(x[i]),round(y[i]),round(w[i]),round(h[i]),r[i],g[i],b[i]);
  }  
  updatePixels(); 
}

void rectangulo(int x_, int y_, int w_, int h_,float r_, float g_, float b_){
  for (int j = 0; j< h_; j++){
    int ancla = (y_+j)*width + x_;
    for(int i = ancla; i< ancla + w_; i++){
      int colorActual = pixels[i];
      float rojo = red(colorActual);
      float verde  = green (colorActual);
      float azul = blue (colorActual);
      rojo += r_;
      verde += g_;
      azul += b_;
      pixels[i] = color(rojo,verde,azul);
    }
  }  
}
