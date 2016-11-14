color fill1 = color(255,0,0);
color fill2 = color(0,255,0);
color fill3 = color(0,0,255);
int positionx = 0;
int positiony= 50 ;
color ball;
int xdir = 1;
int speed =  5;
void setup(){
 size(600,100);
}

void draw(){
  background(0);

  
  fill(fill1);
  rect(0,0,100,100);
  fill(fill2);
  rect(250,0,100,100);
  fill(fill3);
  rect(500,0,100,100);
  

  fill(ball);
  ellipse(positionx, positiony,18,18);
  
  if (get(int(positionx+10),int( positiony)) == color(fill1)||get(int(positionx-10),int( positiony)) == color(fill1) ){
    ball= color(fill1);
  }
  
   if (get(int(positionx+10),int( positiony)) == color(fill2)||get(int(positionx-10),int( positiony)) == color(fill2) ){
    ball= color(fill2);
  }
  
   if (get(int(positionx+10),int( positiony)) == color(fill3)||get(int(positionx-10),int( positiony)) == color(fill3) ){
    ball= color(fill3);
  }
  
  if (positionx>width || positionx <0){
    xdir *=-1;
  }
  positionx +=xdir*speed;

}