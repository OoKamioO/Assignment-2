abstract public class Enemies
{
    float enemyX;
    float enemyY;
    
    float enemyLen;
    float enemyHei;
    
    float enemyXSpd;
    float enemyYSpd;
    float playerAngle;
    
    float enemySpeed;
    boolean[] enemyDirection;
    
    float playerXCo;
    float playerYCo;
  
    int spawnside;
    
    float enemyHp;
    int enemyPoints;
    int enemyPower;
    
    public Enemies()
    {
        enemyX = 0;
        enemyY = 0;
        enemyLen = 0;
        enemyHei = 0;
    }
  
    public Enemies(float x, float y, float pLen, float pHei)
    {
       //Determines enemy size
       enemyLen = 20;
       enemyHei = 20;
      
       //Choose a side for enemies to spawn from
       spawnside = (int)random(0, 3);
      
       //Spawns from the top side
       if(spawnside == 0)
       {
          enemyX = (float)random(0, width);
          enemyY = 0;
       }
       
       //Spawns from the bottom
       if(spawnside == 1)
       {
          enemyX = (float)random(0, width);
          enemyY = (height - height/5) - enemyHei;
       }
       
       //Spawns from the right side
       if(spawnside == 2)
       {
          enemyX = 0;
          enemyY = (float)random(0, ((height - height/5) - enemyHei));
       }
       
       //Spawns from the left side
       if(spawnside == 3)
       {
          enemyX = width - enemyLen;
          enemyY = (float)random(0, ((height - height/5) - enemyHei));
       }
       
       //Determines enemy's direction
       enemyDirection = new boolean[4];
    }
    
    public void enemyMovement(float x, float y, float pLen, float pHei)
    {
       //Magnitude of enemy speed
       enemySpeed = 2;
      
       //Get's player center position
       playerXCo = x + pLen/2;
       playerYCo = y + pHei/2;
       
       //Gets angle of player and breaks down their magnitude (i.e. enemy speed into it's vectors)
       playerAngle = atan(playerYCo/playerXCo);
       enemyXSpd = enemySpeed*cos(playerAngle);
       enemyYSpd = enemySpeed*sin(playerAngle);
       
       if(enemyXSpd < 0)
       {
           enemyXSpd *= -1;
       }
       
       if(enemyYSpd < 0)
       {
           enemyYSpd *= -1;
       }
      
       if((enemyX < playerX) && (enemyY < playerY))
       {
          enemyX += enemyXSpd;
          enemyY += enemyYSpd;
       }
       
       if((enemyX < playerX) && (enemyY > playerY))
       {
          enemyX += enemyXSpd;
          enemyY -= enemyYSpd;
       }
       
       if((enemyX > playerX) && (enemyY < playerY))
       {
          enemyX -= enemyXSpd;
          enemyY += enemyYSpd;
       }
       
       if((enemyX > playerX) && (enemyY > playerY))
       {
          enemyX -= enemyXSpd;
          enemyY -= enemyYSpd;
       }
       
       fill(0, 255, 0);
       rect(enemyX, enemyY, enemyLen, enemyHei);
    }
    
    public void enemyTakesDamage(float gunDamage, float hits)
    {
       enemyHp -= gunDamage*hits;
    }
    
    public void enemyDead()
    {
        points += enemyPoints;
    }
    
    public void playerTakesDamage()
    {
        //Decrements player's HP
        playerHp -= enemyPower;
        
        /*Moves enemies back if they collide with the player*/
        if((enemyX < playerX) && (enemyY < playerY))
        {
           enemyX -= 10;
           enemyY -= 10;
        }
       
        if((enemyX < playerX) && (enemyY > playerY))
        {
           enemyX -= 10;
           enemyY += 10;
        }
       
        if((enemyX > playerX) && (enemyY < playerY))
        {
           enemyX += 10;
           enemyY -= 10;
        }
       
        if((enemyX > playerX) && (enemyY > playerY))
        {
           enemyX += 10;
           enemyY += 10;
        }
    }
}
