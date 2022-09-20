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
      amp[i] = random(0.1,1.3);
      q[i] = random(0.1,1.3);
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

Fourrier r;
Fourrier g;
Fourrier b;
void setup(){
  size(1200,400);
  background(255);
  r = new Fourrier(20);
  g = new Fourrier(20);
  b = new Fourrier(20);

}

//float d;
float offset[] = {127,127,127};
float amp[] = {20,20,20};
float frq[] = {0.01,0.01,0.01};
void draw(){background(255);
 //d+=0.01;
  background(255);
  for(int i = 0; i<width;i++){
   float rojo = r.valAt(i*frq[0])*amp[0]+offset[0];
   float verde = g.valAt(i*frq[1])*amp[1]+offset[1];
   float azul = b.valAt(i*frq[2])*amp[2]+offset[2];
   color c = color(rojo,verde,azul);
   noStroke();
   fill(c);
   rect(i,0,1,width);
  }
}

void keyPressed(){
  switch(key){
    case 'q':
    offset[0]+= 5;
    break;
    case 'w':
    offset[0]-=5;
    break;
    case 'a':
    amp[0]+=1;
    break;
    case 's':
    amp[0]-=1;
    break;
    case 'z':
    frq[0]+=0.001;
    break;
    case 'x':
    frq[0]-=0.001;
    break;
  }
}
