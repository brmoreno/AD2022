//variables globales
float x,y,w,h; 
color relleno;

// setup
void setup(){
 size(400,400);
 background(255);
 x= width/3;
 y= height/2;
 w = 100;
 h = 100;
 relleno = color(255,0,0);
}

//draw
void draw(){ 
  background(255);
  noStroke();
  fill(relleno);
  ellipse(x,y,w,h);
  x+=2;
  // ¿Qué voy a evaluar?
  if(x>width+w/2){
    //¿Qué voy a cambiar?
    x=-w/2;
  }  
}
