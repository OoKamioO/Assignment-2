abstract public class Gun
{
    PVector bullet;
    float bulletSpeed;
  
    public void Gun(float x, float y, float len, float hei)
    {
       bullet = new PVector(x + len/2, y + hei/2);
       
       fire(bullet.x, bullet.y);
    }
    
    public void fire(float i, float j)
    {
        Speed(i, j);
        
        rect(bullet.x, bullet.y, 5, 5);
    }
    
    public void Speed(float x, float y)
    {
       if((pmouseX < this.x) && (pmouseY < this.y))
       {
          bullet.x -= bulletSpeed;
          bullet.y -= bulletSpeed;
       }
       
       if((pmouseX < this.x) && (pmouseY > this.y))
       {
          bullet.x -= bulletSpeed;
          bullet.y += bulletSpeed;  
       }
       
       if((pmouseX > this.x) && (pmouseY < this.y))
       {
          bullet.x += bulletSpeed;
          bullet.y -= bulletSpeed; 
       }
       
       if((pmouseX > this.x) && (pmouseY > this.y))
       {
          bullet.x += bulletSpeed;
          bullet.y += bulletSpeed;
       }
    }
    
    public void Power()
    {
    }
}
