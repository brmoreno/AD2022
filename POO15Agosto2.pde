//variables globales
float x,y,w,h,dx; 
color relleno;

// setup
void setup(){
 size(400,400);
 background(255);
 x= width/2;
 y= height/2;
 w = 100;
 h = 100;
 relleno = color(255,0,0);
 dx=1;
}

//draw
void draw(){ 
  background(255);
  noStroke();
  fill(relleno);
  ellipse(x,y,w,h);
  x+= dx;
  
  if(x>width){
    //hacer que cambie de dirección
    dx=-1;
  }  
}
