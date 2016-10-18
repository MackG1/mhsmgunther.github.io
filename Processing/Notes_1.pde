
//This is a comment

//The first thing we need is a canvas for our drawing to go onto
//This is going to create our drawing area AND setup initial values
//RUNS ONLY ONCE
void setup(){
  //determine the size of the canvas(width, height)
  //size is in pixels
  size(800,600); 
}

//Draw your shapes
//This is run REPEATEDLY
void draw(){
  //Place a point on the canvas at(40,60)
  //point(40,60);
  //More points
  //point(40,61);
  //point(41,61);
  //point(41,60);
  //point(46,61);
  //point(200,321);
  //point(80,100);
  //point(80,101);
  
  //Draw a lign from Point A to Point B
  //use line(X1,Y1,X2,Y2)
  line(600,100,200,500);
  line(200,100,600,500);

  //Draw a rectangle or a square
  //Rectangle by default start from top left point
  //use rect (x,y,width height)
  //rect(380,280,40,40);
  
  //Draw a ellipse or cercle
  //ellipses by default start from the center
  //use ellipse(x,y,width height)
  ellipse(400,300,60,60);
 
 //draw three perfect circles stacked on top of each other
 //change outline with stroke();
 //change fill color
 fill(#FF46ED);
 //Biggest cercle first
  ellipse(400,300,60,60);
  fill(126);
  ellipse(400,300,40,40);
  fill(255);
  ellipse(400,300,20,20);
  
  
}