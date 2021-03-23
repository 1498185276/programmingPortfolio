class Rock{
  // member variables
  int x,y,rad,health,speed;
  char displayMode;
  PImage rock;
  
  // constructor
  Rock(int x, int y){
    this.x = x;
    this.y = y;
    rad = 25;
    health = 25;
    speed = int(random(1,8));
    displayMode = '1';
    rock = loadImage("rock.png");
  }
  
  // Rock vs Laser Collision
  boolean laserIntersection(Laser laser){
    float distance = dist(x,y,laser.x,laser.y);
    if(distance < rad + laser.rad){
      return true;
    } else {
      return false;
    }
  }
  
  boolean reachedBottom(){
    if(y>height){
      return true;
    } else {
      return false;
    }
  }
  
  void move(){
    y += speed;
  }
  
  // member methods
  void display(){
    //ellipse(x,y,dia,dia);
    image(rock,x,y);
  }
  
  void collide(){
  
  }
}
