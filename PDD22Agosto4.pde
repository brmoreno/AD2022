PVector pv [] = new PVector [10];
float interp =0;
void setup(){
  size(500,500);
  background(255);
  for(int i = 0; i<10; i++){
    pv[i] = new PVector(random(width), random(height));
    fill(0);
    ellipse(pv[i].x,pv[i].y,5,5);
    if(i>0){
      line(pv[i].x,pv[i].y,pv[i-1].x,pv[i-1].y);
    }
  } 
}

void draw(){
  interp+=0.01;
  PVector ref = pv[ceil(interp)];
  PVector objetivo = pv[ceil(interp)-1];
  PVector posAct = PVector.lerp(ref,objetivo,ceil(interp)-interp);
  fill(255,0,0);
  noStroke();
  ellipse(posAct.x,posAct.y,10,10);  
}
