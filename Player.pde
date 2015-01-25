public class Player
{
    public void drawPlayer()
    {
       rect(playerX, playerY, playerLen, playerHei);
    }
  
    public void moveUp(float s)
    {
        if(playerY > 0)
        {
            playerY -= s;
        }
        else
        {
            playerY = 0;
        }
    }
    
    public void moveDown(float s)
    {
        if(playerY < ((height - height/5) - playerHei))
        {
           playerY += s;
        }
        else
        {
           playerY = (height - height/5) - playerHei;
        }
    }
    
    public void moveLeft(float s)
    {
        if(playerX > 0)
        {
           playerX -= s;
        }
        else 
        {
           playerX = 0;
        }
    }
    
    public void moveRight(float s)
    {
        if(playerX < (width - playerLen))
        {
            playerX += s;
        }
        else
        {
            playerX = (width - playerLen);
        }
    }
}
