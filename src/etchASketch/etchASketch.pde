// Global Variable
int x,y;

void setup(){
  size(400,400);
  frameRate(10);
  x = 10;  
  y = 10;
}

void draw(){
  fill(0);
  strokeWeight(3);
  if(keyPressed){
    if(key == 'd' || key == 'D'){
      moveRight(8);
    } else if(key == 'a' || key == 'A'){
      moveLeft(8);
    } else if(key == 'w' || key == 'W'){
      moveUp(8);
    } else if(key == 's' || key == 'S'){
      moveDown(8);
    }
  }
  //drawName();
  //noLoop();
}

void mousePressed(){
  saveFrame("line-######.png");
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == RIGHT){
      moveRight(8);
    } else if(keyCode == LEFT){
      moveLeft(8);
    } else if(keyCode == UP){
      moveUp(8);
    } else if(keyCode == DOWN){
      moveDown(8);
    }
  }
}

void drawName(){
  //moveDown(150);
  //moveRightUp(40);
  //moveRightDown(40);
  //moveRightUp(40);
  //moveRightDown(40);
  //moveRight(10);
  //moveUp(40);
  //moveLeft(10);
  //moveRight(20);
  //moveLeft(10);
  //moveDown(40);
  //moveRight(30);
  //moveUp(40);
  //moveRightDown(40);
  //moveUp(40);
}

// Method to draw right lines
void moveRight(int rep){
  for(int i=0; i<rep; i=i+1){
    point(x+i,y);
  }
  x=x+rep;
}

// Method to draw lines down
void moveDown(int rep){
  for(int i=0; i<rep; i=i+1){
    point(x,y+i);
  }
  y=y+rep;
}

// Method to draw left lines
void moveLeft(int rep){
  for(int i=0; i<rep; i=i+1){
    point(x-i,y);
  }
  x=x-rep;
}

// Method to draw lines up
void moveUp(int rep){
  for(int i=0; i<rep; i=i+1){
    point(x,y-i);
  }
  y=y-rep;
}

// Method to draw left and down lines
void moveLeftDown(int rep){
  for(int i=0; i<rep; i=i+1){
    point(x-i,y+i);
  }
  x=x-rep;
  y=y+rep;
}

// Method to draw right and down lines
void moveRightDown(int rep){
  for(int i=0; i<rep; i=i+1){
    point(x+i,y+i);
  }
  x=x+rep;
  y=y+rep;
}

// Method to draw right and up lines
void moveRightUp(int rep){
  for(int i=0; i<rep; i=i+1){
    point(x+i,y-i);
  }
  x=x+rep;
  y=y-rep;
}

// Method to draw left and up lines
void moveLeftUp(int rep){
  for(int i=0; i<rep; i=i+1){
    point(x-i,y-i);
  }
  x=x-rep;
  y=y-rep;
}
