class Tank {
  int x, y;
  boolean isup = true, isdown = false, isleft = false, isright = false;
  boolean cangoup = true;
  boolean cangoleft = true;
  boolean cangoright = true;
  boolean cangodown = true;
  Tank(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void moveUp(){
    
  }
  
  void moveDown(){
    
  }
  
  void moveLeft(){
    
  }
  
  void moveRight(){
    
  }
  
  //Detect collision
  boolean detectCollision(float l, float t, float r, float b){
    return rectRectIntersect(this.x,this.y,this.x+40,this.y+40,l,t,r,b);
  }
  
  //Get current X coordinate / 40
  int getCurrentBlockX(){
    return (int)(this.x / 40);
  }
  
  //Get current Y coordinate / 40
  int getCurrentBlockY(){
    return (int)(this.y / 40);
  }
  
  //Set isup, isdown, isleft and isright to false
  void resetFacing(){
    this.isup = false;
    this.isdown = false;
    this.isleft = false;
    this.isright = false;
  }
  
  //For player
  void handleKeyPressed(char k){
    if (key == 'w' || key == 'W') {
      if (this.cangoup == true) this.moveUp();
      resetFacing();
      this.isup = true;
    } else if (key == 'a' || key == 'A'){
      if (this.cangoleft == true) this.moveLeft();
      resetFacing();
      this.isleft = true;
    } else if (key == 's' || key == 'S'){
      if (this.cangodown == true) this.moveDown();
      resetFacing();
      this.isdown = true;
    } else if (key == 'd' || key == 'D'){
      if (this.cangoright == true) this.moveRight();
      resetFacing();
      this.isright = true;
    }
  }
  
  //For enemy tanks
  void ai(){
    
  }
  
  void update(){
    
  }
}