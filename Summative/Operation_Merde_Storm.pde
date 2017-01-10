/***********GAME VARIABLES************/


//WIN/LOSE/START
boolean lose = false;
boolean start = true;
boolean levelUp = false;
boolean powerUp = true;


//MATERIL VARIABLES
PImage material;
int numMaterials = 0;
ArrayList<Material> materialArray;
int materialSize = 40;


//GOLDEN MATERIAL
PImage goldenMaterial;
goldenMaterials[] goldenMaterialArray;
int numGoldenMaterials = 0;


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
int enemySize = 50;
PImage enemy;
int numOfEnemies = 1;
int enemiesRemaining = 1;
Enemy[] enemyArray;
int enemiesKilled = 0;

//BACKGROUND
color Background = color(10);

//SCORING AND LEVELS
int score = 0;
int lives = 3;
int level = 1;






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
    //START SCREEN CHECK
  
      if (start  == true)
      {
        background(255);
                 
        //START SCREEN VARIABLES
        
            int [] materialStart = new int[20];
        
       
        
        //CREATING THE START SCREEN MATERIALS
            for (int i = 0; i<20; i++)
              {
                materialStart[i] = 60*i;
              }
            
          //DRAW TITLE
              fill(0);
              textSize(50);
              text("Operation Merde Storm",300,200);
          
          
          //DRAWING MATERIALS
          
              for(int  i = 0; i<20;i++)
              {
                //MATERIALS BOUNCE
                
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
                text("Start",500,700);
                text("How to play",970,700);
                fill(0,0);
                rect(500,650,135,55);
                
                
                rect(970,650,220,55);
      }  
      }

  //LOSE SCREEN CHECK
  
      else if (lose == true)
      
      {
       //DISPLAY TEXT
       
       background( #FF0307);
       fill(0);
       text("You Lost", 450,400);
       
       
       //RESET BUTTON
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
        background(#3CEDE9);
        fill(0);
        text("You beat this level", 330,400);
       
       
       //Reset Button
       //Action in mousePressed
       
            textSize(60);
            text("Next level",480,700);
            fill(0,0);
            rect(480,650,290,55);
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
        
        
        
        //SCORING AREA
        
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
         
         
       //DISPLAY LEVEL
       
           fill(0);
           textSize(50);
           text(level,600,720);
           
           if(enemiesKilled == 5)
           {
             enemiesKilled =0;
             goldenMaterialArray[numGoldenMaterials] = new goldenMaterials(int (random(10,1100)),int(0));
             numGoldenMaterials += 1;
           }
           
            
               //materialArray.clear();
               shooterX += shooterXSpeed;
                if (shooterX> width - 50||shooterX<50)
               {
                 shooterXSpeed = 0;
               }
      }
          

}



/****CLASS FOR BULLETS****/

class Bullet
{
  
 public boolean bulletActive;
 float bulletX,bulletY,bulletSpeed;
 
 Bullet(int x,int y,int speed)
 {
   bulletX = x;
   bulletY = y;
   bulletSpeed = speed;
 }
 
 void check()
 {
   //CHECK IF BULLETS HIT ENEMIE
   
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
    //SHOOT THE BULLET
    
    bulletY -= bulletSpeed;
    fill(bulletColor);
    image(bullet,bulletX,bulletY,20,20);
    
  }
}
    
/****CLASS FOR ENEMIES****/

class Enemy
{
  public boolean Active;
  public float enemyX,enemyY,enemyYSpeed,enemyXSpeed;
  Enemy(int x,int y, int xs, int ys)
  {
   enemyX = x;
   enemyY = y;
   enemyXSpeed = xs;
   enemyYSpeed = ys;
  }
  void update()
  {
    //MOVEMENT
    enemyX += enemyXSpeed;
    enemyY += enemyYSpeed;
    
    //LEFT/RIGHT CHECK
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
        
      //UP/DOWN CHECK
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
        //ENEMIES IMAGE
        image(enemy,enemyX,enemyY,enemySize,enemySize);
    }
    
  }
  
  /****CLASS FOR REGULAR MATERIALS****/

class Material
{
 float xpos,ypos;
 public PImage image;
 Material(float x, float y,PImage img)
 {
   xpos = x;
   ypos = y;
   image = img;
   
 }
 
  void deploy()
  {
    //MOVEMENT
    ypos += 10;
    
    //CHECK IF MATERIALS HAVE HIT HERO
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
 
  float xpos, ypos;
  
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
   ypos+=5;
   image(goldenMaterial,xpos,ypos,70,70); 
  }
}


void keyPressed()
{     
     //HERO MOVEMENT
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
     }
     
   
     
     
     //HERO SHOOT
     if (keyCode == UP || keyCode == TAB)
     {
       bulletsArray.add(new Bullet (shooterX,shooterY-50,13));
       numBullets += 1;
     }
     
     
     //HERO USE POWER UP
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
     enemyArray[0] = new Enemy(int (random(1,1200)),int(random(1,300)),10,10);
     enemyArray[0].Active = true;
  }
  
  
  
  //RESET BUTTON
    if (mouseY >650 && mouseY <705 && mouseX > 500 && mouseX <660&& lose == true)
  {
    start =  true;
    lose =  false;
    level = 1;
    score=0;
    lives = 3;
    numOfEnemies = 1;
    enemiesRemaining = 1;
    materialArray.clear();
    bulletsArray.clear();
    numBullets = 0;
    powerUp = true;
    enemiesKilled = 0;
    
    
  }
  
  //NEXT LEVEL BUTTON
    if (mouseY >650 && mouseY <705 && mouseX > 480 && mouseX <770 && levelUp == true)
  {
    start =  false;
    lose =  false;
    materialArray.clear();
    bulletsArray.clear();
    levelUp = false;
    enemiesRemaining = numOfEnemies;
    enemyArray[numOfEnemies-1] = new Enemy(int (random(1,1200)),int(random(1,300)),10,10);
    numBullets = 0;
    for(int i = 0;i <numOfEnemies; i++)
    {
     enemyArray[i].Active = true; 
    }
    
  }
}