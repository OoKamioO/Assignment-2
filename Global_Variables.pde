float playerLen;
float playerHei;

float playerX;
float playerY;

float playerSpd;
int playerHp;
int playerMaxHp;

Player player1;

Gun pistol;
Enemies zombie;
Collision collision;

ArrayList<Gun> Bullets;
ArrayList<Enemies> AI;
ArrayList<Powerups> PowerUp;

float mouseXClickCo;
float mouseYClickCo;

boolean collided;

int secondsBetweenSpawn;
float spawnRate;

int points;
boolean confirmBuy;

boolean currentlyReloading;
int reloadedBullets;

int gameOver;

int currentGunBullets;
int currentGunAmmo;

float nextReload;

int reloadTime = 3 * 60;
int maxBullets = 6;

int gunReloadTime;
int maxGunAmmo;

int maxEnemies;
int enemyCounter;
int enemyKilled;

int round;

int powerUpSpawn;
int enemySpawnType;
