abstract public class Gun
{
    float bulletX;
    float bulletY;
    
    float bulletXSpd;
    float bulletYSpd;
    float bulletAngle;
    
    float bulletSpeed;
    boolean[] bulletDirection;
    
    float mouseXCo;
    float mouseYCo;
    
    float mouseXCCo;
    float mouseYCCo;
    
    float bulletLen;
    float bulletHei;
  
    public Gun(float x, float y, float len, float hei)
    {
       bulletLen = 5;
       bulletHei = 5;
      
       bulletX = x + len/2;
       bulletY = y + hei/2;
       
       bulletDirection = new boolean[4];
       
       bulletDirection[0] = false;
       bulletDirection[1] = false;
       bulletDirection[2] = false;
       bulletDirection[3] = false;
       
       bulletSpeed = 2;
       
       mouseXCo = bulletX - mouseX;
       mouseYCo = bulletY - mouseY;
       
       mouseXCCo = mouseX;
       mouseYCCo = mouseY;
       
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
       
       Speed();
    }
    
    public void fire(float i, float j)
    {
        Speed();
    }
    
    public void bulletProjection()
    {
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
       
       fill(0, 255, 0);
       rect(bulletX, bulletY, bulletLen, bulletHei);
    }
    
    public void Speed()
    {
       if((mouseXCCo < bulletX) && (mouseYCCo < bulletY))
       {
          bulletDirection[0] = true;
       }
       
       if((mouseXCCo < bulletX) && (mouseYCCo > bulletY))
       {
          bulletDirection[1] = true;  
       }
       
       if((mouseXCCo > bulletX) && (mouseYCCo < bulletY))
       {
          bulletDirection[2] = true;
       }
       
       if((mouseXCCo > bulletX) && (mouseYCCo > bulletY))
       {
          bulletDirection[3] = true;
       }
    }
    
    public void Power()
    {
    }
}
