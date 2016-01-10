static final char G = 'G';  //<>//
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


float x = 280, y= 560 ;
float x2 = 400, y2 = 400;
PImage ironIMG, grassIMG, wallIMG, waterIMG, backgroundIMG, canadaIMG;
boolean isup, isdown, isleft, isright;
boolean cangoup=true, cangodown=true, cangoleft=true, cangoright=true;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

ArrayList<EnemyTank> enemyTanks = new ArrayList<EnemyTank>();
int whoIsShooting; 
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

  player = new Tank(280, 560);

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



  for (int i = 0; i < 4; ++i) {
    spawnEnemyTank();
  }
}

void spawnEnemyTank() {
  enemyTanks.add(new EnemyTank((int)(40 * random(0, 19)), 0));
}


void draw() {

  image(backgroundIMG, 0, 0);
  for (int i = 0; i < 15; ++i) {
    for (int a = 0; a < 20; ++a) {
      realMap[i][a].update();
    }
  }
  image (canadaIMG, 360, 560);






  cangoup=true;
  cangodown=true;
  cangoleft=true;
  cangoright=true;

 




    for (int i = 0; i < 15; ++i) {
      for (int a = 0; a < 20; ++a) {
        if (map[i][a] == W || map[i][a] == R || map[i][a] == I ) {
          if (rectRectIntersect(x, y, x+40, y+40, realMap[i][a].x, realMap[i][a].y, realMap[i][a].x+40, realMap[i][a].y+40) == true) {
            if (x==realMap[i][a].x-40 && y-40<realMap[i][a].y  && y+40>realMap[i][a].y) {

              cangoright = false;
            } 


            if (x==realMap[i][a].x+40 && y-40<realMap[i][a].y  && y+40>realMap[i][a].y) {
              cangoleft = false;
            }


            if (y==realMap[i][a].y-40 && x-40<realMap[i][a].x  && x+40>realMap[i][a].x) {
              cangodown = false;
            }


            if (y==realMap[i][a].y+40 && x-40<realMap[i][a].x  && x+40>realMap[i][a].x) {
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

    for (int i = 0; i < bullets.size(); ++i) {
      Bullet bullet = bullets.get(i);
      if (bullet != null) bullet.update();
      if (bullet != null) bullet.display();
    }
  }
}

  void keyPressed() {
    player.handleKeyPressed();
  }


  boolean rectRectIntersect(float left, float top, float right, float bottom, 
    float otherLeft, float otherTop, float otherRight, float otherBottom) {
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }





    void keyPressed() {
    if (key == 'w' || key == 'W') {
      if  (cangoup == true) {
        y-=20;
      }
      setalltofalse();
      isup = true;
    }
    if (key == 's' || key == 'S') {
      if  (cangodown == true) {
        y+=20;
      }
      setalltofalse();
      isdown = true;
    }
    if (key == 'a' || key == 'A') {
      if  (cangoleft == true) {
        x-=20;
      }
      setalltofalse();
      isleft = true;
    }
    if (key == 'd' || key == 'D') {
      if  (cangoright == true) {
        x+=20;
      }
      setalltofalse();
      isright = true;
    }

    x = constrain(x, 0, 760);
    y = constrain(y, 0, 560);


    if (key == ' ') {
      whoIsShooting =0;
      shoot();
    }
  }
  

    void shoot() {
    bullets.add(new Bullet((int)(x+20), (int)(y+20), bullets));
  }




  void setalltofalse() {
    isup = false;
    isdown = false;
    isleft = false;
    isright = false;
  }