class funcionColor{
  int n;
  float[] v;
  float min;
  float max;
  
  funcionColor(int n_, float min_, float max_){
    n = n_;
    min = min_;
    max = max_;
    v = new float[n];
    for(int i = 0; i<n_; i++){
      v[i] = random(min,max);
    }
  }
  
  float valAt(float v_){
    int input = floor(constrain(v_,0,255));
    int anterior = input/(255/(n-1));
    int siguiente = constrain(anterior+1,0,n-1);
    int dist = input%(255/(n-1));
    return lerp(v[anterior],v[siguiente],dist/(255f/(n-1)));
  } 
}

PImage gato;
funcionColor rojo;
funcionColor verde;
funcionColor azul;

void setup(){
  size(450,450);
  gato = loadImage("gatocubrebocas.png");
  rojo = new funcionColor(5,0,255);
  verde = new funcionColor(5,0,255);
  azul = new funcionColor(5,0,255);
}

void draw(){
  loadPixels();
  for(int i = 0; i<pixels.length;i++){
    color c = gato.pixels[i];
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    color d = color(rojo.valAt(r),verde.valAt(g),azul.valAt(b));
    pixels[i] = d;
  }
  updatePixels();
}
