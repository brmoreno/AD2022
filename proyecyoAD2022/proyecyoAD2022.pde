Juego j;

void setup(){
  size(500,500);
  j = new Juego();
}

void draw(){
  j.display(); 
}

void keyPressed(){
  j.control();
}
