public class Pistol extends Gun
{  
    public Pistol(float x, float y, float len, float hei)
    {
       super(x, y, len, hei);
       
       gunPower = 5 + (gunPowerUp*2);
       bulletSpeed = 12;
       
       maxBullets = 6;
    }
    
    public void bulletProjection()
    {
       bulletAngle = atan(mouseYCo/mouseXCo);
       bulletXSpd = bulletSpeed*cos(bulletAngle);
       bulletYSpd = bulletSpeed*sin(bulletAngle);
       
       if(bulletXSpd < 0)
       {
           bulletXSpd *= -1;
       }
       
       if(bulletYSpd < 0)
       {
           bulletYSpd *= -1;
       }
      
       if(bulletDirection[0])
       {
          bulletX -= bulletXSpd;
          bulletY -= bulletYSpd;
       }
       
       if(bulletDirection[1])
       {
          bulletX -= bulletXSpd;
          bulletY += bulletYSpd;
       }
       
       if(bulletDirection[2])
       {
          bulletX += bulletXSpd;
          bulletY -= bulletYSpd; 
       }
       
       if(bulletDirection[3])
       {
          bulletX += bulletXSpd;
          bulletY += bulletYSpd;
       }      
       
       fill(255);
       rect(bulletX, bulletY, bulletLen, bulletHei);
    }
}
