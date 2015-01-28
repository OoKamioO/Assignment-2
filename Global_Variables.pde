float playerLen;
float playerHei;

float playerX;
float playerY;

float playerSpd;
int playerHp;
int playerMaxHp;

Player player1;

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

int currentShotgunBullets;
int currentShotgunAmmo;

float nextReload;

int shotgunReloadTime = 3 * 60;
int maxBullets = 6;
int maxShotgunBullets = 1;

int gunReloadTime = 2 * 60;
int maxGunAmmo;
int maxShotgunAmmo;

int maxEnemies;
int enemyCounter;
int enemyKilled;

int round;

int powerUpSpawn;
int enemySpawnType;

int gun;
int shellCounter = 1;

float nextFired = 0;
float hitCounter = 0;
float bulletHitPower = 0;
