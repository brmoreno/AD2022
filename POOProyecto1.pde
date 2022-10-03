Juego j;

void setup(){
  size(500,500);
  j = new Juego();
}

void draw(){
  fill(0);
  background(255);
  j.display();
 
}

void keyPressed(){
  j.enKeyPressed();
}

class Juego{
  int pantalla; // 0:inicio, 1: partida; 2: resultado final;
  Partida p;
  int puntosJ1;
  int puntosJ2;
  int seguidoJ1;
  int seguidoJ2;
  
  Juego(){
    p = new Partida();
    pantalla = 0;
    puntosJ1 = 0;
    puntosJ2 = 0;
    seguidoJ1 = 0;
    seguidoJ2 = 0;
  }
  
  void display(){
    switch(pantalla){
      case 0:
        text("inicio, presiona a para comenzar", 200,200);
      break;
      case 1:
        p.display();
        p.logica();
        text(puntosJ1,50,50);
        text(puntosJ2,450,50);
      break;
      case 2:
        text("gano J1", 200,200);
      break;
       case 3:
        text("gano J2", 200,200);
      break;
    }
  }  
  void pantallaFinal(){
    text("EL JUEGO TERMINÓ",200,200);
  }
  
  void enKeyPressed(){
    p.enKeyPressed();
    if(pantalla == 0 && key =='a'){
      pantalla = 1;
    }
    if(pantalla == 1 && p.estado == 1 && key == 'a'){
      if(p.res == 1){
        puntosJ1++;
        seguidoJ1++;
        seguidoJ2 = 0;
      }
      if(p.res == 2){
        puntosJ2++;
        seguidoJ2++;
        seguidoJ1 = 0;
      }
      if(p.res == 0){
        seguidoJ1=0;
        seguidoJ2 = 0;
      }
      p = new Partida();
      if(puntosJ1== 5 || seguidoJ1 == 3){
        pantalla = 2;
      }
      if(puntosJ2== 5 || seguidoJ2 == 3){
        pantalla = 3;
      }
    }
  }
}

class Jugador{
  boolean yaJugo;
  int jugada; // 1 = piedra, 2 = papel, 3 = tijera
  int x,y;
  
  Jugador(int x_, int y_){
    x = x_;
    y = y_;
    yaJugo = false;
    jugada = 0;
  }
  
  void elegir(int j_){
    if(yaJugo == false){
      jugada = j_;
      yaJugo = true;
    }
  }
  
  void displayE0(){
    if(yaJugo == false){
      text("NO HA JUGADO ", x,y);
    }
    else{
      text("ESPERANDO", x,y);
    }
  }
  
  void displayE1(){
    switch(jugada){
      case 1:
      text("PIEDRA",x,y);
      break;
      case 2:
      text("PAPEL",x,y);
      break;
      case 3:
      text("TIJERAS",x,y);
      break;     
    }
  }
}

class Partida{
  Jugador uno;
  Jugador dos;
  int estado; //0:no han elegido, 1: ya eligieron, 2: resultado;
  int res;
  
  Partida(){
    uno = new Jugador(200,200);
    dos = new Jugador(200,300);
    estado = 0;
  }
  
  void enKeyPressed(){
    switch(key){
      case 'q':
      uno.elegir(1);
      break;
      case 'w':
      uno.elegir(2);
      break;
      case 'e':
      uno.elegir(3);
      break;      
      case 'z':
      dos.elegir(1);
      break;
      case 'x':
      dos.elegir(2);
      break;
      case 'c':
      dos.elegir(3);
      break;
    }
  }
  
  void logica(){
    if(uno.yaJugo && dos.yaJugo){
      estado = 1;
      println(evaluacion());
    }    
  }
  
  void display(){
    if ( estado == 0){
      uno.displayE0();
      dos.displayE0();
    }
    else if(estado == 1){
      uno.displayE1();
      dos.displayE1();
      switch(evaluacion()){
        case 0:
          text("EMPATE , presiona A para continuar", 200,50);
        break;
        case 1:
          text("GANO J1, presiona A para continuar", 200,50);
        break;
        case 2:
          text("GANO J2, presiona A para continuar", 200,50);
        break;
      }
    }
  }
  
 int evaluacion(){ // 0 si es empate, 1 si gana 1, 2 si gana 2
   int resultado = 0;
   if(uno.jugada == 1 && dos.jugada == 2){
     resultado = 2;
   }
   else if(uno.jugada == 1 && dos.jugada ==3){
     resultado = 1;
   }
   else if(uno.jugada==2 && dos.jugada == 1){
     resultado = 1;
   }
   else if(uno.jugada ==2 && dos.jugada == 3){
     resultado = 2;
   }
   else if(uno.jugada == 3 && dos.jugada ==1){
     resultado =2;
   }
   else if(uno.jugada == 3 && dos.jugada == 2){
     resultado = 1;
   }  
   res = resultado;
   return resultado;
 }
}
