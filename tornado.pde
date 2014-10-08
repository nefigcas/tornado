/*
Making a Tornado/Hurricane with circles of different sizes and sin waves
moving in a random direction and disappering
*/
int j = 100;
float dislocation=0;

void setup(){
  size(800, 400);
  ellipse(100, 0, 100,20); /*initial ellipse*/
}

void draw(){
  background(180);
  for(int i=0; i<width; i = i +20){
    
    dislocation=random(50);
    ellipse(j+dislocation, i, 400-i,20-i/30);
    
    /*trace a line from ellipse center to center*/
    
    delay(2);
  }
  j+= 10;
  j = j%(width+100);
  
}


