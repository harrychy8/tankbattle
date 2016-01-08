class Bullet{
  int x, y;
  int speed;
  ArrayList<Bullet> bullets;
  
  Bullet(int x, int y,ArrayList<Bullet> bullets){
    this.x = x;
    this.y = y;
    this.bullets = bullets;
    speed = 10;
  }



void update(){
    
    
    
    if (isup==true){
      y -= speed; }
    if (isdown==true){
      y += speed; }
    if (isleft==true){
      x -= speed; }
    if (isright==true){
      x += speed; }
    if (y<0 || y >600 || x<0 || x> 800){
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
    
    bullets.remove(this);
    
}