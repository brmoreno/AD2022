class Nivel{
  //Atributos
  Personaje yo;
  Item i;
  Enemigo uno;
  Enemigo dos;
  Enemigo tres;
  int estado; //0=sigo jugando; 1 = capturé; 2 = colision
  
  //constructor para nivel con un enemigo
  Nivel(float velPers_,float xI_, float yI_, Enemigo uno_){
    yo = new Personaje(velPers_);
    i = new Item(xI_,yI_);
    uno = uno_;
  }
  
  //constructor para nivel con dos enemigos
  Nivel(float velPers_,float xI_, float yI_, Enemigo uno_, Enemigo dos_){
    yo = new Personaje(velPers_);
    i = new Item(xI_,yI_);
    uno = uno_;
    dos = dos_;
  }
  
  //constructor para tres enemigos
  Nivel(float velPers_,float xI_, float yI_, Enemigo uno_, Enemigo dos_, Enemigo tres_){
    yo = new Personaje(velPers_);
    i = new Item(xI_,yI_);
    uno = uno_;
    dos = dos_;
    tres = tres_;
  }
    
  //métodos
  
  void display(){
    background(255);
    yo.display();
    yo.mover();
    i.display();
    funcionEnemigo(uno);
    funcionEnemigo(dos);
    funcionEnemigo(tres);
    if(yo.captura(i)){
      estado = 1;
    }
  }
  
  void funcionEnemigo(Enemigo e_){
    if(e_ != null){
      e_.display();
      e_.mover();
      if(yo.colision(e_)){
        estado = 2;
      }
    }
  }
  
  
}
