// SpaceGame | Dec 2020
// by Mingjing Huang
// TODO: Project Setup

import processing.sound.*;
SoundFile laser, explosion;
SpaceShip s1;
ArrayList<Laser> lasers;
ArrayList<Rock> rocks;
ArrayList<Star> stars;
ArrayList<Enemy> enemies;
ArrayList<EnemyLaser> elasers;
ArrayList<PowerUp> pUps;
Timer timer, puTimer, enemyTimer;
int score, pass, weaponCount, laserCount, enemyHealth;
boolean play;

void setup() {
  size(700, 700);
  laser = new SoundFile(this, "ATAT-SideGuns.wav");
  s1 = new SpaceShip();
  lasers = new ArrayList();
  rocks = new ArrayList();
  enemies = new ArrayList();
  stars = new ArrayList();
  elasers = new ArrayList();
  pUps = new ArrayList();
  timer = new Timer(int(random(500, 3000)));
  puTimer = new Timer(5000);
  enemyTimer = new Timer(5000);
  score = 0;
  weaponCount = 1;
  laserCount = 0;
  enemyHealth = 100;
  pass = 0;
  play = false;
  timer.start();
  puTimer.start();
}

void draw() {
  noCursor();
  if (!play) {
    startScreen();
  } else {
    background(0);

    stars.add(new Star(int(random(width)), int(random(height))));
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }

    if (enemyTimer.isFinished()) {
      enemies.add(new Enemy(0, 80, int(random(500, 1500)), enemyHealth));
      enemyTimer.start();
    }

    for (int i = 0; i<enemies.size(); i++) {
      Enemy enemy = enemies.get(i);
      enemy.move();
      enemy.display();
      // enemy and ship intersection
      if (s1.shipIntersect(enemy)) {
        s1.health-=10;
        score+=enemy.healthStart;
        enemies.remove(enemy);
      }
      if (enemy.isFinished()) {
        elasers.add(new EnemyLaser(enemy.x, enemy.y));
        enemy.start();
      }
    }
    
    for (int i = elasers.size()-1; i>=0; i--) {
      EnemyLaser elaser = (EnemyLaser) elasers.get(i);
      elaser.fire();
      elaser.display();
      // Enemy Laser vs. Ship
      if (s1.enemyLaserIntersect(elaser)) {
        s1.health-=elaser.power;
        elasers.remove(elaser);
      }
      if (elaser.reachedBottom()) {
        elasers.remove(elaser);
      }
    }

    if (timer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -50));
      timer.start();
    }

    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      // Rock vs Ship Collision
      if (s1.rockIntersection(rock)) {
        s1.health-=rock.health;
        rocks.remove(rock);
        score+=50;
      }
      if (rock.reachedBottom()) {
        pass++;
        rocks.remove(rock);
      }
    }

    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      laser.display();
      laser.fire();
      // Laser vs. Rock Intersection
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (rock.laserIntersection(laser)) {
          lasers.remove(laser);
          rock.health-=50;
          if (rock.health<1) {
            rocks.remove(rock);
            score+=rock.health;
          }
        }
      }
      for (int k = 0; k<enemies.size(); k++) {
        Enemy enemy = enemies.get(k);
        if (enemy.laserIntersect(laser)) {
          lasers.remove(laser);
          enemy.health-=20;
          if (enemy.health<1) {
            score+=enemy.healthStart;
            enemies.remove(enemy);
          }
        }
      }
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }

    // PowerUp Distribution
    if (puTimer.isFinished()) {
      pUps.add(new PowerUp(int(random(width)), -20));
      puTimer.start();
    }
    // PowerUp rendering and collision detection
    for (int i = 0; i<pUps.size(); i++) {
      PowerUp pu = pUps.get(i);
      pu.move();
      pu.display();
      // PowerUp and ship intersection
      if (s1.puIntersection(pu)) {
        // Apply PowerUp Effects
        if (pu.pu == 0) { // Adds ammo
          s1.ammo+=1000;
        } else if (pu.pu == 1) { //Adds health
          s1.health+=100;
        } else if (pu.pu == 2) { //Adds lasers
          weaponCount++;
        } 
        pUps.remove(pu);
      }
      // dispose of rocks at bottom
      if (pu.reachedBottom()) {
        pUps.remove(pu);
      }
    }

    s1.display(mouseX, mouseY);

    infoPanel();
    if (s1.health<1 || pass>10) {
      play = false;
      gameOver();
    }
  }
}

void mousePressed() {
  if (play) {
    laser.play();
  }

  if (s1.ammo > 0) {
    lasers.add(new Laser(s1.x, s1.y));
  }
  s1.ammo -- ;

  if (s1.ammo>0) {
    if (weaponCount == 1) {
      lasers.add(new Laser(s1.x, s1.y));
      laserCount++;
      s1.ammo--;
    } else if (weaponCount == 2) {
      lasers.add(new Laser(s1.x-20, s1.y));
      lasers.add(new Laser(s1.x+20, s1.y));
      laserCount++;
      s1.ammo-=2;
    } else if (weaponCount == 3) {
      lasers.add(new Laser(s1.x, s1.y));
      lasers.add(new Laser(s1.x-20, s1.y));
      lasers.add(new Laser(s1.x+20, s1.y));
      laserCount++;
      s1.ammo-=3;
    } else if (weaponCount == 4) {
      lasers.add(new Laser(s1.x-20, s1.y));
      lasers.add(new Laser(s1.x+20, s1.y));
      lasers.add(new Laser(s1.x-40, s1.y));
      lasers.add(new Laser(s1.x+40, s1.y));
      laserCount++;
      s1.ammo-=4;
    } else if (weaponCount == 5) {
      lasers.add(new Laser(s1.x, s1.y));
      lasers.add(new Laser(s1.x-20, s1.y));
      lasers.add(new Laser(s1.x+20, s1.y));
      lasers.add(new Laser(s1.x-40, s1.y));
      lasers.add(new Laser(s1.x+40, s1.y));
      laserCount++;
      s1.ammo-=5;
    } else if (weaponCount == 6) {
      lasers.add(new Laser(s1.x-20, s1.y));
      lasers.add(new Laser(s1.x+20, s1.y));
      lasers.add(new Laser(s1.x-40, s1.y));
      lasers.add(new Laser(s1.x+40, s1.y));
      lasers.add(new Laser(s1.x-60, s1.y));
      lasers.add(new Laser(s1.x+60, s1.y));
      laserCount++;
      s1.ammo-=6;
    } else if (weaponCount >= 7) {
      lasers.add(new Laser(s1.x, s1.y));
      lasers.add(new Laser(s1.x-20, s1.y));
      lasers.add(new Laser(s1.x+20, s1.y));
      lasers.add(new Laser(s1.x-40, s1.y));
      lasers.add(new Laser(s1.x+40, s1.y));
      lasers.add(new Laser(s1.x-60, s1.y));
      lasers.add(new Laser(s1.x+60, s1.y));
      laserCount++;
      s1.ammo-=7;
    }
  }
}

void startScreen() {
  background(0);
  textAlign(CENTER);
  text("Welcome!", width/2, height/2);
  text("Click to Continue...", width/2, height/2+20);
  if (mousePressed) {
    play = true;
  }
}

void infoPanel() {
  fill(128, 128);
  rectMode(CORNER);
  rect(0, height-50, width, 50);
  fill(255, 128);
  text("Health:" + s1.health, 50, height-20);
  text("Lives:" + s1.lives, 150, height-20);
  text("Pass:" + pass, 420, height-20);
  text("Ammo:" + s1.ammo, 220, height-20);
  text("Level:", 300, height-20);
  text("Score:" + score, 350, height-20);
}

void gameOver() {
  background(0);
  textAlign(CENTER);
  fill(222);
  text("Game Over!", width/2, height/2);
  text("Final Score:" + score, width/2, height/2+20);
  noLoop();
}
