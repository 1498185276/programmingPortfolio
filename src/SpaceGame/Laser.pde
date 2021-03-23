class Laser{
  // member variables
  int x,y,speed,rad;
  color c;
  
  // constructor
  Laser(int x, int y){
    this.x = x;
    this.y = y;
    speed = 6;
    c = #B9504D;
    rad = 4;
  }
  
  // member methods
  void display(){
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(x,y,rad,rad*2);
  }
  
  void fire(){
    y-=speed;
  }
  
  boolean reachedTop(){
    if(y<-3){
      return true;
    } else {
      return false;
    }
  }
}
