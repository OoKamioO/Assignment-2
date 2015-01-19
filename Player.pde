public class Player
{
    public void drawPlayer()
    {
       rect(playerX, playerY, playerLen, playerHei);
    }
  
    public void moveUp(float s)
    {
        playerY -= s;
    }
    
    public void moveDown(float s)
    {
        playerY += s;
    }
    
    public void moveLeft(float s)
    {
        playerX -= s;
    }
    
    public void moveRight(float s)
    {
        playerX += s;
    }
}
