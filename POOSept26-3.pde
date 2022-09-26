PImage imagen;
float vr;
float vg;
float vb;
void setup(){
  size(450,450);
  imagen = loadImage("gatocubrebocas.png");
}

void draw(){
  imagen = loadImage("gatocubrebocas.png");
  imagen.loadPixels();
  for(int i = 0; i<imagen.pixels.length;i++){
    color c = imagen.pixels[i];
    float rojo = red(c)+sin(i*0.03)*100;
    float verde = green(c)+vg;
    float azul = blue(c)+vb;
    
    color cfinal = color(rojo,verde,azul);
    imagen.pixels[i] = cfinal;   
  }
  
  imagen.updatePixels();
  
  image(imagen,0,0);
  
  if(mousePressed){
    vr = random(-100,100);
    vg = random(-100,100);
    vb = random(-100,100);
  }
}
