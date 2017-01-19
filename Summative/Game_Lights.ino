/**************LIGHTS THAT REPRESENT LIVES REMAINING*****************/
//VARIABLES 
char val;

//VARIABLES FOR FLASHING
unsigned long pastTime = 0;
const int interval = 150;


int speakerPin = 8;

//LED VARIABLES
int led1State = HIGH;
int led2State = HIGH;
int led3State = HIGH;

void setup() 
{
  //SET PIN MODES
  pinMode(2,OUTPUT);
  pinMode(3,OUTPUT);
  pinMode(4,OUTPUT);
  
  //START SERIAL CONNECTION TO GAME
  Serial.begin(9600);
}

void loop() 
{
  //SET CURRENT RUN TIME
   unsigned long currentTime =millis();
 
  //GET INFORMATION FROM SERIAL IF AVAILBLE
   if (Serial.available()) 
   { 
     val = Serial.read(); 
   }


  //SET LED STATES DEPENDING ON SERIAL INFORMATION (Val)
   if (val == 3)
   {
    led1State = HIGH;
    led2State = HIGH;
    led3State = HIGH;
   }

   else if(val == 2)
   {
   
    led1State = LOW;
    led2State = HIGH;
    led3State = HIGH;
   }
   else if (val == 1)
   {
    led1State = LOW;
    led2State = LOW;
    led3State = HIGH;
   
   }
   
    else if(val == 0)
   {
    // PLAY ANNOYING TONE WHEN LOSE
     tone(speakerPin,700,2);
    //MAKE THE LIGHTS BLINK, BASED ON RUN TIME
    if(currentTime - pastTime >= interval)
    {
      
      pastTime = currentTime;

      if (led3State == HIGH)
      {
        led1State = LOW;
        led2State = LOW;
        led3State = LOW;

      }
      else
      {
  
        led1State = HIGH;
        led2State = HIGH;
        led3State = HIGH;
        
      }
      
     }
    
    }

    //TURN THE LEDS ON OR OFF
    digitalWrite(2,led1State);
    digitalWrite(3,led2State);
    digitalWrite(4,led3State);
}


