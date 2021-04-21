// Mingjing Huang | Computer Timeline
// Sept. 15, 2020
boolean hover = false;

void setup(){
  size(900,400);
}

void draw(){
  background(153,148,194);
  println(hover);
  drawRef();
  histEvent(100,200,115,25,"Model K (1937 US)","Model K is a relay-based calculator that became the first binary adder, devised by George Robert Stibbitz. It has two states of signals, the low (represented by 0) and high (represented by 1), but sometimes three valued logic is used especially in high-density memory.",true);
  histEvent(190,275,95,25,"ABC (1942 US)","The ABC stands for Atanasoff-Berry Computer. It is the first binary electronic digital calculating device developed by John Vincent Atanasoff and Clifford E. Berry. Its design was semi-electronic and used about 300 vacuum tubes.",false);
  histEvent(250,200,165,25,"Colossus Mark 1 (1943 UK)","Colossus Mark 1 was operationalized in December 1943. Its main developer is Tommy Flowers, with several other developers' assitance. It contained 1500 thermionic valves.",true);
  histEvent(350,275,160,25,"Harvard Mark 1 (1944 US)","Devised by Howard Aiken, Harvard Mark 1 was a general purpose electromechanical computer that was used in the war effort during the last part of WWII. The Mark I had 60 sets of 24 switches for manual data entry and coud store 72 numbers, each 23 decimal digits long.",false);
  histEvent(450,200,170,25,"Colossus Mark 2 (1944 UK)","Colossus Mark 2 was operationalized in June 1944. It is designed while Mark 1 was being constructed. Allen Coombs took over the leadership of the Colossus Mark 2 project when Tommy Flowers moved on to other projects. Mark 2 had 2400 valves and five processors in parallel; it's five times faster and simpler to operate than Mark 1.",true);
  histEvent(550,275,105,25,"ENIAC (1946 US)","Designed mainly by John Mauchly and J. Presper Ekert, ENIAC was the first electronic general-purpose digital computer. It was Turing-complete, and able to solve a large class of numerical problems through reprogramming. It had a speed that's one thousand times faster than that of electro-mechanical machines.",false);
  histEvent(660,200,170,25,"Manchester Baby (1948 UK)","Developed by Frederic C. Williams, Tom Kilburn, and Geoff Tootill, the Manchester Baby was the first electronic stored-program computer. It had a 32-bit word length and a memory of 32 words. It was designed to be the simplest possible store-program computer.",true);
  histEvent(720,275,112,25,"CSIRAC (1949 AU)","The CSIRAC was constructed by a team led by Trevor Pearcey and Maston Beard. It was Australia's first digital computer, and the fifth stored program computer in the world. It was the first in the world to play digital music.",false);
}

void drawRef(){
  // Title Text
  textSize(42);
  textAlign(CENTER);
  fill(255,255,0);
  text("Historic Computer System",width/2,65);
  
  // Timeline
  strokeWeight(5);
  stroke(0);
  line(100,250,800,250);
  
  textSize(12);
  fill(0);
  text("1936", 90, 245);
  text("1950", 810, 245);
  
  // Descriptive Text
  textSize(24);
  fill(121,37,117);
  text("Mingjing Huang | 2020", width/2,100);
}

void histEvent(int x, int y, int w, int h, String title, String description, boolean top){
  // Detect the location of the mouse
  hover = (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);
  
  // Draw a recangle
  strokeWeight(1);
  if(hover == true){
    fill(180);
  } else {
    fill(220);
  }
  stroke(0);
  rect(x,y,w,h,5);
  
  // Draw the title for the rectangle
  textSize(12);
  fill(4,54,84);
  textAlign(LEFT);
  text(title,x+5,y+20);
  if(hover == true){
    text(description,100,325,700,350);
  }
  
  // Draw the connecting line
  stroke(0);
  if(top == true){
    line(x+20,y+25,x+35,y+50);
  } else {
    line(x+20,y,x+35,y-25);
  }
  
}
