class Button {
  // Member Variables
  int x, y, w, h;
  String val;
  color c1, c2;
  boolean hover;

  // Constructor
  Button(int tempX, int tempY, int tempW, int tempH, String tempVal, color c1, color c2) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    val = tempVal;
    this.c1 = c1;
    this.c2 = c2;
  }

  // Method for Display
  void display() {
    if (hover) {
        fill(c2);
      } else {
        fill(c1);
      }
      rect(x, y, w, h, 8);
      fill(0);
      textAlign(CENTER);
      textSize(16);
      text(val, x+w/2, y+h/2);
  }

  //Method for Mouse Interaction
  void hover() {
    hover = mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h;
  }
}
