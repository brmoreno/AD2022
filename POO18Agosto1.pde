size(500,500);
for(int i = 0; i < width; i++){
  float x = i; 
  float y = width/2 + sin(i*0.05)*100;
  float t = 40;
  color c = color(255 -i*0.5,0,0);
  fill(c);
  noStroke();
  rect(x,y,t,t);  
  println(i);
}
