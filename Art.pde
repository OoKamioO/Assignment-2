public void foreground()
{
    fill(152, 152, 152);
    rect(-1, height - height/5, width + 1, height/5);
    
    fill(255);
    textSize(18);
    text("HP: ", 20, (height - height/5) + 30);
    text(playerHp, 55, (height - height/5) + 30);
    
    text("Bullets: ", 20, (height - height/5) + 50);
    text(currentGunBullets, 90, (height - height/5) + 50);
    
    text("Ammo: ", 20, (height - height/5) + 70);
    text(currentGunAmmo, 90, (height - height/5) + 70);
    
    text("Points: ", 20, (height - height/5) + 105);
    text(points, 85, (height - height/5) + 105);
    
    text("Round", width/2 - 50, (height - height/5) + 50);
    
    text("Weapon", width - 150, (height - height/5) + 25);
    
    textSize(25);
    text(round, width/2 - 30, (height - height/5) + 90);
    
    rect(width - 135, (height - height/5) + 40, 40, 40);
    
    textSize(22);
    text("Handgun", width - 162, height - 10);
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