class Bullet{
  int x, y;
  int speed;
  
  Bullet(int x, int y){
    this.x = x;
    this.y = y;
    speed = 10;
  }



void update(){
    // check for outside screen
    // hit detection etc.
    
    y -= speed; // wrong!!
    
    if(y < 0){
      die();  
    }
  }
  
void display(){
    pushMatrix();
    translate(x, y);
    fill(0);
    ellipse(0, 0, 20, 20);
    popMatrix();
  }
  
void die(){
    // remove the bullet from the arrayList
    // will throw a ConcurrentModificationException
    // don't know why
    //bullets.remove(this);
  }
}