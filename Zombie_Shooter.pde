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
    
    playerSpd = 3;
    
    buttons[0] = false;
    buttons[1] = false;
    buttons[2] = false;
    buttons[3] = false;
    
    fired = false;
   
    Bullets = new ArrayList<Gun>();
    AI = new ArrayList<Enemies>();
    
    collided = false;
}

void draw()
{
     background(127);
     
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
        AI.add(new Zombie(playerX, playerY, playerLen, playerHei));
        fired = false;
     }
     
     for(int i = 0; i < Bullets.size(); i++)
     {
        Bullets.get(i).bulletProjection();
        
        collision = new Collision(AI.get(i).enemyX, AI.get(i).enemyY, AI.get(i).enemyLen, AI.get(i).enemyHei);
        
        collided = collision.collisionConnect(Bullets.get(i).bulletX, Bullets.get(i).bulletY, Bullets.get(i).bulletLen, Bullets.get(i).bulletHei);
        
        collision = new Collision(Bullets.get(i).bulletX, Bullets.get(i).bulletY, Bullets.get(i).bulletLen, Bullets.get(i).bulletHei);
        
        collided = collision.bulletOutOfBounds();
        
        if(collided)
        {
            Bullets.remove(i);
        }
     }
     
     for(int i = 0; i < AI.size(); i++)
     {
        collision = new Collision(AI.get(i).enemyX, AI.get(i).enemyY, AI.get(i).enemyLen, AI.get(i).enemyHei);
        
        AI.get(i).enemyMovement(playerX, playerY, playerLen, playerHei);
        
        //Checks to see if player touches enemy
        collided = collision.collisionConnect(playerX, playerY, playerLen, playerHei);
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
     fired = true;
}
