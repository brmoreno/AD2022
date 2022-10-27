import processing.video.*;
Capture cam;
void setup(){
  size(640,480);
  String[] cameras = Capture.list();
  printArray(cameras);
  cam = new Capture(this,cameras[0]);
  cam.start();
}
int x;
void draw(){  
    if (cam.available()) {       
    cam.read();
     x++;
      for(int i = 0; i<width; i++){
        color c = cam.get(i,x%height);
        stroke(c);
        point(i,x%height);
      }
  } 
}
