class SpaceShip {
  // member variables
  int x, y, health, ammo, lives, rad;
  char displayMode;
  PImage spaceship;

  // constructor
  SpaceShip() {
    x = 0;
    y = 0;
    health = 100;
    ammo = 1000;
    lives = 3;
    displayMode = '1';
    spaceship = loadImage("spaceship.png");
    rad = 25;
  }

  // member methods
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    image(spaceship, x, y);
  }

  // Rock vs Ship Collision
  boolean rockIntersection(Rock rock) {
    float distance = dist(x, y, rock.x, rock.y);
    if (distance < rad + rock.rad) {
      return true;
    } else {
      return false;
    }
  }

  boolean puIntersection(PowerUp pu) {
    // Calculate distance
    float distance = dist(x, y, pu.x, pu.y); 

    // Compare distance to sum of radii
    if (distance < rad + pu.r) { 
      return true;
    } else {
      return false;
    }
  }

  boolean shipIntersect(Enemy enemy) {
    // Calculate distance
    float distance = dist(x, y, enemy.x, enemy.y); 

    // Compare distance to sum of radii
    if (distance < rad + enemy.r) { 
      return true;
    } else {
      return false;
    }
  }

  boolean enemyLaserIntersect(EnemyLaser elaser) {
  // Calculate distance
    float distance = dist(x, y, elaser.x, elaser.y); 

  // Compare distance to sum of radii
    if (distance < rad + elaser.r) { 
      return true;
    } else {
      return false;
    }
  }
}
