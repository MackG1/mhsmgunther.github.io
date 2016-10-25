
//1




void setup(){
 size(1000,800); 
 frameRate(0.5);
}

void draw(){ 
//loat positionx = random(1000);
//float positiony = random(800);
//float size = random(500);

float positionx = 500;
float positiony = 400;
float size = 500;

float eyes = size*1/5;

  background(random(255),random(255),random(255));
  
   

//Outline
stroke(random(255),random(255),random(255));
strokeWeight(size*0.01);
  fill(random(255));
 ellipse(positionx,positiony,size,size);  
 fill(255);
 
 strokeWeight(2);
 //mouth
 stroke(0);
 ellipse(positionx,positiony + size*0.3,size/2,size*0.2);

 
 //eye
 stroke(255);
 fill(random(255),random(255),random(255));
 ellipse(positionx - eyes, positiony- eyes,eyes,eyes);
 ellipse(positionx + eyes, positiony- eyes, eyes,eyes);
 
 noStroke();
 fill(0);
 ellipse(positionx - eyes, positiony- eyes,eyes*0.2,eyes*0.2);
 ellipse(positionx + eyes, positiony- eyes, eyes*0.2,eyes*0.2);
 

//nose
stroke(255);
fill(0);
 ellipse(positionx,positiony,size*0.1,size*0.2);
 
}