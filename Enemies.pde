public class Enemies
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
    
    float mouseXCCo;
    float mouseYCCo;
  
    int spawnside;
  
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
          enemyY = height - enemyHei;
       }
       
       if(spawnside == 2)
       {
          enemyX = 0;
          enemyY = (float)random(0, (height - enemyHei));
       }
       
       if(spawnside == 3)
       {
          enemyX = width - enemyLen;
          enemyY = (float)random(0, (height - enemyHei));
       }
       
       enemyDirection = new boolean[4];
       
       enemySpeed = 1;
       
       mouseXCCo = mouseX;
       mouseYCCo = mouseY;
    }
    
    public void enemyMovement(float x, float y, float pLen, float pHei)
    {
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
    
    public void Power()
    {
    }
}
