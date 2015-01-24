boolean[] buttons;
boolean fired;

void setup()
{
    size(600, 480); 
    frameRate(60);
    buttons = new boolean[4];
    
    player1 = new Player();
    
    collision = new Collision();
    
    //pistol = new Pistol();
    
    playerLen = 20;
    playerHei = 20;
   
    playerX = width/2 - playerLen/2;
    playerY = height/2 - playerHei/2;
    
    playerSpd = 2;
    playerHp = 100;
    
    buttons[0] = false;
    buttons[1] = false;
    buttons[2] = false;
    buttons[3] = false;
    
    fired = false;
   
    Bullets = new ArrayList<Gun>();
    AI = new ArrayList<Enemies>();
    
    collided = false;
    
    secondsBetweenSpawn = 5;
    spawnRate = 60 * secondsBetweenSpawn;
}

void draw()
{
     background(127);
     
     fill(0);
     text(points, 50, 20);
     text(playerHp, 50, 40);
     
     fill(0);
     player1.drawPlayer();
     
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
     
     if(fired)
     {
        Bullets.add(new Pistol(playerX, playerY, playerLen, playerHei));
        fired = false;
     }
     
     for(int i = 0; i< Bullets.size(); i++)
     {
        Bullets.get(i).bulletProjection();
     }
     
     for(int i = 0; i < AI.size(); i++)
     {
        collision = new Collision(AI.get(i).enemyX, AI.get(i).enemyY, AI.get(i).enemyLen, AI.get(i).enemyHei);
        
        if(AI.get(i).enemyHp <= 0)
        {
            AI.get(i).enemyDead();
            AI.remove(i);
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
     
     if(frameCount % spawnRate == 0)
     {
         AI.add(new Zombie(playerX, playerY, playerLen, playerHei));
     }
     
     for(int i = 0; i < AI.size(); i++)
     {
        collision = new Collision(AI.get(i).enemyX, AI.get(i).enemyY, AI.get(i).enemyLen, AI.get(i).enemyHei);
        
        AI.get(i).enemyMovement(playerX, playerY, playerLen, playerHei);
        
        //Checks to see if player touches enemy
        collided = collision.collisionConnect(playerX, playerY, playerLen, playerHei);
        
        if(collided)
        {
            AI.get(i).playerTakesDamage();
        }
     }
}

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
}

void mousePressed()
{
     collision = new Collision(playerX, playerY, playerLen, playerHei);
     fired = collision.boxCheck();
}
