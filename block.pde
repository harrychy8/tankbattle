
class block {
  int x,y;
  PImage img;
  block(int x, int y, PImage imageToUse){
    this.x = x;
    this.y = y;
    this.img = imageToUse;
  }
  
  void update(){
    image(img,x,y);
  }
}

class river extends block{
  river(int x, int y, PImage imageToUse){
    super(x,y,imageToUse); 
  }
}

class wall extends block{
  wall(int x, int y, PImage imageToUse){
    super(x,y,imageToUse); 
  }
}

class iron extends block{
  iron(int x, int y, PImage imageToUse){
    super(x,y,imageToUse); 
  }
}