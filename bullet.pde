class Bullet {
  int x, y;
  ArrayList<Bullet> bullets;
  int xSpeed, ySpeed;
  int whoisshooting=1;


  Bullet(int x, int y, ArrayList<Bullet> bullets ) {
    this.x = x;
    this.y = y;
    this.bullets = bullets;

    xSpeed = 0;
    ySpeed = 0;



    if (whoisshooting ==1 ) {
      for (int i = 0; i < enemyTanks.size(); ++i) {
        if (enemyTanks != null)enemyTanks.get(i).update();
        if ( enemyTanks.get(i).eisup == true) {
          ySpeed = -10;
        }
          //break;
         else if ( enemyTanks.get(i).eisdown == true)  {
          ySpeed = 10; }
          //break;
         else if ( enemyTanks.get(i).eisleft == true)  {
          xSpeed = -10; }
          //break;
         else if ( enemyTanks.get(i).eisright == true)  {
          xSpeed = 10;  }
          //break;
        }
      } // calcualte the direction of enemytanks' bullets

else {

  if (isup == true ) {
    ySpeed = -10;
  }
  if (isdown==true ) {
    ySpeed = 10;
  }
  if (isleft==true ) {
    xSpeed = -10;
  }
  if (isright==true ) {
    xSpeed = 10;
  }
}

println(xSpeed, ySpeed);

// own tank's bullets' direction.
}




void update() {


  x += xSpeed;
  y += ySpeed;



  if (y<0 || y >600 || x<0 || x> 800) {

    die();
  }

  for (int i = 0; i < 15; ++i) {
    for (int a = 0; a < 20; ++a) {
      if (map[i][a] == W ) {
        if (rectRectIntersect(x, y, x+5, y+5, realMap[i][a].x, realMap[i][a].y, realMap[i][a].x+40, realMap[i][a].y+40) == true) {

          die();
          realMap[i][a].wallhp -=1;
          if (realMap[i][a].wallhp == 0) {
            realMap[i][a] = new wall(a * 40, i * 40, grassIMG, 10);
            map[i][a] = 'G';
          }
        }
      }
    }
  }

  for (int i = 0; i < 15; ++i) {
    for (int a = 0; a < 20; ++a) {
      if (map[i][a] == I ) {
        if (rectRectIntersect(x, y, x+5, y+5, realMap[i][a].x, realMap[i][a].y, realMap[i][a].x+40, realMap[i][a].y+40) == true) {

          die();
        }
      }
    }
  }
}


void keypressed() {
  if (key == ' ') {
    whoisshooting = 0;
  } else {
    whoisshooting =1; 
  }
}

void display() {
  pushMatrix();
  translate(x, y);
  fill(0);
  ellipse(0, 0, 5, 5);
  popMatrix();
}

void die() {

  bullets.remove(this);
}
}