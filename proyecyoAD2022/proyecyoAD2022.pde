Personaje avatar;
Enemigo e1,e2,e3;
Item i;

void setup(){
  size(500,500);
  background(255);
  avatar = new Personaje(2);
  e1 = new Enemigo(100,100,100,0);
  e2 = new Enemigo(400,100,100,1);
  e3 = new Enemigo(400,400,120,2);
  i = new Item(100,400);
}

void draw(){
  background(255);
  avatar.display();
  avatar.mover();
  e1.display();
  e1.mover();
  e2.display();
  e2.mover();
  e3.display();
  e3.mover();
  i.display();
  if(avatar.colision(e1)||avatar.colision(e2)||avatar.colision(e3) ){
    println("colision!");
  }
  else if(avatar.captura(i)){
    println("capturado");
  }
  else{
    println("no colision");
  } 
}
