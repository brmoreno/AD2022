import processing.sound.*;
SoundFile sonido;
Amplitude aa;
FFT fft;
float [] analisis = new float[16];

void setup(){
  size(400,400);
  sonido = new SoundFile(this,"paris.mp3");
  aa = new Amplitude(this);
  sonido.loop();
  aa.input(sonido);
  fft = new FFT(this,16);
  fft.input(sonido);
}

void draw(){
  background(255);
  sonido.amp(map(mouseX,0,width,0,1));
  sonido.rate(map(mouseY,0,height,0.1,2));
  float tam = aa.analyze()*400;
  // noStroke();
  //fill(255,0,0);
  //ellipse(width/2,height/2,tam,tam); 
  fft.analyze(analisis);
  for(int i = 0; i<16; i++){
    float v = analisis[i];
    rect(i*width/16,width,width/16,-v*width);
  }
  
}

void keyPressed(){
  if(key == 'q'){
    sonido.jump(random(sonido.duration()));
  }
}
