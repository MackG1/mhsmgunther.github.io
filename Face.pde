
//1




void setup(){
 size(600,600); 
 frameRate(0.5);
}

void draw(){ 
  float positionx = random(600);
float positiony = random(600);
float size = random(500);
float eyes = size*1/10;

  background(random(255),random(255),random(255));
  
   

//Outline
stroke(0);
strokeWeight(size*0.1);
  fill(random(255));
 ellipse(positionx,positiony,0.7*size,size);  
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

//nose
stroke(255);
fill(0);
 ellipse(positionx,positiony,size*0.1,size*0.2);
 
 

 
}