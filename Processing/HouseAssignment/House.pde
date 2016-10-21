
void setup(){
 size(500,500); 
  
}

int y = 40;
int a = 0;
int b =0;
float c =0;
float d =0;
float e =0;
float f =0;
float g =0;
float blood = 10;

int shoot = 450;

//bouncing ball variables
float ballX = 20;
float ballY = 0;
float h = 50;
float speedY = 2;


void draw(){
  background(0,0,255);
  noStroke();
  
     //sun
 noStroke();
 fill(#FAFF08);
 ellipse(250,470,600,600);
 
 stroke(0);
 strokeWeight(5);
  fill(255);
  
  //clouds
  noStroke();
  fill(255);
  ellipse(a,y+10,40,40);
  ellipse(a+10,y+20,40,40);
  ellipse(a+15,y+20,40,40);
  ellipse(a+15,y-10,40,40);
  ellipse(a+50,y+20,40,40);
  ellipse(a+45,y-5,40,40);
  ellipse(a+70,y+10,40,40);
  
  ellipse(b,y+10,40,40);
  ellipse(b+10,y+20,40,40);
  ellipse(b+15,y+20,40,40);
  ellipse(b+15,y-10,40,40);
  ellipse(b+50,y+20,40,40);
  ellipse(b+45,y-5,40,40);
  ellipse(b+70,y+10,40,40);
  
  ellipse(c,y+10,40,40);
  ellipse(c+10,y+20,40,40);
  ellipse(c+15,y+20,40,40);
  ellipse(c+15,y-10,40,40);
  ellipse(c+50,y+20,40,40);
  ellipse(c+45,y-5,40,40);
  ellipse(c+70,y+10,40,40);
  
  ellipse(d,y+10,40,40);
  ellipse(d+10,y+20,40,40);
  ellipse(d+15,y+20,40,40);
  ellipse(d+15,y-10,40,40);
  ellipse(d+50,y+20,40,40);
  ellipse(d+45,y-5,40,40);
  ellipse(d+70,y+10,40,40);
  
  ellipse(e,y+10,40,40);
  ellipse(e+10,y+20,40,40);
  ellipse(e+15,y+20,40,40);
  ellipse(e+15,y-10,40,40);
  ellipse(e+50,y+20,40,40);
  ellipse(e+45,y-5,40,40);
  ellipse(e+70,y+10,40,40);
  
  ellipse(c,y+10,40,40);
  ellipse(c+10,f+20,40,40);
  ellipse(c+15,f+20,40,40);
  ellipse(c+15,f-10,40,40);
  ellipse(c+50,f+20,40,40);
  ellipse(c+45,f-5,40,40);
  ellipse(c+70,f+10,40,40);
  
  ellipse(c,g+10,40,40);
  ellipse(c+10,g+20,40,40);
  ellipse(c+15,g+20,40,40);
  ellipse(c+15,g-10,40,40);
  ellipse(c+50,g+20,40,40);
  ellipse(c+45,g-5,40,40);
  ellipse(c+70,g+10,40,40);

//cloud movement
a=a+2;
if(a > 500) {
    a = 0;
  }
 b=b+3;
 if(b > 500) {
    b = 0;
  }
  
  c=c+0.5;
  if(c > 500) {
    c = 0;
  }
  
  d=d+2.5;
if(d > 500) {
    d = 0;
  }
 e=e+5;
 if(e > 500) {
    e = 0;
  }
  
  f=f+4;
  if(f > 500) {
    f = 0;
  }
  
   g=g+1.5;
  if(g > 500) {
    g = 0;
  }
  
  
  

strokeWeight(5);
stroke(0);
  //main box
  fill(#B22222);
 rect(100,200,300,200);
 
 //roof
 fill(#D2B48C);
 triangle(90,200,410,200,250,100);
 
 //door
 fill(#8B4513);
 rect(200,300,100,150);
 line(250,300,250,400);
 fill(#C0C0C0);
 ellipse(240,350,10,10);
 ellipse(260,350,10,10);
 
fill(255);
//window 1
strokeWeight(10);
rect(110,210,75,75);
strokeWeight(5);
line(147.5,210,147.5,285);
line(110,247.5,185,247.5);

//window 2
strokeWeight(10);
rect(315,210,75,75);
strokeWeight(5);
line(352.5,210,352.5,285);
line(315,247.5,390,247.5);

//window 3
ellipse(250,247.5,100,75);
line(250,210,250,285);
line(200,247.5,300,247.5);
 
 //grass
 noStroke();
 fill(#08FF5C);
 rect(0,400,500,100);
 

//cloud
stroke(0);
fill(0);
beginShape();
vertex(200,400);
vertex(250,500);
vertex(360,500);
vertex(300,400);
endShape();

//bounicing ball
ellipse(ballX, ballY,h,h);
speedY = speedY + 0.5;
ballY = ballY + speedY;

if (ballY > height - h){
 ballY = height - h;
 speedY= speedY * -0.9;
}

else if(ballY <=0){
  speedY = -speedY;
}

//Stickman
noFill();
line(490,500,465,450);
line(440,500,465,450);
line(465,450,465,400);
ellipse(465,370,50,50);
line(450,425,480,425);

//stickman2
line(190,500,165,450);
line(140,500,165,450);
line(165,450,165,400);
ellipse(165,370,50,50);
line(150,425,180,425);

fill(255,0,0);
noStroke();
ellipse(shoot,425,10,10);
shoot = shoot - 10;
if (shoot < 165){
  shoot = 450;
  blood= blood+1;
  ellipse(165,425,30,30);
  fill(0);
  ellipse(155,365,10,10);
  ellipse(175,365,10,10);
}







//noLoop();
}