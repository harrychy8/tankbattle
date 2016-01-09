class EnemyTank {
  int x,y;
  int speed = 20;
  PImage mainImage = loadImage("tank2.png");
  EnemyTank(int x, int y){
    this.x = x;
    this.y = y;
    this.mainImage.resize(40,40);
  }
  
  void moveUp(){
    this.y -= this.speed;
  }
  
  void moveLeft(){
    this.x -= this.speed;
  }
  
  void moveRight(){
    this.x += this.speed;
  }
  
  void moveDown(){
    this.y += this.speed;
  }
  
  void findRoute(int playerX, int playerY){
    playerX = (int)(playerX / 40);
    playerY = (int)(playerY / 40);
    println(playerX, playerY);
    fill(0,255,0,100);
    rect(playerX * 40,playerY * 40,40,40);
    
    int tankX = x / 40;
    int tankY = y / 40;
    
    println(tankX, tankY);
    fill(255,0,0,100);
    rect(tankX * 40,tankY * 40,40,40);
    
    int scanX = tankX;
    int scanY = tankY;
    //while ((scanX != playerX) && (scanY != playerY)){
      
    //}
  }
  
  void randomMovement(){
     int i = (int)random(1,5);
     switch(i){
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
       default:
       break;
     }
  }
  
  void update(){
    image(this.mainImage,this.x,this.y);
    randomMovement();
  }
}