static final char G = 'G';
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
PImage ironIMG, grassIMG, wallIMG, waterIMG, backgroundIMG;
PImage tankup;
PImage tankdown;
PImage tankleft;
PImage tankright;
boolean isup, isdown, isleft, isright;
boolean cangoup=true, cangodown=true, cangoleft=true, cangoright=true;


PImage tank1;
PImage tank3;

void setup() {
  size(800, 600);
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
  tankup = loadImage("tankup.png");
  tankup.resize(40, 40);
  tankdown = loadImage("tankdown.png");
  tankdown.resize(40, 40);
  tankleft = loadImage("tankleft.png");
  tankleft.resize(40, 40);
  tankright = loadImage("tankright.png");
  tankright.resize(40, 40);
  tank1 = loadImage("tank1.png");
  tank1.resize(40, 40);
  tank3 = loadImage("tank2.png");
  tank3.resize(40, 40);
  isup = true;
 
  for (int i = 0; i < 15; ++i) {
    for (int a = 0; a < 20; ++a) {
      if (map[i][a] == W) {
        realMap[i][a] = new wall(a * 40, i * 40, wallIMG);
      }
      if (map[i][a] == R) {
        realMap[i][a] = new wall(a * 40, i * 40, waterIMG);
      }
      if (map[i][a] == G) {
        realMap[i][a] = new wall(a * 40, i * 40, grassIMG);
      }
      if (map[i][a] == I) {
        realMap[i][a] = new wall(a * 40, i * 40, ironIMG);
      }
    }
  }
}


void draw() {

  image(backgroundIMG, 0, 0);
  for (int i = 0; i < 15; ++i) {
    for (int a = 0; a < 20; ++a) {
      realMap[i][a].update();
    }
  }
  image(tank1, 400, 400);
  image(tank3, 400, 0);


  if (isup) image(tankup, x, y);
  if (isdown) image(tankdown, x, y);
  if (isleft) image(tankleft, x, y);
  if (isright) image(tankright, x, y);




  for (int i = 0; i < 15; ++i) {
    for (int a = 0; a < 20; ++a) {
      if (map[i][a] == W || map[i][a] == R || map[i][a] == I ) {
        if (rectRectIntersect(x, y, x+40, y+40, realMap[i][a].x, realMap[i][a].y, realMap[i][a].x+40, realMap[i][a].y+40) == true) {
          if (x==realMap[i][a].x-40 && y-40<realMap[i][a].y  && y+40>realMap[i][a].y) {
            cangoright = false; 
          } else {
          cangoright = true;
          }
         
          
          if (x==realMap[i][a].x+40 && y-40<realMap[i][a].y  && y+40>realMap[i][a].y){
            cangoleft = false; 
          } else {
          cangoleft = true;
          }
          
          
          if (y==realMap[i][a].y-40 && x-40<realMap[i][a].x  && x+40>realMap[i][a].x){
            cangoup = false; 
          } else {
          cangoup = true;
          }
          
          
          if (y==realMap[i][a].y+40 && x-40<realMap[i][a].x  && x+40>realMap[i][a].x){
            cangodown = false; 
          } else {
          cangodown = true;
          }
        } 
        
      }
    }
   }
  }





boolean rectRectIntersect(float left, float top, float right, float bottom, 
  float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}






void keyPressed() {
  if ((key == 'w' || key == 'W') && cangoup) {

    y-=10;
    setalltofalse();
    isup = true;
  }
  if ((key == 's' || key == 'S') && cangodown) {
    y+=10;
    setalltofalse();
    isdown = true;
  }
  if ((key == 'a' || key == 'A') && cangoleft) {
    x-=10;
    setalltofalse();
    isleft = true;
  }
  if ((key == 'd' || key == 'D') && cangoright) {
    x+=10;
    setalltofalse();
    isright = true;
  }

  x = constrain(x, 0, 760);
  y = constrain(y, 0, 560);
}

void setalltofalse() {
  isup = false;
  isdown = false;
  isleft = false;
  isright = false;
}