public class Zombie extends Enemies
{
      public Zombie(float x, float y, float pLen, float pHei)
      {
         super(x, y, pLen, pHei);
         
         enemyPoints = 10 + round;
         enemyHp = 10 + (round);
         enemyPower = 7 + (round * 2);
      }
  
      public void enemyMovement(float x, float y, float pLen, float pHei)
      {
         enemySpeed = 0.3 + (round * .2);
        
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
}
