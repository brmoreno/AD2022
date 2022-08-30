class RandomWalk{
  PVector pos;
  ArrayList <PVector>posA;
  int n;
  int[][] matriz;
  int w;
  int h;
  int max;
  
  RandomWalk(int n_, int w_, int h_){
    w = w_;
    h = h_;
    matriz = new int[w_][h_];
    n= n_;
    pos = new PVector(w_/2,h_/2);
    posA = new ArrayList<PVector>(); 
    max = 0;
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
        
        if(pos.x>w_-1){
          pos.x = 0;
        }
        if(pos.x<0){
          pos.x = w_-1;
        }
        if(pos.y>h_-1){
          pos.y = 0;
        }
        if(pos.y<0){
          pos.y = h_-1;
        }
        posA.add(pos.copy());
        matriz[floor(pos.x)][floor(pos.y)]++;
        if(matriz[floor(pos.x)][floor(pos.y)]>max){
          max = matriz[floor(pos.x)][floor(pos.y)];
        }
    }
  }  
}

RandomWalk uno;
RandomWalk dos;
RandomWalk tres;
float s;
void setup(){
  size(500,500);
  uno = new RandomWalk(10000,50,50);
  dos = new RandomWalk(10000,50,50);
  tres = new RandomWalk(10000,50,50);
  s = 1;
  background(255);  
  noStroke();
  int t = 10;
  for(int i = 0; i<uno.w; i++){
    for(int j = 0; j<uno.h; j++){
      int n = uno.matriz[i][j];
      int o = dos.matriz[i][j];
      int p = tres.matriz[i][j];
      fill(n*255/uno.max*2,o*255/dos.max*2,30+p*255/tres.max*2);
      rect(i*t,j*t,t,t);
    }
  }
}
