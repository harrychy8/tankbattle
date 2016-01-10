class Tank {
  int x, y;
  boolean isup = true, isdown = false, isleft = false, isright = false;
  boolean cangoup = true;
  boolean cangoleft = true;
  boolean cangoright = true;
  boolean cangodown = true;
  PImage tankup;
  PImage tankdown;
  PImage tankleft;
  PImage tankright;
  Tank(int x, int y) {
    this.x = x;
    this.y = y;

    tankup = loadImage("tankup.png");
    tankup.resize(40, 40);
    tankdown = loadImage("tankdown.png");
    tankdown.resize(40, 40);
    tankleft = loadImage("tankleft.png");
    tankleft.resize(40, 40);
    tankright = loadImage("tankright.png");
    tankright.resize(40, 40);
  }


  void moveUp() { 
    y-=10;
  }
  void moveDown() { 
    y+=10;
  }
  void moveLeft() { 
    x-=10;
  }
  void moveRight() { 
    x+=10;
  }




  //Get current X coordinate / 40
  int getCurrentBlockX() {
    return (int)(this.x / 40);
  }

  //Get current Y coordinate / 40
  int getCurrentBlockY() {
    return (int)(this.y / 40);
  }

  //Set isup, isdown, isleft and isright to false
  void resetFacing() {
    this.isup = false;
    this.isdown = false;
    this.isleft = false;
    this.isright = false;
  }

  //For player
  void handleKeyPressed() {
    if (key == 'w' || key == 'W') {
      if (this.cangoup == true) this.moveUp();
      resetFacing();
      this.isup = true;
    } else if (key == 'a' || key == 'A') {
      if (this.cangoleft == true) this.moveLeft();
      resetFacing();
      this.isleft = true;
    } else if (key == 's' || key == 'S') {
      if (this.cangodown == true) this.moveDown();
      resetFacing();
      this.isdown = true;
    } else if (key == 'd' || key == 'D') {
      if (this.cangoright == true) this.moveRight();
      resetFacing();
      this.isright = true;
    }
  }


  void update() {


    if (this.isup) image(this.tankup, x, y);
    if (this.isdown) image(this.tankdown, x, y);
    if (this.isleft) image(this.tankleft, x, y);
    if (this.isright) image(this.tankright, x, y);


    for (int i = 0; i < 15; ++i) {
      for (int a = 0; a < 20; ++a) {
        if (map[i][a] == W || map[i][a] == R || map[i][a] == I ) {
          if (this.detectCollision(realMap[i][a].x, realMap[i][a].y, realMap[i][a].x+40, realMap[i][a].y+40) == true) {
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
  }
  
  boolean detectCollision (float l, float t, float r, float b) {
    return rectRectIntersect(this.x, this.y, this.x+40, this.y+40, l, t, r, b);
  }
}