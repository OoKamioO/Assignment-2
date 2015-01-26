int maxAmmoUp;
int gunPowerUp;
int playerSpeedUp;
int playerMaxHpUp;

int maxAmmoUpCost;
int gunPowerUpCost;
int playerSpeedUpCost;
int playerMaxHpUpCost;

public void speedUp()
{
    playerSpd += 1;
    points -= playerSpeedUpCost;
    playerSpeedUpCost *= 2;
}

public void playerHpUp()
{
    playerMaxHp += 10;
    points -= playerMaxHpUpCost;
    playerMaxHpUpCost *= 2;
}

public void maxAmmoUp()
{
    maxAmmoUp += 1;
    points -= maxAmmoUpCost;
    maxAmmoUpCost *= 2;
}

public void gunPowerUp()
{
    gunPowerUp += 1;
    points -= gunPowerUpCost;
    gunPowerUpCost *= 2;
}

public void selectPurchase(int objXCo, int objYCo, int i)
{
    int objYCo2 = objYCo + 50;
    int objXCo2 = objXCo + 50;
  
    //Bottom right of object2 touches or is inside object1
     if(((mouseY >= objYCo) && (mouseY <= objYCo2)) && 
     ((mouseX >= objXCo) && (mouseX <= objXCo2)))
     {
         if(confirmBuy)
         {
             confirmPurchase(i);
             
             confirmBuy = false;
         }
     }
}

public void confirmPurchase(int j)
{    
     switch(j)
     {
        //Hp up
        case 0:
        {
            if(points >= playerMaxHpUpCost)
            {
                playerHpUp();
            }
            
            break;
        }
        
        //Speed up
        case 1:
        {
            if(points >= playerSpeedUpCost)
            {
                speedUp();
            }
            
            break;
        }
        
        //Increase gun power
        case 2:
        {
             if(points >= gunPowerUpCost)
             {
                 gunPowerUp();
             }
             
             break;
        }
        
        //Max Ammo up
        case 3:
        {
             if(points >= maxAmmoUpCost)
             {
                 maxAmmoUp();
             }
             break;
        }
        
        
     }
}
