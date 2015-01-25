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
       enemyLen = 20;
       enemyHei = 20;
      
       spawnside = (int)random(0, 3);
      
       if(spawnside == 0)
       {
          enemyX = (float)random(0, width);
          enemyY = 0;
       }
       
       if(spawnside == 1)
       {
          enemyX = (float)random(0, width);
          enemyY = (height - height/5) - enemyHei;
       }
       
       if(spawnside == 2)
       {
          enemyX = 0;
          enemyY = (float)random(0, ((height - height/5) - enemyHei));
       }
       
       if(spawnside == 3)
       {
          enemyX = width - enemyLen;
          enemyY = (float)random(0, ((height - height/5) - enemyHei));
       }
       
       enemyDirection = new boolean[4];
    }
    
    public void enemyMovement(float x, float y, float pLen, float pHei)
    {
       enemySpeed = 2;
      
       playerXCo = x + pLen/2;
       playerYCo = y + pHei/2;
       
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
    
    public void enemyTakesDamage(float gunDamage)
    {
       enemyHp -= gunDamage;
    }
    
    public void enemyDead()
    {
        points += enemyPoints;
    }
    
    public void playerTakesDamage()
    {
        playerHp -= enemyPower;
        
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
