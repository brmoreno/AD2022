class Juego{
  int nivel;
  int vidas;
  int pantalla; //0=inicio, 1=juego; 2=ganaste, 3= perdiste; 4: fin del juego ; 5: fin de vidas:
  Nivel n;
  
  Juego(){
    nivel = 1;
    vidas = 3;
    pantalla = 0;
    Enemigo uno = new Enemigo(100,100,100,0);
    n= new Nivel(1,100,400,uno);
  }
  
  void display(){
    switch(pantalla){
      case 0:
        inicio();
      break;
      case 1:
        n.display();
        if(n.estado == 1){
          nivel++;
          if(nivel>=4){
            pantalla = 4;
          }
          else{
            pantalla = 2;
            // redifino nivel
             n = construirNivel();
          }
        }
        else if(n.estado == 2){
          vidas--;
          if(vidas >0){
            pantalla = 3;
            //construyo nuevamente el nivel
             n = construirNivel();
          }
          else{
            pantalla = 5;
          }
        }
      break;
      case 2:
        ganaste();
      break;
      case 3:
        perdiste();
      break;
      case 4:
        finDeNiveles();
      break;
      case 5:
        finDeVidas();
      break;      
    }
  }
  
  void control(){
    switch(pantalla){
      case 0:
        pantalla = 1;
      break;
      case 2:
        pantalla = 1;
      break;
      case 3:
        pantalla = 1;
      break; 
      case 4:
      pantalla = 0;
      vidas = 3;
      nivel = 1;
       n = construirNivel();
      break;
      case 5:
      pantalla = 0;
       vidas = 3;
      nivel = 1;
       n = construirNivel();
      break;
      
      
    }
  }
  
  void inicio(){
    background(255,0,0);
  }
  
  void ganaste(){
    background(255,255,0);
  }
  
  void perdiste(){
    background(0,255,0);
  }
  
  void finDeNiveles(){
    background(0,0,255);
  }
  void finDeVidas(){
    background(0);
  }
  
  Nivel construirNivel(){
    Enemigo uno = new Enemigo(100,100,100,0);
    Enemigo dos;
    Enemigo tres;
    Nivel n_ = new Nivel(1,100,400,uno);
    switch(nivel){
      case 2:
      uno = new Enemigo(100,100,120,1);
      dos = new Enemigo(400,400,100,1);
      n_ = new Nivel(2,100,400,uno,dos);
      break;
      case 3:
      uno = new Enemigo(100,100,120,2);
      dos = new Enemigo(400,400,100,2);
      tres = new Enemigo(400,100,80,2);
      n_ = new Nivel(3,100,400,uno,dos,tres);
      break;  
    }
    return n_;
  }
}
