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
    
    float gunPower;
  
    public Gun(float x, float y, float len, float hei)
    {
       //Determines projectile size
       bulletLen = 5;
       bulletHei = 5;
      
       //Gets bullet spawn position
       bulletX = x + len/2;
       bulletY = y + hei/2;
       
       bulletDirection = new boolean[4];
       
       //Sets motion to zero
       bulletDirection[0] = false;
       bulletDirection[1] = false;
       bulletDirection[2] = false;
       bulletDirection[3] = false;
       
       //Gets the x and y values from the spawn spot
       mouseXCo = bulletX - mouseX;
       mouseYCo = bulletY - mouseY;
       
       //Gets the current X and Y of the mouse
       mouseXCCo = mouseX;
       mouseYCCo = mouseY;
       
       //Determise the bullet angle from the player and the breaks down the bullet magnitude to it's vector components
       bulletAngle = atan(mouseYCo/mouseXCo);
       bulletXSpd = bulletSpeed*cos(bulletAngle);
       bulletYSpd = bulletSpeed*sin(bulletAngle);
       
       //Determines the direction the bullet will move
       Speed();
    }
    
    public void bulletProjection()
    {
       bulletSpeed = 2;
       
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
       
       fill(0, 255, 0);
       rect(bulletX, bulletY, bulletLen, bulletHei);
    }
    
    //Determines the direction the bullet moves
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
}
