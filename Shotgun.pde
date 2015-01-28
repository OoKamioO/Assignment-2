public class Shotgun extends Gun
{  
    float counter;
  
    public Shotgun(float x, float y, float len, float hei, float c)
    {
       super(x, y, len, hei);
       
       counter = c;
       
       gunPower = 12 + (gunPowerUp*3);
       bulletSpeed = 12;
    }
    
    public void bulletProjection()
    {
       if(counter == 1)
       {
          bulletAngle = atan(mouseYCo/mouseXCo);
       }
       
       if(counter == 2)
       {
          bulletAngle = atan(mouseYCo/mouseXCo);
          bulletAngle += TWO_PI/6;
       }
       
       if(counter == 3)
       {
          bulletAngle = atan(mouseYCo/mouseXCo);
          bulletAngle = bulletAngle - (TWO_PI/6);
       }
       
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
       
       fill(255, 0, 0);
       rect(bulletX, bulletY, bulletLen, bulletHei);
    }
}
