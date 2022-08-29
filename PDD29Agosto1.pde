PVector offsets [] = new PVector [3];

void setup(){
  size(500,500);  
  for(int i = 0;i< 3; i++){
    offsets[i] = PVector.random2D().mult(random(5));
  }
}

float z;
void draw(){
  z+=0.1;
  loadPixels();
  for(int i = 0; i<pixels.length;i++){
    int x = i%width;
    int y = i/width;
    float r = noise(x*0.01+offsets[0].x,y*0.01+offsets[0].y,z)*255;
    float g = noise(x*0.01+offsets[1].x,y*0.01+offsets[1].y,z)*255;
    float b = noise(x*0.01+offsets[2].x,y*0.01+offsets[2].y,z)*255;
    pixels[i] = color(r,g,b);
  }
  updatePixels();
}
