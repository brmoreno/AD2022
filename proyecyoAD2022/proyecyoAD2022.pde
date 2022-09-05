Personaje avatar;

void setup(){
  size(500,500);
  background(255);
  avatar = new Personaje(2);
}

void draw(){
  background(255);
  avatar.display();
  avatar.mover();
}
