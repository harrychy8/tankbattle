class EnemyTank {
  int x, y;
  int speed = 40;
  int wait=10;
  boolean ecangoup = true;
  boolean ecangoleft = true;
  boolean ecangoright = true;
  boolean ecangodown = true;
  boolean eisup, eisdown, eisleft, eisright;
  PImage tank2up;
  PImage tank2down;
  PImage tank2left;
  PImage tank2right;
  int amishooting = 0;



  EnemyTank(int x, int y) {
    this.x = x;
    this.y = y;


    tank2up = loadImage("tank2up.png");
    tank2up.resize(40, 40);
    tank2down = loadImage("tank2down.png");
    tank2down.resize(40, 40);
    tank2left = loadImage("tank2left.png");
    tank2left.resize(40, 40);
    tank2right = loadImage("tank2right.png");
    tank2right.resize(40, 40);
  }





  void moveUp() {
    if (this.ecangoup == true) {
      setalltofalse();
      this.eisup = true;
      this.y -= this.speed;
    }
  }

  void moveLeft() {
    if (this.ecangoleft) {
      setalltofalse();
      this.eisleft = true;
      this.x -= this.speed;
    }
  }

  void moveRight() {
    if (this.ecangoright) {
      setalltofalse();
      this.eisright = true;
      this.x += this.speed;
    }
  }

  void moveDown() {
    if (this.ecangodown) {
      setalltofalse();
      this.eisdown = true;
      this.y += this.speed;
    }
  }

  void setalltofalse() {
    this.eisup = false;
    this.eisdown = false;
    this.eisleft = false;
    this.eisright = false;
  }

  void shoot() {
   
    bullets.add(new Bullet((int)(this.x+20), (int)(this.y+20), bullets,1,this));
  }



  void randomMovement() {
    if (wait ==10) {
      wait =0;
      this.x += 40* (int) random(1,19);
    }
      
    if (wait < 5) {
      wait +=1;
    }
    if (wait==5) {
      wait = 0;
      int i = (int)random(1, 6);
      switch(i) {

      case 1:
        moveUp();
        break;

      case 2:
        moveDown();
        break;
      
      case 3:
        moveLeft();
        break;
      
      case 4:
        moveRight();
        break;
      
      case 5:
        shoot();
        break;


      default:

        break;
      }
    }


    x = constrain(x, 0, 760);
    y = constrain(y, 0, 560);
  }



  void update() {


    if (eisup) image(tank2up, x, y);
    if (eisdown) image(tank2down, x, y);
    if (eisleft) image(tank2left, x, y);
    if (eisright) image(tank2right, x, y);

    randomMovement();

    ecangoup=true;
    ecangodown=true;
    ecangoleft=true;
    ecangoright=true;


    for (int i = 0; i < 15; ++i) {
      for (int a = 0; a < 20; ++a) {
        if (map[i][a] == W || map[i][a] == R || map[i][a] == I ) {
          if (rectRectIntersect(x, y, x+40, y+40, realMap[i][a].x, realMap[i][a].y, realMap[i][a].x+40, realMap[i][a].y+40) == true) {
            if (x==realMap[i][a].x-40 && y-40<realMap[i][a].y  && y+40>realMap[i][a].y) {
              this.ecangoright = false;
            }
            if (x==realMap[i][a].x+40 && y-40<realMap[i][a].y  && y+40>realMap[i][a].y) {
              this.ecangoleft = false;
            }
            if (y==realMap[i][a].y-40 && x-40<realMap[i][a].x  && x+40>realMap[i][a].x) {
              this.ecangodown = false;
            }
            if (y==realMap[i][a].y+40 && x-40<realMap[i][a].x  && x+40>realMap[i][a].x) {
              this.ecangoup = false;
            }
          }
        }
      }
    }
    
    for (int i = 0; i < enemyTanks.size(); ++i){
        if(enemyTanks.get(i) != this){
          if (rectRectIntersect(this.x, this.y, this.x+40, this.y+40, enemyTanks.get(i).x, enemyTanks.get(i).y, enemyTanks.get(i).x+40, enemyTanks.get(i).y+40) == true) {
            if (this.x==enemyTanks.get(i).x-40 && this.y-40<enemyTanks.get(i).y  && this.y+40>enemyTanks.get(i).y) {
              this.ecangoright = false;
            }
            if (this.x==enemyTanks.get(i).x+40 && this.y-40<enemyTanks.get(i).y  && this.y+40>enemyTanks.get(i).y) {
              this.ecangoleft = false;
            }
            if (this.y==enemyTanks.get(i).y-40 && this.x-40<enemyTanks.get(i).x  && this.x+40>enemyTanks.get(i).x) {
              this.ecangodown = false;
            }
            if (this.y==enemyTanks.get(i).y+40 && this.x-40<enemyTanks.get(i).x  && this.x+40>enemyTanks.get(i).x) {
              this.ecangoup = false;
            }
          }
        }
    }
    
    if (rectRectIntersect(this.x, this.y, this.x+40, this.y+40, playerx, playery, playerx+40, playery+40) == true) {
      if (this.x==playerx-40 && this.y-40<playery  && this.y+40>playery) {
        this.ecangoright = false;
        cangoright = false;
      }
      if (this.x==playerx+40 && this.y-40<playery  && this.y+40>playery) {
        this.ecangoleft = false;
        cangoleft = false;
      }
      if (this.y==playery-40 && this.x-40<playerx  && this.x+40>playerx) {
        this.ecangodown = false;
        cangodown = false;
      }
      if (this.y==playery+40 && this.x-40<playerx  && this.x+40>playerx) {
        this.ecangoup = false;
        cangoup = false;
      }
    }
    
  }
}