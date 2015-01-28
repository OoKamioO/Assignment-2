public class FastZombie extends Enemies
{
      public FastZombie(float x, float y, float pLen, float pHei)
      {
         super(x, y, pLen, pHei);
         
         enemyPoints = 10 + round;
         enemyHp = 5 + (round);
         enemyPower = 2 + (round * 1);
         
         enemyLen = 16;
         enemyHei = 16;
      }
  
      public void enemyMovement(float x, float y, float pLen, float pHei)
      {
         enemySpeed = 0.5 + (round * .4);
        
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
         
         fill(100, 0, 0);
         rect(enemyX, enemyY, enemyLen, enemyHei);
      }
      
     public void enemyTakesDamage(float gunDamage)
     {
        enemyHp -= gunDamage;
     }
}
