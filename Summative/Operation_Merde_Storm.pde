/***********GAME VARIABLES************/


//BOOLEANS FOR CURRENT SCREEN
boolean lose = false;
boolean start = true;
boolean levelUp = false;
boolean instructions = false;

//SPECIAL POWER BOOLEAN
boolean powerUp = true;



//MATERIL VARIABLES
PImage material;
int numMaterials = 0;
int materialSize = 40;
  //MATERIAL ARRAYLIST
  ArrayList<Material> materialArray;



//GOLDEN MATERIAL
PImage goldenMaterial;
int numGoldenMaterials = 0;
  // Golden material array
  goldenMaterials[] goldenMaterialArray;



//SHOOTER VARIABLES
int shooterX = 400;
int shooterY = 640;
int shooterXSpeed = 0;
color shooterColor = color(150);
PImage turret;
    //BULLETS
    ArrayList<Bullet> bulletsArray;
    int numBullets = 0;
    color bulletColor = color(252);
    PImage bullet;

    

//ENEMIES
PImage enemy;
int enemySize = 50;
int numOfEnemies = 1;
int enemiesRemaining = 1;
int enemiesKilled = 0;
Enemy[] enemyArray;


//BACKGROUND
color Background = color(int(random(255)),int(random(255)),int(random(255)));

//SCORING AND LEVELS
//SET TO STARTING NUMBERS
int score = 0;
int lives = 3;
int level = 1;




int frameNum = 0;

void setup()
{
  size(1200,750);
  
  //LOAD IMAGES
      material = loadImage("material.png");
      enemy = loadImage("enemytest.png");
      goldenMaterial = loadImage("goldenMaterial.png");
      bullet = loadImage("bullet.png");
      turret = loadImage("turret.png");
  
  
  //CREATE ENEMIES
      bulletsArray = new ArrayList <Bullet>();
      enemyArray = new Enemy[1000];
      materialArray = new ArrayList <Material>();
      goldenMaterialArray = new goldenMaterials[1000];

}

void draw()
{
  //add to the frame number
  frameNum++;
    //START SCREEN CHECK
  
      if (start  == true)
      {
        background(Background);
        if(frameNum% 20 == 0)
        {
        Background=color(int(random(255)),int(random(255)),int(random(255)));
        }
        
        
        //START SCREEN VARIABLE
            int [] materialStart = new int[20];
   
        //CREATING THE MATERIAL FOR START SCREEN
            for (int i = 0; i<20; i++)
              {
                materialStart[i] = 60*i;
              }
            
          //DRAW TITLE
              fill(0);
              textSize(50);
              text("Operation Merde Storm",300,200);
          
          
          //DRAWING THE START SCREEN MATERIALS
          
              for(int  i = 0; i<20;i++)
              {
                    //MATERIALS MOVEMENT UP AND DOWN
                    float xs = random(20);
                    float x = 300;
                    x+=xs;
                    
                    image(material,materialStart[i],x,50,50);
                    image(material,materialStart[i],x+50,50,50);
                    image(material,materialStart[i],x+100,50,50);
                    image(material,materialStart[i],x+150,50,50);
                    image(material,materialStart[i],x+200,50,50);
                    image(material,materialStart[i],x+250,50,50);
                
            
            //DRAW START BUTTON
            //ACTION IN mousePressed
            
                textSize(60);
                fill(0);
                text("Start",500,700);
                fill(0,0);
                rect(500,650,135,55);
                
                //DRAW INSTRUCTIONS BUTTON
                textSize(38);
                fill(0,0);
                rect(970,650,220,55);
                fill(0);
                text("How to play",970,695);
      }  
      }

  //LOSE SCREEN CHECK
  
      else if (lose == true)
      
      {
       //DISPLAY TEXT
       
       background( #FF0307);
       fill(0);
       text("You Lost", 450,400);
       
       
       //DRAW RESET BUTTON
       //ACTION IN mousePressed
       
            textSize(60);
            text("Reset",500,700);
            fill(0,0);
            rect(500,650,160,55);
      }
  
  
  
  
  //LEVEL UP SCREEN CHECK
  
      else if(levelUp== true)
      {
        //DISPLAY TEXT
        background(#1614F2);
        fill(0);
        text("You beat this level", 330,400);
       
       
       //DRAW Reset Button
       //Action in mousePressed
       
            textSize(60);
            text("Next level",480,700);
            fill(0,0);
            rect(480,650,290,55);
      }
      
      
      
      
  //INSTRUCTIONS SCREEEN CHECK
    
    else if(instructions==true)
    {
     background(#952AC4);
     
     //BACK BUTTON
      textSize(60);
      fill(0);
      text("Back",500,700);
      fill(0,0);
      rect(500,650,135,55);
      
      //THE INSTRUCTIONS TEXT
      textSize(60);
      fill(0);
      text("How to play",440,70);
      
      textSize(35);
      text("Rules/Getting points",100,150);
      textSize(30);
      text("-Your goal is to kill all of the devils",100,200);
      text("-A devil gets added each level",100,240);
      text("-If you get hit with material you lose 1 life (you have 3)",100,280);
      text("-If you catch a golden material you get a powerUp (You can only have 1)",100,320);
      text("-If golden material is displayed on bottom you have a powerup",100,360);
      
      textSize(35);
      text("Movement",100,420);
      textSize(30);
      text("-Use left and right arrow keys to move",100,460);
      text("-You won't stop moving until you hit spacebar",100,500);
      text("-Use up arrow key or spacebar to shoot",100,540);
      text("-Use the 'a' key to use special power",100,580);
      
    }
  
      
  
  
  
  
  //RUN GAME
  
      else 
      {
        background(Background);
        
        
        //DRAW SHOOTER
        //MOVEMENT IN keyPressed()
        
            fill(shooterColor);
            rectMode(CENTER);
            rect(shooterX,shooterY,100,20);
            rect(shooterX,shooterY-25,20,50);
          
        //DRAW MATERIALS  
             for (int i = 0; i<materialArray.size(); i++)
            {
              Material material = materialArray.get(i);
              material.deploy();
            }
          
          
        //DRAW GOLDEN MATERIALS
        
            for(int i = 0; i<numGoldenMaterials; i++)
            {
             goldenMaterialArray[i].update(); 
            }
        
        
        
        //DRAW SCORING AND INFORMATION AREA
        
            rectMode(CORNER);
            fill(255);
            rect(0,650,1200,100);
        
     
        //DRAW ENEMIES
        
            for (int i = 0; i<numOfEnemies; i++)
            {
              if(enemyArray[i].Active == true)
              {
              enemyArray[i].update();
              }
              else
              {
              }
            }
        
        
        //DRAW BULLETS
        
           for (int i = 0; i<bulletsArray.size(); i++)
          {
            Bullet bullet = bulletsArray.get(i);
            bullet.shoot();
            bullet.check();
          }
          
          
        rectMode(CORNER);
        
        
       //DISPLAY SCORE
       
           fill(0);
           textSize(50);
           text(score,40,720);
       
       
       //DISPLAY LIVES
       
           fill(255,0,0);
           if(lives == 3){
           ellipse(1100,700,15,15);
           ellipse(1050,700,15,15);
           ellipse(1000,700,15,15);
           }
           
           if(lives == 2){
           ellipse(1100,700,15,15);
           ellipse(1050,700,15,15);
           }
           
           if(lives == 1){
           ellipse(1100,700,15,15);
           }
           
           if (lives==0)
           {
            lose = true;
            start = false;
           }
           
           if(enemiesRemaining == 0)
           {
             levelUp = true;
             materialArray.clear();
             level+=1;
             numOfEnemies += 1;
           }
           
       //POWER UP INDICATOR
           if(powerUp == true)
           {
            image(goldenMaterial,400,600,170,170); 
           }
           else
           {
             
           }
         
         
       //DISPLAY CURRENT LEVEL
       
           fill(0);
           textSize(50);
           text(level,600,720);
           
       //AFTER 5 KILLS DEPLOY GOLDEN MATERIAL 
           if(enemiesKilled == 5)
           {
             enemiesKilled =0;
             goldenMaterialArray[numGoldenMaterials] = new goldenMaterials(int (random(10,1100)),int(0));
             numGoldenMaterials += 1;
           }
           
            
        //UPDATE SHOOTERS LOCATION
           shooterX += shooterXSpeed;
        //KEEP SHOOTER ON SCREEN 
            if (shooterX> width - 50||shooterX<50)
           {
             shooterXSpeed = 0;
           }
      }
          

}



/****CLASS FOR BULLETS****/

class Bullet
{
 
//CLASS VARIABLES
 public boolean bulletActive;
 float bulletX,bulletY,bulletSpeed;
 
 //GIVE THE VARIABLES A VALUE
 Bullet(int x,int y,int speed)
 {
   bulletX = x-10;
   bulletY = y;
   bulletSpeed = speed;
 }
 
 void check()
 {
   //CHECK IF BULLETS HIT ENEMIE
   //CHECK IF BULLET LOCATION CROSSES THE ENEMIES LOCATION
  for(int t =0; t<materialArray.size(); t++)
  {
    for (int i = 0; i<numOfEnemies; i++)
    {
      if(enemyArray[i].enemyX <= bulletX+10  &&  enemyArray[i].enemyX + 40 >= bulletX-10  &&  enemyArray[i].enemyY<= bulletY 
      && enemyArray[i].enemyY+40>= bulletY-10 && enemyArray[i].Active == true)
      {
        enemyArray[i].Active =false;
        score+=10;
        enemiesRemaining -=1;
        enemiesKilled+=1;
      }
     }
    }
   }
  void shoot()
  {
    
    //BULLET MOVEMENT
    bulletY -= bulletSpeed;
    //DRAW THE BULLET
    image(bullet,bulletX,bulletY,20,20);
    
  }
}
    
/****CLASS FOR ENEMIES****/

class Enemy
{ 
  //CLASS/ENEMY  VARIABLES
  public boolean Active;
  public float enemyX,enemyY,enemyYSpeed,enemyXSpeed;
  
  //GIVE THE VARIABLES A VALUE
  Enemy(int x,int y, int xs, int ys)
  {
   enemyX = x;
   enemyY = y;
   enemyXSpeed = xs;
   enemyYSpeed = ys;
  }
  
  void update()
  {
    //ENEMY MOVEMENT
    enemyX += enemyXSpeed;
    enemyY += enemyYSpeed;
    
    //LEFT/RIGHT WALL HIT CHECK CHECK
    //DRAW MATERIAL IF WALL IS HIT
    //CHANGE DIRECTION IF WALL HIT
    if (enemyX > width - enemySize)
        {
         enemyXSpeed = int(random(-10,-1)); 
         materialArray.add(new Material (enemyX,enemyY,material));
         numMaterials++;
        }
        
        else if (enemyX < 0)
        {
         enemyXSpeed = int(random(10)); 
         materialArray.add(new Material (enemyX,enemyY,material));
         numMaterials++;
        }
        
      //UP/DOWN WALL CHECK
      //DRAW MATERIAL IF WALL IS HIT
      //CHANGE DIRECTION IF WALL HIT
       if (enemyY > 300)
        {
         enemyYSpeed = int(random(-10,-1)); 
         materialArray.add(new Material (enemyX,enemyY,material));
         numMaterials++;
        }
        
        else if (enemyY < -10)
        {
         enemyYSpeed = int(random(10)); 
         materialArray.add(new Material (enemyX,enemyY,material));
         numMaterials++;
        }
        //DRAW THE ENEMY
        image(enemy,enemyX,enemyY,enemySize,enemySize);
    }
    
  }
  
  /****CLASS FOR REGULAR MATERIALS****/

class Material
{
  //CLASS/MATERIAL VARIABLES
 float xpos,ypos;
 public PImage image;
 
 //GIVE VARIABLES A VALUE
 Material(float x, float y,PImage img)
 {
   xpos = x;
   ypos = y;
   image = img;
   
 }
 
  void deploy()
  {
    //MATERIAL MOVEMENT
    ypos += 10;
    
    //CHECK IF MATERIALS HAVE HIT THE SHOOTER
    if(get(int(xpos-1),int(ypos+materialSize+1)) == color(shooterColor)||get(int(xpos+materialSize+1),int(ypos+materialSize+1)) == color(shooterColor)){
      lives -=1;
      materialArray.clear();
      rectMode(CORNER);
      fill(255,0,0);
      rect(0,0,1200,650);
    }
    
    //DISPLAY MATERIAL IMAGE
    image(image,xpos,ypos,materialSize,materialSize);
    
  }
}



/****CLASS FOR GOLDEN MATERIALS****/

class goldenMaterials {
 //CLASS VARIABLES
  float xpos, ypos;
  
 //GIVE VARIABLES A VALUE 
  goldenMaterials(float x, float y)
  {
    xpos = x;
    ypos = y;
  }
  
  void update()
  {
    //CHECK IF SPECIAL MATERIAL HIT HERO
   if(get(int(xpos-1),int(ypos+71)) == color(shooterColor)||get(int(xpos+71),int(ypos+71)) == color(shooterColor))
   {
    rectMode(CORNER);
    powerUp = true; 
    fill(#FFF41F);
    rect(0,0,1200,800);
   }
   //MATERIAL MOVEMENT
   ypos+=5;
   
   //DISPLAY THE MATERIAL
   image(goldenMaterial,xpos,ypos,70,70); 
  }
}


void keyPressed()
{     
     //SHOOTER MOVEMENT/LEFT/RIGHT/STOP
     if (keyCode == LEFT && shooterX > 50)
     {
       shooterXSpeed = -10;
     }
     
     else if (keyCode == RIGHT && shooterX< width - 50)
     {
       shooterXSpeed = 10;
     } 
     else if (key ==' ')
     {
       shooterXSpeed = 0;
       bulletsArray.add(new Bullet (shooterX,shooterY-50,20));
       numBullets += 1;
     }
     
   
     
     
     //SHOOTER SHOOT KEY
     if (keyCode == UP || keyCode == TAB)
     {
       bulletsArray.add(new Bullet (shooterX,shooterY-50,13));
       numBullets += 1;
     }
     
     
     //SHOOTER POWER UP KEY
     if (key =='a' && powerUp == true)
     {
       for(int i =1; i<12;i++)
       {
       bulletsArray.add(new Bullet (110*i,700,10));
       }
       powerUp = false;
     }
}



void mousePressed()

{
  //START BUTTON
 
  if (mouseY >650 && mouseY <705 && mouseX > 500 && mouseX <635&& start == true)
  {
    start =  false;
    lose =  false;
    score = 0;
    
    //CREATE FIRST ENEMY AND SET TO ACTIVE
    enemyArray[0] = new Enemy(int (random(1,1200)),int(random(1,300)),10,10);
    enemyArray[0].Active = true;
  }
  
  // INSTRUCTIONS BUTTON
  if (mouseY >650 && mouseY <705 && mouseX > 970 && mouseX <1190 && start == true)
  {
   start =  false;
   instructions = true;
  }
  
     //START BUTTON
 
  if (mouseY >650 && mouseY <705 && mouseX > 500 && mouseX <635&& instructions == true)
  {    
    start =  true;
    instructions = false;

  }
  
  
  
  //RESET BUTTON
    if (mouseY >650 && mouseY <705 && mouseX > 500 && mouseX <660&& lose == true)
  {
    start =  true;
    lose =  false;
    powerUp = true;
    level = 1;
    score=0;
    lives = 3;
    numOfEnemies = 1;
    enemiesRemaining = 1;
    numBullets = 0;
    enemiesKilled = 0;
    shooterXSpeed = 0;
    
    //DELETE ALL MATERIALS AND BULLETS
    materialArray.clear();
    bulletsArray.clear();   
  }
  
  
  //NEXT LEVEL BUTTON
    if (mouseY >650 && mouseY <705 && mouseX > 480 && mouseX <770 && levelUp == true)
  {
    start =  false;
    lose =  false;
    levelUp = false;
    numBullets = 0;
    enemiesRemaining = numOfEnemies;
    
    //DELETE ALL BULLETS AND MATERIALS
    materialArray.clear();
    bulletsArray.clear();
    
    //ADD A NEW ENEMY TO ARRAY
    enemyArray[numOfEnemies-1] = new Enemy(int (random(1,1200)),int(random(1,300)),10,10);
    
    //SET ALL ENEMIES THAT SHOULD BE ACTIVE TO ACTIVE
    for(int i = 0;i <numOfEnemies; i++)
    {
     enemyArray[i].Active = true; 
    }
  }
}