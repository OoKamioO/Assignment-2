public class Powerups
{ 
   int powerUpLen;
   int powerUpHei;
    
   float powerX;
   float powerY;
    
   int powerUpValue;
  
   public Powerups(float x, float y, float len, float hei, int i)
   {
       powerUpLen = 10;
       powerUpHei = 10;
       
       powerX = x + len;
       powerY = y + hei;
       
       powerUpValue = i;
       
       if(powerX < 0)
       {
          powerX = 0;
       }
       
       if(powerY < 0)
       {
          powerY = 0;
       }
   }
   
   public void drawPowerUp()
   {
       switch(powerUpValue)
       {
           case 0:
           {
              fill(255);
              rect(powerX, powerY, powerUpLen, powerUpHei);
              
              break;
           }
           
           case 1:
           {
               fill(0, 155, 0);
               rect(powerX, powerY, powerUpLen, powerUpHei);
       
               break;
           }
           
           case 2:
           {
                fill(155, 155, 0);
                rect(powerX, powerY, powerUpLen, powerUpHei);
                
                break;
           }
       }
   }
   
   public void pointsUp()
   {
        points += 100;
   }
   
   public void healthUp()
   {
        playerHp += 20;
        
        if(playerHp > playerMaxHp)
        {
            playerHp = playerMaxHp;
        }
   }
   
   public void ammoUp()
   {
        currentGunAmmo += 10;
        
        if(currentGunAmmo > (maxGunAmmo + (maxAmmoUp * 5)))
        {
            currentGunAmmo = maxGunAmmo + (maxAmmoUp * 5);
        }
   }
}
