public class Collision
{
    //First object
    float objXCo;
    float objYCo;
    float objLen;
    float objHei;
    
    float objXCo2;
    float objYCo2;
    
    //Second object
    float obj2XCo;
    float obj2YCo;
    float obj2Len;
    float obj2Hei;
    
    float obj2XCo2;
    float obj2YCo2;
  
    public Collision()
    {
       objXCo = 0;
       objYCo = 0;
       objLen = 0;
       objHei = 0;
       
       objXCo2 = 0;
       objYCo2 = 0;
    }
  
    public Collision(float xCo, float yCo, float len, float hei)
    {
       objXCo = xCo;
       objYCo = yCo;
       objLen = len;
       objHei = hei;
       
       objXCo2 = xCo + len;
       objYCo2 = yCo + hei;
    }
    
    public boolean boxCheck()
    {
       boolean hit = true;
      
       //Checks if mouse is in box
       if(((mouseY >= objYCo) && (mouseY <= objYCo2)) && 
       ((mouseX >= objXCo) && (mouseX <= objXCo2)))
       {
           hit = false;
       }
       
       return hit;
    }
    
    public boolean collisionConnect(float xCo, float yCo, float len, float hei)
    {
       boolean hit = false;
      
       obj2XCo = xCo;
       obj2YCo = yCo;
       obj2Len = len;
       obj2Hei = hei;
       
       obj2XCo2 = xCo + len;
       obj2YCo2 = yCo + hei;
      
       //Bottom right of object2 touches or is inside object1
       if(((obj2YCo2 >= objYCo) && (obj2YCo2 <= objYCo2)) && 
       ((obj2XCo2 >= objXCo) && (obj2XCo2 <= objXCo2)))
       {
           hit = true;
       }
       
       //Bottom left of object2 touches or is inside object1
       if(((obj2YCo2 >= objYCo) && (obj2YCo2 <= objYCo2)) && 
       ((obj2XCo >= objXCo) && (obj2XCo <= objXCo2)))
       {
           hit = true;
       }
       
       //Top right of object2 touches or is inside object1
       if(((obj2XCo2 >= objXCo) && (obj2XCo2 <= objXCo2)) && 
       ((obj2YCo >= objYCo) && (obj2YCo <= objYCo2)))
       {
           hit = true;
       }
       
       //Top left of object2 touches or is inside object1
       if(((obj2XCo >= objXCo) && (obj2XCo <= objXCo2)) && 
       ((obj2YCo >= objYCo) && (obj2YCo <= objYCo2)))
       {
           hit = true;
       }
       
       return hit;
    }
    
    //Checks to see if bullets are out of bounds
    public boolean bulletOutOfBounds()
    {
        boolean out = false;
      
        if(objXCo > width)
        {
           out = true;
        }
        else if(objXCo < 0 - objLen)
        {
           out = true;
        }
        else if(objYCo > height)
        {
           out = true;
        }
        else if(objYCo < 0 - objHei)
        {
           out = true;
        }
        
        return out;
    }
}
