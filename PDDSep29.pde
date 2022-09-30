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
PrintWriter output;

void setup(){
  size(400,400);
  uno = new Fourrier(20);
  output = createWriter("positions.txt"); 
}

float t;
void draw(){
 float x = uno.valSin(t)*30;
 float y = uno.valCos(t)*30;
 output.println(x + " " + y);
 translate(width/2,height/2);
 ellipse(x,y,5,5);
 t+=0.5;  
}

void keyPressed() {
  output.flush();  
  output.close();  
  exit();  
}

