public void foreground()
{
    fill(152, 152, 152);
    rect(-1, height - height/5, width + 1, height/5);
    
    fill(255);
    textSize(18);
    text("HP: ", 20, (height - height/5) + 30);
    text(playerHp, 55, (height - height/5) + 30);
    
    if(gun == 1)
    {
       text("Bullets: ", 20, (height - height/5) + 50);
       text(currentGunBullets, 90, (height - height/5) + 50);
    
       text("Ammo: ", 20, (height - height/5) + 70);
       text(currentGunAmmo, 90, (height - height/5) + 70);
       
       rect(width - 135, (height - height/5) + 40, 40, 40);
    
       textSize(22);
       text("Handgun", width - 162, height - 10);
    }  
   
    if(gun == 2)
    {
       text("Bullets: ", 20, (height - height/5) + 50);
       text(currentShotgunBullets, 90, (height - height/5) + 50);
    
       text("Ammo: ", 20, (height - height/5) + 70);
       text(currentShotgunAmmo, 90, (height - height/5) + 70);
       
       textSize(22);
       text("Shotgun", width - 166, height - 10);
       
       fill(255, 0, 0);
       rect(width - 135, (height - height/5) + 40, 40, 40);
    } 
     
    fill(255);
    textSize(18);
    text("Points: ", 20, (height - height/5) + 105);
    text(points, 85, (height - height/5) + 105);
    
    text("Round", width/2 - 50, (height - height/5) + 50);
    
    text("Weapon", width - 150, (height - height/5) + 25);
    
    
    textSize(25);
    text(round + 1, width/2 - 30, (height - height/5) + 90);
}

public void startScreen()
{
    background(0);
  
    textSize(22);
    text("Press F to start", width/2 - 70, height/2);
}

public void endScreen()
{
     background(0);
 
     text("Game Over", width/2 - 55, height/4);
     text("Points: ", width/2 - 60, height/4 + 25);
     text(points + 1, width/2 + 20, height/4 + 25);
     
     text("Press F to go back to the main screen.", width/2 - 190, height/2);
}

public void upgradeMenu()
{
  //Main backdrop of upgrade menu
    fill(100);
    rect(-1, -1, width, height/5);
    
    fill(0, 155, 0);
    rect(60, 30, 50, 50);
    
    //Increase HP layers
    textSize(15);
    fill(0);
    text("Max HP UP", 50, 20);
    
    fill(255);
    text("Points:", 40, 105);
    text(playerMaxHpUpCost, 95, 105);
    
    //Increase speed layer
    fill(0, 0, 155);
    rect(230, 30, 50, 50);
    
    textSize(15);
    fill(0);
    text("Max Speed Up", 210, 20);
    
    fill(255);
    text("Points:", 200, 105);
    text(playerSpeedUpCost, 255, 105);
    
    //Increase bullet power layer
    fill(200);
    rect(width/2 + 135, 30, 50, 50);
    
    textSize(15);
    fill(0);
    text("Bullet Power Up", width/2 + 110, 20);
    
    fill(255);
    text("Points:", width/2 + 100, 105);
    text(gunPowerUpCost, width/2 + 155, 105);
    
    //Increase ammo layer
    fill(200, 200, 0);
    rect(width/2 + 295, 30, 50, 50);
    
    textSize(15);
    fill(0);
    text("Max Ammo UP", width/2 + 270, 20);
    
    fill(255);
    text("Points:", width/2 + 260, 105);
    text(maxAmmoUpCost, width/2 + 315, 105);
    
    fill(255);
    textSize(20);
    text("Upgrade", width/2 - 30, 20);
}
