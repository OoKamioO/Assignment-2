float playerLen;
float playerHei;

float playerX;
float playerY;

float playerSpd;

Player player1;

Gun pistol;
Enemies zombie;
Collision collision;

ArrayList<Gun> Bullets;
ArrayList<Enemies> AI;

float mouseXClickCo;
float mouseYClickCo;

boolean collided;

int secondsBetweenSpawn;
float spawnRate;

int points;
int playerHp;

boolean currentlyReloading;
int reloadedBullets;

int currentGunBullets;
int currentGunAmmo;

float nextReload;

int reloadTime = 3 * 60;
int maxBullets = 6;

int gunReloadTime;
