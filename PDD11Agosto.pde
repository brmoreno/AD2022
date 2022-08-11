ArrayList <Particula> particulas;

void setup(){
  size(500,500);
  particulas = new ArrayList <Particula>();
  for(int i = 0; i<200; i++){
    particulas.add(new Particula());
  }
}

void draw(){
  background(0);
  loadPixels();
  for(Particula p:particulas){
    p.mover();
    p.display();
  }
  updatePixels();
}
class Particula {
  PVector pos;
  PVector dir;
  float rojo;
  float verde;
  float azul;
  float t;
  
  Particula(){
    pos = new PVector(random(width),random(height));
    dir = PVector.random2D();
    rojo = random(-255,255);
    verde = random(-255,255);
    azul = random(-255,255);
    t = random(10,50);
  }
  
  void mover(){
    pos.add(dir);
    if(pos.x<0+t){
       dir.x = abs(dir.x); 
    }
    
    if(pos.x>width-t){
       dir.x = -abs(dir.x); 
    }
    if(pos.y<0+t){
       dir.y = abs(dir.y); 
    }
    
    if(pos.y>height-t){
       dir.y = -abs(dir.y); 
    }    
  }
  
  void display(){
    int ancla  = (floor(pos.y))*width + floor(pos.x);
    int xi = floor(pos.x);
    int yi = floor(pos.y);
    int ti = floor(t);
    for(int j = (yi-ti<0)? 0:yi-ti; j<yi+ti && j<height-ti ;j++){
      for( int i = (xi-ti<0)? 0:xi-ti; i<xi+ti && i<width-ti;i++){
        int pixelInteres = j*width + i;
        int colorActual = pixels[pixelInteres];
        float ro = red(colorActual);
        float ve  = green (colorActual);
        float az = blue (colorActual);
        ro += rojo;
        ve += verde;
        az += azul;
        pixels[pixelInteres] = color(ro,ve, az);
      }
    }
  }
}
