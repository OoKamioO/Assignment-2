boolean[] buttons;
boolean fired;

void setup()
{
    size(800, 580); 
    
    //Sets the framerate of the game
    frameRate(60);
    
    //Initializes the button arrays
    buttons = new boolean[6];
    
    //Initializes the main player
    player1 = new Player();
    
    //Initializes the collision variable
    collision = new Collision();
    
    //Sets player dimensions
    playerLen = 20;
    playerHei = 20;
   
    //Sets up initial player coordinates
    playerX = width/2 - playerLen/2;
    playerY = height/2 - playerHei/2;
    
    //Sets up player stats
    playerSpd = 2;
    playerHp = 100;
    
    //Starts up the buttons as off
    buttons[0] = false;
    buttons[1] = false;
    buttons[2] = false;
    buttons[3] = false;
    
    //Menu button
    buttons[4] = false;
    
    //Start game button
    buttons[5] = false;
    
    //Starts off fired as off
    fired = false;
   
    //Creates arraylist for bullets, zombies and powerups
    Bullets = new ArrayList<Gun>();
    AI = new ArrayList<Enemies>();
    PowerUp = new ArrayList<Powerups>();
    
    //Turns off collision indicator
    collided = false;
    
    //Sets time between spawn
    secondsBetweenSpawn = 2;
    spawnRate = 60 * secondsBetweenSpawn;
    
    //Initial values for gun bullets and max ammo
    currentGunBullets = 6;
    currentGunAmmo = 100;
    
    //Determines if game over screen should appear
    gameOver = 0;
    
    //Variable that limits monsters on screen per round
    maxEnemies = 6;
    
    //Counts the amount of enemy on the screen
    enemyCounter = 0;
    
    //Sets buy to false
    confirmBuy = false;
    
    //Initial points
    points = 100000;
    
    //Sets max gun ammo
    maxGunAmmo = 100;
    
    //Sets max Hp
    playerMaxHp = 100;
    
    //Sets initial costs of powerups
    maxAmmoUpCost = 300;
    gunPowerUpCost = 400;
    playerSpeedUpCost = 350;
    playerMaxHpUpCost = 200;
}

void draw()
{
     if((buttons[5] == false) && (gameOver == 0)) //Start screen
     {
          startScreen();
     }
     else if(gameOver == 0) //Game begins
     {
       //Changes background color
       background(70, 97, 88);
       
       //Determines player color
       fill(0);
       
       //Draws the player
       player1.drawPlayer();
       
       if(fired == false)
       {
           for(int i = 0; i < PowerUp.size(); i++)
           { 
               PowerUp.get(i).drawPowerUp();
           }
           
           /*Player motion*/
           if(buttons[0])
           {
               player1.moveUp(playerSpd);
           }
           
           if(buttons[1])
           {
               player1.moveLeft(playerSpd);
           }
           
           if(buttons[2])
           {
               player1.moveDown(playerSpd);
           }
           
           if(buttons[3])
           {
               player1.moveRight(playerSpd);
           }
       }
       
       //Checks to see if a bullet should be fired i.e. if 'fired' variable is true
       if(fired)
       {  
          if(currentGunBullets > 0) //Makes sure you can't shoot more bullets than you have
          {     
             Bullets.add(new Pistol(playerX, playerY, playerLen, playerHei)); //Draws the bullet
             currentGunBullets -= 1; //Deducts bullet
          }
          
          fired = false; //Resets fired
       }
       
       //Draws bullet motion
       for(int i = 0; i< Bullets.size(); i++)
       {
          Bullets.get(i).bulletProjection();
       }
       
       for(int i = 0; i < AI.size(); i++)
       {
          //New collision that checks against the AI
          collision = new Collision(AI.get(i).enemyX, AI.get(i).enemyY, AI.get(i).enemyLen, AI.get(i).enemyHei);
          
          //If the AI's HP is less than or equal to zero, the AI is removed
          if(AI.get(i).enemyHp <= 0)
          {
              enemyKilled += 1;
              
              //Determines the drop to spawn
              powerUpSpawn = (int)random(0, 100);
              
              if(powerUpSpawn < 25)
              {
                  PowerUp.add (new Powerups(AI.get(i).enemyX, AI.get(i).enemyY, AI.get(i).enemyLen, AI.get(i).enemyHei, 0)); //Spawns points
              }
              else if(powerUpSpawn < 35)
              {
                  PowerUp.add (new Powerups(AI.get(i).enemyX, AI.get(i).enemyY, AI.get(i).enemyLen, AI.get(i).enemyHei, 1)); //Spawns Hp
              }
              else if(powerUpSpawn <= 50)
              {
                  PowerUp.add (new Powerups(AI.get(i).enemyX, AI.get(i).enemyY, AI.get(i).enemyLen, AI.get(i).enemyHei, 2)); //Spawns ammo
              }             
              
              AI.get(i).enemyDead();
              AI.remove(i);
              
              //Increases the round if all enemies are killed
              if(enemyKilled == maxEnemies)
              {
                 enemyKilled = 0; //Counts enemies killed
                 enemyCounter = 0; //Counts enemies spawned
                 maxEnemies += 2; //Increases maximum number of enemies on the screen
                 round += 1; //Increases the round
              }
          }
          
          for(int j = 0; j < Bullets.size(); j++)
          {
            //Checks to see if bullet hits enemy
            collided = collision.collisionConnect(Bullets.get(j).bulletX, Bullets.get(j).bulletY, Bullets.get(j).bulletLen, Bullets.get(j).bulletHei);
            
            if(collided)
            {
                AI.get(i).enemyTakesDamage(Bullets.get(j).gunPower);
                Bullets.remove(j);
            }
            
            //Checks to see if bullet goes offscreen
            if(collided == false)
            {
               collision = new Collision(Bullets.get(j).bulletX, Bullets.get(j).bulletY, Bullets.get(j).bulletLen, Bullets.get(j).bulletHei);
              
               collided = collision.bulletOutOfBounds();
              
               //Removes bullet if it leaves screen
               if(collided)
               {
                   Bullets.remove(j);
               }
            }
          }
       }
     
       //Spawns an enemy at the spawn rate and limits the spawn to maximum enemy variable
       if((frameCount % spawnRate == 0) && (enemyCounter < maxEnemies))
       {
           enemySpawnType = (int)random(0, 100);
           
           if(enemySpawnType > 70)
           {
              AI.add(new Zombie(playerX, playerY, playerLen, playerHei));
           }
           else
           {
              AI.add(new FastZombie(playerX, playerY, playerLen, playerHei));
           }
           
           enemyCounter += 1;
       }
       
       for(int i = 0; i < AI.size(); i++)
       {
          collision = new Collision(AI.get(i).enemyX, AI.get(i).enemyY, AI.get(i).enemyLen, AI.get(i).enemyHei);
        
          //Increaments enemy position towards the player  
          AI.get(i).enemyMovement(playerX, playerY, playerLen, playerHei);
          
          //Checks to see if player touches enemy
          collided = collision.collisionConnect(playerX, playerY, playerLen, playerHei);
          
          //Takes enemy HP away if they collided
          if(collided)
          {
              AI.get(i).playerTakesDamage();
          }
       }
       
       //Reloads bullets
       if(currentlyReloading)
       {
           //If the framecount is greater than the time specified when the reload button was pressed and the player has enough bullets, they will reload
           if((frameCount >= nextReload) && (currentGunBullets < maxBullets))
           {
                reloadedBullets = currentGunAmmo - (maxBullets - currentGunBullets);
                
                if(reloadedBullets < 0)
                {
                    currentGunAmmo = 0;
                    currentGunBullets -= reloadedBullets;
                }
                else
                {
                    currentGunAmmo = reloadedBullets;
                    currentGunBullets = maxBullets - currentGunBullets;
                }
                
                currentlyReloading = false;
           }
       }
       
       //Player touches the spawned loot
       for(int i = 0; i < PowerUp.size(); i++)
       {
           collision = new Collision(playerX, playerY, playerLen, playerHei);
           
           //Checks to see if power up touches player
           collided = collision.collisionConnect(PowerUp.get(i).powerX , PowerUp.get(i).powerY, PowerUp.get(i).powerUpLen, PowerUp.get(i).powerUpHei);
           
           
           if(collided)
           {
               switch(PowerUp.get(i).powerUpValue)
               {
                   case 0:
                   {
                      PowerUp.get(i).pointsUp();
                      break;
                   }
                   
                   case 1:
                   {
                      PowerUp.get(i).healthUp();
                      break;
                   }
                   
                   case 2:
                   {
                      PowerUp.get(i).ammoUp();
                      break;
                   }
               }
               
               PowerUp.remove(i);
           }
       }
       
       //Opens up menu screen
       if(buttons[4])
       {
           upgradeMenu();
           
           selectPurchase(60, 30, 0);
           selectPurchase(230, 30, 1);
           selectPurchase(width/2 + 135, 30, 2);
           selectPurchase(width/2 + 295, 30, 3);
       }
       
       //Draws foregronud
       foreground();
       
       //Determines if the player has died
       if(playerHp <= 0)
       {
           gameOver = 1;
           buttons[5] = false;
       }
     }//End main game
     
     
     //Determines if game over has been reached
     if(gameOver == 1)
     {
         //Draws the end screen
         endScreen();
         
         //Restarts the game when button[5] (i.e. f) is pressed
         if(buttons[5] == true)
         {
             setup();
         }
     }
}

//Mapping buttons
void keyPressed()
{
     if(key == 'w' || key == 'W')
     {
        buttons[0] = true;
     }
     
     if(key == 'a' || key == 'A')
     {
         buttons[1] = true;
     }
     
     if(key == 's' || key == 'S')
     {
         buttons[2] = true;
     }
     
     if(key == 'd' || key == 'D')
     {
         buttons[3] = true;
     }
     
     if(key == 'm' || key == 'M')
     {
         if(buttons[4])
         {
             buttons[4] = false;
         }
         else
         {
             buttons[4] = true;
         }
     }
     
     if(key == 'f' || key == 'F')
     {
         buttons[5] = true;
     }
}

void keyReleased()
{
     if(key == 'w' ||key == 'W')
     {
         buttons[0] = false;
     }
     
     if(key == 'a' || key == 'A')
     {
         buttons[1] = false;
     }
     
     if(key == 's' || key == 'S')
     {
         buttons[2] = false;
     }
     
     if(key == 'd' || key == 'D')
     {     
         buttons[3] = false;
     }
     
     /*if(key == 'm' || key == 'M')
     {
         buttons[4] = false;
     }*/
}

void mousePressed()
{
     if(mouseButton == LEFT)
     {
        if(buttons[4] == false)
        {
           collision = new Collision(playerX, playerY, playerLen, playerHei);
           fired = collision.boxCheck();
        }
        else
        {
            confirmBuy = true;
        }
     }
     
     if(mouseButton == RIGHT)
     {
        if((currentGunBullets < maxBullets) && (currentGunAmmo > 0))
        {
            nextReload = frameCount + reloadTime; //Determines time when bullets are reloaded
            currentlyReloading = true;
        }
     }
}
