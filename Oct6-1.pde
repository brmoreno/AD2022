class funcionCordillera{
  
  float[] puntoMedio;
  float [] rango;
  float []amp;
  float tam;
  int n;
  
  funcionCordillera(int tam_, int n_ ){
    tam = tam_;
    n= n_;
    puntoMedio = new float[n_];
    rango = new float [n_];
    amp = new float [n];
    for(int i = 0; i<n; i++){
      puntoMedio[i] = random(800);
      rango[i] = random(50,400);
      amp[i] = random(-10,40);
    }
  }
  
  float valAt(float v_){
    float valor = 0;
    for( int i = 0; i<n; i++){
      float pM = puntoMedio[i];
      float min = pM-rango[i]/2f;
      float max = pM+rango[i]/2f;
      if(v_>min && v_<max){
        float escala = map(v_,min,max,0,PI);
        valor-= sin(escala)*amp[i];
      }
      
    }
    
    
    return valor;
    
  }
}


funcionCordillera una;

void setup(){
  background(255);
  una = new funcionCordillera(800,50);
  size(800,400);
  for(int i = 0; i<width;i++){
    float x = i;
    float y = height+una.valAt(i);
    ellipse(x,y,3,3);
  }
}
