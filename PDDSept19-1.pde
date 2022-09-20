class Fourrier{
  float amp[];
  float f[];
  float q[];
  int n;
  
  Fourrier(int n_){
    n = n_;
    amp = new float[n];
    f = new float[n];
    q = new float [n];
    for(int i = 0; i<n; i++){
      f[i] = random(TWO_PI);
      if(random(1)<0.5){
        amp[i] = random(0.25,1);
      }
      else{
        amp[i] = random(1,4);
      }
      
      if(random(1)<0.5){
        q[i] = random(0.25,1);
      }
      else{
        q[i] = random(1,4);
      }
    }    
  }
  
  float valAt(float v_){
    float v = 0;
    for(int i = 0 ; i<n;i++){
      v+= sin(v_*q[i]+f[i])*amp[i];
    }
    return v;   
  }  
}

Fourrier uno;
void setup(){
 uno = new Fourrier(10);
  size(600,600);
 translate(width/2,height/2);
 background(255);
 fill(0);
 float rg = 0;
 for(float i = 0; i<TWO_PI; i+=TWO_PI/50000){ 
   rg+=0.006;
   float r = rg+ uno.valAt(i*30)*10;
   float x = cos(i*6)*r;
   float y = sin(i*6)*r;
   ellipse(x,y,3,3);
 } 
}
