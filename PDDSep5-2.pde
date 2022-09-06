float v = 0.01;

void setup(){
  size(500,500);
}

void draw(){
  PImage imagen = createImage(width,height,RGB);
  for(int i = 0; i<width; i++){
    for(int j = 0; j<height; j++){
      color c = color(255);
      if(noise(i*v,j*v)<0.45){
        c = color(0);
      }
      else if(noise(i*v,j*v)<0.55){
        c = color(lerp(0,255,(noise(i*v,j*v)-0.45)/0.1));
      }    
      imagen.set(i,j,c);
    }
  }  
  image(imagen,0,0);
}
