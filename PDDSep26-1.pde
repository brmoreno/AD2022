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

ArrayList <PVector> posiciones;
Fourrier uno;
float paso;
void setup(){
  size(600,600);
  background(255);
  paso = sqrt(2);
  uno= new Fourrier(50);
}

void draw(){
  if(mousePressed){
    posiciones.add(new PVector(mouseX,mouseY));
  }
}

void mousePressed(){
  posiciones = new ArrayList <PVector>();
}

void mouseReleased(){
  //ArrayList <PVector> pfinales = new ArrayList <PVector>();
  float dr = 0;
  for(int i = 0; i<posiciones.size()-1;i++){
    PVector p = posiciones.get(i);
    PVector q = posiciones.get(i+1);
    float dist = PVector.dist(p,q);
    fill(0,255,0);
    for(float j = 0; j<1; j+= paso/dist){
      PVector r = PVector.lerp(p,q,j);
      noStroke();
      stroke(255,0,0);
      for(int k = 0; k<10; k++){
        ellipse(r.x+uno.valSin(dr)*10,r.y+uno.valCos(dr)*10,5,5);
        dr+=0.1;
      }
    }    
  }
}
