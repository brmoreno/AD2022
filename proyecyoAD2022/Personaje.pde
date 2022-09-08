class Personaje{
  float d;
  color c;
  float x;
  float y;
  float v;
  float dir;
  
  Personaje(float v_){
    v = v_;
    d = 60;
    c = color(255,0,0);
    x = width/2;
    y = height/2;
    dir = 0;
  }
  
  void mover(){
    float dx = cos(dir)*v;
    float dy = sin(dir)*v;
    x+= dx;
    y +=dy;
    if(keyPressed){
      if(key == 'a'){
        dir-= 0.1;
      }
      if(key == 'd'){
        dir += 0.1;
      }
    }
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
  
  void display(){
    noStroke();
    fill(c);
    ellipse(x,y,d,d);
  }
  
  boolean colision(Enemigo e_){
     boolean colisiono = false;
    //Personaje + enemigo
    float distancia = dist(this.x,this.y,e_.x,e_.y);
    float sumaRadios = this.d/2 + e_.t/2;
    if(distancia < sumaRadios){
      colisiono = true;
    }   
    return colisiono;
  }
  
  void captura(){
    //personaje + Item
  }
  
}
