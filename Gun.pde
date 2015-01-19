public class Gun
{
    float bulletX;
    float bulletY;
    float bulletSpeed;
  
    public Gun(float x, float y, float len, float hei)
    {
       bulletX = x + len/2;
       bulletY = y + hei/2;
       
       Speed(bulletX, bulletY);
       
       fill(0, 255, 0);
       rect(bulletX, bulletY, 5, 5);
    }
    
    public void fire(float i, float j)
    {
        Speed(i, j);
    }
    
    public void Speed(float x, float y)
    {
       bulletSpeed = 2;
      
       if((pmouseX < x) && (pmouseY < y))
       {
          bulletX -= bulletSpeed;
          bulletY -= bulletSpeed;
       }
       
       if((pmouseX < x) && (pmouseY > y))
       {
          bulletX -= bulletSpeed;
          bulletY += bulletSpeed;  
       }
       
       if((pmouseX > x) && (pmouseY < y))
       {
          bulletX += bulletSpeed;
          bulletY -= bulletSpeed; 
       }
       
       if((pmouseX > x) && (pmouseY > y))
       {
          bulletX += bulletSpeed;
          bulletY += bulletSpeed;
       }
    }
    
    public void Power()
    {
    }
}
