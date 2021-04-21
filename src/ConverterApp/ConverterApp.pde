void setup(){
  size(400,400);
}

void draw(){
  background(128);
  // Vertical Rendering Style 2 (bottom to top)
  line(100,0,100,height);
  for(int i = height; i > 0; i -= 20){
    line(96,i,104,i);
    textSize(8);
    text(i,78,height-i);
  }
  rect(100,mouseY,15,height-mouseY);
  text("Cel:" + convertToCel(height-mouseY),125,mouseY);
  
  //// Vertical Rendering Style 1
  //line(100,0,100,height);
  //for(int i = 0; i < height; i += 20){
  //  line(96,i,104,i);
  //  textSize(8);
  //  text(i,78,i+3);
  //}
  //rect(100,0,15,mouseY);
  //text("Cel:" + convertToCel(mouseY),125,mouseY);
  
  //// Horizontal Rendering
  //line(0,100,width,100);
  //for(int i = 0; i < width; i += 20){
  //  line(i,96,i,104);
  //  textSize(8);
  //  textAlign(CENTER);
  //  text(i,i,94);
  //}
  //ellipse(mouseX,100,5,5);
  //text("Cel:" + convertToCel(mouseX),mouseX,115);
  
  println("20 degrees converted to Cel:" + convertToCel(20.0));
  println("20 degrees converted to Far:" + convertToFar(20.0));
}

float convertToCel(float val){
  val = (val - 32) * (5.0/9.0);
  return val;
}

float convertToFar(float val){
  val = ((9.0/5.0) * val) + 32;
  return val;
}
