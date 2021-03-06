static final char G = 'G';  //<>// //<>//
static final char W = 'W';
static final char I = 'I';
static final char R = 'R';


char[][] map = new char[][]{
  new char[]{G, G, G, G, G, G, G, G, G, G, G, G, G, G, G, G, G, G, G, G}, //1
  new char[]{G, W, W, G, W, W, W, G, W, W, G, I, I, I, G, G, W, W, W, G}, //2
  new char[]{W, W, G, G, G, G, G, G, G, G, G, R, R, G, G, G, G, G, W, G}, //3
  new char[]{G, G, G, G, I, G, R, R, G, W, G, G, G, G, R, R, G, G, W, G}, //4
  new char[]{G, R, R, R, I, G, R, R, G, W, G, W, W, W, W, G, G, G, G, G}, //5
  new char[]{G, G, G, G, I, G, G, W, W, W, G, G, G, G, G, G, G, W, W, W}, //6
  new char[]{G, W, G, G, G, G, G, G, G, G, G, G, G, G, R, G, R, R, R, G}, //7
  new char[]{G, W, G, G, W, W, W, G, G, G, R, R, G, R, R, G, G, G, G, G}, //8
  new char[]{W, W, W, G, R, R, R, R, G, G, R, W, G, G, W, W, W, W, G, G}, //9
  new char[]{G, G, G, G, G, G, W, G, G, G, R, W, G, G, G, G, G, W, G, W}, //10
  new char[]{G, R, R, G, G, G, W, G, G, G, G, G, G, G, G, G, G, W, G, G}, //11
  new char[]{G, W, W, G, W, W, W, G, I, I, I, G, W, W, W, G, G, W, W, G}, //12
  new char[]{G, G, G, G, G, G, G, G, G, G, G, G, G, G, G, G, G, G, G, G}, //13
  new char[]{W, G, W, W, G, W, G, G, W, W, W, W, G, R, R, G, W, W, W, G}, //14
  new char[]{W, G, G, W, G, G, G, G, W, G, G, W, G, G, G, G, W, G, G, G}  //15
};

block[][] realMap = new block[15][20];


float playerx = 280, playery= 560 ;

PImage ironIMG, grassIMG, wallIMG, waterIMG, backgroundIMG, canadaIMG;
boolean isup, isdown, isleft, isright;
boolean cangoup=true, cangodown=true, cangoleft=true, cangoright=true;
PImage tankup;
PImage tankdown;
PImage tankleft;
PImage tankright;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

ArrayList<EnemyTank> enemyTanks = new ArrayList<EnemyTank>();

PImage tank2;






void setup() {
  size(800, 600, P3D );
  ellipseMode(RADIUS);
  smooth();
  backgroundIMG = loadImage("grass.png");
  backgroundIMG.resize(800, 600);
  wallIMG = loadImage("wall.png");
  wallIMG.resize(40, 40);
  grassIMG = loadImage("grass.png");
  grassIMG.resize(40, 40);
  ironIMG = loadImage("iron.png");
  ironIMG.resize(40, 40);
  waterIMG = loadImage("water.png");
  waterIMG.resize(40, 40);
  canadaIMG = loadImage("canada.png");
  canadaIMG.resize(80, 40);
  tankup = loadImage("tankup.png");
  tankup.resize(40, 40);
  tankdown = loadImage("tankdown.png");
  tankdown.resize(40, 40);
  tankleft = loadImage("tankleft.png");
  tankleft.resize(40, 40);
  tankright = loadImage("tankright.png");
  tankright.resize(40, 40);



  isup = true;

  for (int i = 0; i < 15; ++i) {
    for (int a = 0; a < 20; ++a) {
      if (map[i][a] == W) {
        realMap[i][a] = new wall(a * 40, i * 40, wallIMG, 5);
      }
      if (map[i][a] == R) {
        realMap[i][a] = new wall(a * 40, i * 40, waterIMG, -1);
      }
      if (map[i][a] == G) {
        realMap[i][a] = new wall(a * 40, i * 40, grassIMG, -1);
      }
      if (map[i][a] == I) {
        realMap[i][a] = new wall(a * 40, i * 40, ironIMG, -1);
      }
    }
  }



  for (int i = 0; i < 10; ++i) {
    spawnEnemyTank();
  }
}

void spawnEnemyTank() {
  enemyTanks.add(new EnemyTank  ( 0, 0) );
}


void draw() {

  image(backgroundIMG, 0, 0);
  for (int i = 0; i < 15; ++i) {
    for (int a = 0; a < 20; ++a) {
      realMap[i][a].update();
    }
  }
  image (canadaIMG, 360, 560);

  if (isup) image(tankup, playerx, playery);
  if (isdown) image(tankdown, playerx, playery);
  if (isleft) image(tankleft, playerx, playery);
  if (isright) image(tankright, playerx, playery);





  cangoup=true;
  cangodown=true;
  cangoleft=true;
  cangoright=true;






  for (int i = 0; i < 15; ++i) {
    for (int a = 0; a < 20; ++a) {
      if (map[i][a] == W || map[i][a] == R || map[i][a] == I ) {
        if (rectRectIntersect(playerx, playery, playerx+40, playery+40, realMap[i][a].x, realMap[i][a].y, realMap[i][a].x+40, realMap[i][a].y+40) == true) {
          if (playerx==realMap[i][a].x-40 && playery-40<realMap[i][a].y  && playery+40>realMap[i][a].y) {

            cangoright = false;
          } 


          if (playerx==realMap[i][a].x+40 && playery-40<realMap[i][a].y  && playery+40>realMap[i][a].y) {
            cangoleft = false;
          }


          if (playery==realMap[i][a].y-40 && playerx-40<realMap[i][a].x  && playerx+40>realMap[i][a].x) {
            cangodown = false;
          }


          if (playery==realMap[i][a].y+40 && playerx-40<realMap[i][a].x  && playerx+40>realMap[i][a].x) {
            cangoup = false;
          }
        }
      }
    }
  }

  for (int i = 0; i < enemyTanks.size(); ++i) {
    if (enemyTanks != null ) {
      enemyTanks.get(i).update();
    }
  }


  for (int i = 0; i < enemyTanks.size(); ++i) {
    if (rectRectIntersect(playerx, playery, playerx+40, playery+40, enemyTanks.get(i).x, enemyTanks.get(i).y, enemyTanks.get(i).x+40, enemyTanks.get(i).y+40) == true) {
      if (playerx==enemyTanks.get(i).x-40 && playery-40<enemyTanks.get(i).y  && playery+40>enemyTanks.get(i).y) {

        cangoright = false;
      } 


      if (playerx==enemyTanks.get(i).x+40 && playery-40<enemyTanks.get(i).y  && playery+40>enemyTanks.get(i).y) {
        cangoleft = false;
      }


      if (playery==enemyTanks.get(i).y-40 && playerx-40<enemyTanks.get(i).x  && playerx+40>enemyTanks.get(i).x) {
        cangodown = false;
      }


      if (playery==enemyTanks.get(i).y+40 && playerx-40<enemyTanks.get(i).x  && playerx+40>enemyTanks.get(i).x) {
        cangoup = false;
      }
    }
  }






  for (int i = 0; i < bullets.size(); ++i) {
    Bullet bullet = bullets.get(i);
    if (bullet != null) bullet.update();
    if (bullet != null) bullet.display();
  }
}


boolean isColliding (Enemytank Enemytank, Bullet bullet);


boolean rectRectIntersect(float left, float top, float right, float bottom, 
  float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}





void keyPressed() {
  if (key == 'w' || key == 'W') {
    if  (cangoup == true) {
      playery-=40;
    }
    setalltofalse();
    isup = true;
  }
  if (key == 's' || key == 'S') {
    if  (cangodown == true) {
      playery+=40;
    }
    setalltofalse();
    isdown = true;
  }
  if (key == 'a' || key == 'A') {
    if  (cangoleft == true) {
      playerx-=40;
    }
    setalltofalse();
    isleft = true;
  }
  if (key == 'd' || key == 'D') {
    if  (cangoright == true) {
      playerx+=40;
    }
    setalltofalse();
    isright = true;
  }

  playerx = constrain(playerx, 0, 760);
  playery = constrain(playery, 0, 560);


  if (key == ' ') {

    shoot();
  }
}


void shoot() {
  bullets.add(new Bullet((int)(playerx+20), (int)(playery+20), bullets, 0, null));
}




void setalltofalse() {
  isup = false;
  isdown = false;
  isleft = false;
  isright = false;
}