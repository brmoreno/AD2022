class RandomWalk{
  PVector pos;
  ArrayList <PVector>posA;
  int n;
  
  RandomWalk(int n_){
    n= n_;
    pos = new PVector(25,25);
    posA = new ArrayList<PVector>();    
    for(int i = 0; i<n_;i++){
        int paso = floor(random(4));
        switch(paso){
          case 0:
            pos.x++;
          break;
          case 1:
            pos.x--;
          break;
          case 2:
            pos.y++;
          break;
          case 3:
            pos.y--;
          break;
        }
        if(pos.x>50){
          pos.x = 0;
        }
        if(pos.x<0){
          pos.x = 50;
        }
        if(pos.y>50){
          pos.y = 0;
        }
        if(pos.y<0){
          pos.y = 50;
        }
        posA.add(pos.copy());
    }
  }  
}

RandomWalk uno;
float s;
void setup(){
  size(500,500);
  uno = new RandomWalk(10000);
  s = 1;
}

void draw(){
  background(255);
  
  for(int i = 0; i<uno.n-1; i++){
    PVector p = uno.posA.get(i).copy();
    p.mult(10).add(mouseX,mouseY);
    noStroke();
    fill(255,0,0,20);
    rect(p.x,p.y,10,10);    
  }
  
  if(keyPressed){
    if(key == 'a'){
      s+=0.1;
    }
    if(key == 's'){
      s-=0.1;
    }
  }
}
