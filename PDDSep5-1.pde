void setup(){
  size(800,800);
}

float v = 0.04;
int t = 20;
void draw(){

  for(int i = 0; i<width; i+=t){
    for(int j = 0; j<height; j+=t){
      noStroke();
      float c = noise(i*v,j*v);
      color b = color(0,255,0);
      if(c<0.4){
        b = lerpColor(color(255),color(0,0,255),c/0.4);
      }
      else if(c>0.6){
        b = lerpColor(color(255,0,0),color(255),(c-0.6)/0.4);
      }
      else{
        b = lerpColor(color(0,0,255),color(255,0,0),(c-0.4)/0.2);
      }
      fill(b);
       rect(i,j,t,t);
    }
  } 
}
