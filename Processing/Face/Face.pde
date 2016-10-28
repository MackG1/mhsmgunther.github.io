
void setup(){
 size(1000,800); 
 frameRate(60);
}

int colour = 0;
float size = 300;

void draw(){ 
float positionx = 500;
float positiony = 400;
float eyes = size*1/4;

background(0,0,255);

//Outline
stroke(0);
strokeWeight(size*0.01);
fill(255);
ellipse(positionx,positiony,size,size);  

//mouth
strokeWeight(2);
 fill(colour);
 stroke(0);
 ellipse(positionx,positiony + size*0.3,size/2,size*0.2);

 //eye
 stroke(255);
 fill(200);
 ellipse(positionx - eyes, positiony- eyes,eyes,eyes);
 ellipse(positionx + eyes, positiony- eyes, eyes,eyes);
 
 
 noStroke();
 fill(colour);
 float eyepositionx= constrain(mouseX,positionx - size*0.07, positionx + size*0.08);
 float eyepositiony= constrain(mouseY, positiony -size*0.07, positiony + size*0.08);
 ellipse(eyepositionx - eyes, eyepositiony- eyes,eyes*0.2,eyes*0.2);
 ellipse(eyepositionx + eyes, eyepositiony- eyes,eyes*0.2,eyes*0.2);
 
//nose
stroke(255);
fill(0);
 ellipse(positionx,positiony,size*0.1,size*0.2); 
 
 //hair
 strokeWeight(size/10);
 stroke(0);
noFill();
 arc(positionx,positiony-(size*0.02),size,size,-PI,0);
}

void keyPressed(){
  if (colour == 0){
    colour = #FF0808;
    size = 700;
  } else { 
    colour = 0;
    size = 300;
  }
}
