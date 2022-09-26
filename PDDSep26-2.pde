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
      amp[i] = random(0.5);
      q[i] = random(-1,1);
    }    
  }
  
  float valSin(float v_){
    float v = 0;
    for(int i = 0 ; i<n;i++){
      v+= sin(v_*q[i]+f[i])*amp[i];
    }
    return v;   
  }  
  
  float valCos(float v_){
    float v = 0;
    for(int i = 0 ; i<n;i++){
      v+= cos(v_*q[i]+f[i])*amp[i];
    }
    return v;   
  }  
}

Fourrier uno;

void setup(){
 size(800,500);
 uno = new Fourrier(50);
 background(255);
 float pasoi = 0.3;
 int npaso = 200;
 for(int i = 0; i<width; i+= 1){
   float x = i + uno.valSin(i%npaso*pasoi)*20;
   float y = 200 + uno.valCos(i%npaso*pasoi)*20;
   ellipse(x,y,5,5);
    x = i +uno.valSin(i%npaso*pasoi)*20;
    y = 200 - uno.valCos(i%npaso*pasoi)*20;
   ellipse(x,y,5,5);
    x = i -uno.valSin((npaso-i%npaso)*pasoi)*20;
    y = 200 + uno.valCos((npaso-i%npaso)*pasoi)*20;
   ellipse(x,y,5,5);
    x = i -uno.valSin((npaso-i%npaso)*pasoi)*20;
    y = 200 - uno.valCos((npaso- i%npaso)*pasoi)*20;
   ellipse(x,y,5,5);
 }

}
