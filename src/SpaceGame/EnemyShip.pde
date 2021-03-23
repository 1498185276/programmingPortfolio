class Enemy {
  int r, health, x, y, speed, healthStart;
  boolean right;
  int savedTime; 
  int totalTime;

  // constructor
  Enemy(int x, int y, int t, int health) {
    healthStart = health;
    r = 25;
    this.x = x;
    this.y = y;
    this.health = health;
    speed = 5;
    this.totalTime = t;
  }

  // member methods
  void display() {
    fill(#EBF29D);
    triangle(x, y, x-20, y+20, x+20, y+20);
    fill(#D1513D);
    circle(x, y+10, 8);
    textSize(10);
    textAlign(CENTER);
    text(health, x, y);
  }

  void move() {
    x += speed;
    if (x >= width|| x <= 0) {
      speed *= -1;
      y+=50;
    }
  }

  boolean laserIntersect(Laser laser) {
    // Calculate distance
    float distance = dist(x, y, laser.x, laser.y); 

    // Compare distance to sum of radii
    if (distance < r + laser.rad) { 
      return true;
    } else {
      return false;
    }
  }

  void start() {
    savedTime = millis();
  }


  boolean isFinished() { 
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
