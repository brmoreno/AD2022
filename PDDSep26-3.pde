
float offset [];
float freq[];
float vosc[];
float lim[];
float val[];
float sat[];


void setup(){
  size(500,500);
  loadPixels();
  offset = new float[20];
  freq = new float [20];
  vosc = new float [20];
  lim = new float[20];
  val = new float [20];
  sat = new float [20];
  for(int i = 0; i<20; i++){
    offset[i] = random(TWO_PI);
    freq[i] = random(0.1,0.5);
    lim[i] = random(1);
    sat[i] = random(20,100);
  }
  
  
  for(int i = 0; i<pixels.length;i++){
    int x = i%width;
    int y = i/width;
    float rojo = 0;
    float verde = 0;
    float azul = 0;
    for(int j = 0; j<10; j++){
      vosc[j] = sin(offset[j]+x*freq[j]);
      val[j] = 0;
      if(vosc[j]>lim[j]){
        val[j]=sat[j];
      }
      
    }
    for(int j = 10; j<20; j++){
      vosc[j] = sin(offset[j]+y*freq[j]);
      val[j] = 0;
      if(vosc[j]>lim[j]){
        val[j]=sat[j];
      }
    }
    
    for(int j= 0; j<3;j++){
      rojo+=val[j]+val[j+10];
      verde+=val[j+3]+val[j+13];
      azul+=val[j+6]+val[j+16];
    }
    
   
    
    
    pixels[i] = color(rojo,verde,azul);  
  }
  updatePixels();
}
