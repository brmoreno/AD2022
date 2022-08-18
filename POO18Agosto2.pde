int t;
float d;

void setup(){
  size(500,500);
  t = 5;
}

void draw(){
  d+=0.01;
  for(int i = 0 ; i<width; i+= t){
    for(int j = 0; j<height;j+=t){
      fill(noise(20+i*0.01+d,20+j*0.01,d)*255,noise(6+i*0.01+d,6+j*0.01,d)*255,noise(i*0.01+d,j*0.01,d)*255);
      noStroke();
      rect(i,j,t,t);
    }
  }
}
