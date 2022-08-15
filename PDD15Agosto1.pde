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
    for(int j = (yi-ti<0)? 0:yi-ti; j<yi+ti && j<height ;j++){
      for( int i = (xi-ti<0)? 0:xi-ti; i<xi+ti && i<width;i++){
        float dist = dist(xi,yi,i,j);
        if(dist<t){
          //float intensidad = map(dist,0,t,1,0);
          int pixelInteres = j*width + i;
          int colorGato = gato.pixels[pixelInteres];
          int colorFondo = pixels[pixelInteres];
          float ro = red(colorGato);
          float ve  = green (colorGato);
          float az = blue (colorGato);
          float roj = red(colorFondo);
          float ver  = green (colorFondo);
          float azu = blue (colorFondo);
          
          roj += ro;//rojo*intensidad;
          ver += ve;//verde*intensidad;
          azu += az; //azul*intensidad;
          pixels[pixelInteres] = color(roj,ver, azu);
        }
      }
    }
  }
}
