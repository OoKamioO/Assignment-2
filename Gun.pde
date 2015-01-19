public class Gun
{
    PVector bullet;
    float bulletSpeed;
  
    public Gun(float x, float y, float len, float hei)
    {
       bullet = new PVector(x + len/2, y + hei/2);
       
       fire(bullet.x, bullet.y);
    }
    
    public void fire(float i, float j)
    {
        Speed(i, j);
        
        rect(i, j, 5, 5);
    }
    
    public void Speed(float x, float y)
    {
       bulletSpeed = 2;
      
       if((mouseX < x) && (mouseY < y))
       {
          bullet.x -= bulletSpeed;
          bullet.y -= bulletSpeed;
       }
       
       if((pmouseX < x) && (pmouseY > y))
       {
          bullet.x -= bulletSpeed;
          bullet.y += bulletSpeed;  
       }
       
       if((pmouseX > x) && (pmouseY < y))
       {
          bullet.x += bulletSpeed;
          bullet.y -= bulletSpeed; 
       }
       
       if((pmouseX > x) && (pmouseY > y))
       {
          bullet.x += bulletSpeed;
          bullet.y += bulletSpeed;
       }
    }
    
    public void Power()
    {
    }
}
