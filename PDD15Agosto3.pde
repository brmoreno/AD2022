ArrayList <Particula> particulas;
PImage gato;
PImage gato2;

void setup(){
  size(500,500);
  particulas = new ArrayList <Particula>();
  for(int i = 0; i<100; i++){
    particulas.add(new Particula());
  }
  gato = loadImage("gatocubrebocas.png");
  gato.resize(width,height);
  gato2 = createImage(width,height,ARGB);
  int valorInicial = gato2.pixels[25];
  println(valorInicial);
}

void draw(){
  background(255,0,0);
  gato2.loadPixels();
  for(int i = 0; i<gato2.pixels.length;i++){
    gato2.pixels[i] = 0;
  }
  
  for(Particula p:particulas){
    p.display();
    p.mover();
  }
  gato2.updatePixels();
  image(gato2,0,0);
}

void keyPressed(){
  println(gato2.get(mouseX,mouseY));
  
  gato2.save("gato.png");
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
    rojo = random(-1,2);
    verde = random(-1,2);
    azul = random(-1,2);
    t = random(10,100);
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
          float intensidad = map(dist,0,t,1,0);
          int pixelInteres = j*width + i;
          int colorGato = gato.pixels[pixelInteres];
          int colorFondo = gato2.pixels[pixelInteres];
          float ro = red(colorGato)*rojo;
          float ve  = green (colorGato)*verde;
          float az = blue (colorGato)*azul;
          float roj = red(colorFondo);
          float ver  = green (colorFondo);
          float azu = blue (colorFondo);
          
          roj += ro*intensidad;
          ver += ve*intensidad;
          azu += az*intensidad;
          gato2.pixels[pixelInteres] = color(roj,ver, azu);
        }
      }
    }
  }
}
