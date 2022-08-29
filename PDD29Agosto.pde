float v;

void setup(){
  size(500,500);
  v = 0.01;
}

float z;
void draw(){
  z+= 0.01;
  loadPixels();
  for(int i = 0; i<pixels.length;i++){
    int x = i%width;
    int y = i/width;
    float r = noise(x*v,y*v,z)*50;
    int r2 = floor(r);
    int r3 = r2%5;
    color c = 0;
    if(r3 == 0){
      c = color(255);
    }
    else{
      c = color(0);
    }
    pixels[i] = c;
  }
  updatePixels();
}
