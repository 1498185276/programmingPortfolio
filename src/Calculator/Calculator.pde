////2020 Calculator for Programming I////
//// Mingjing Huang | Nov 2020 ////

//Globals
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0";
String op;
boolean left;
float l,r,result;
int currentNum;

void setup(){
  size(340,440);
  op = "";
  left = true;
  l = 0.0;
  r = 0.0;
  result = 0.0;
  currentNum = 0;
  numButtons[0] = new Button(80,380,80,60,"0",#C1F5D6,#9EE0B9);
  numButtons[1] = new Button(0,200,80,60,"1",#C1F5D6,#9EE0B9);
  numButtons[2] = new Button(80,200,80,60,"2",#C1F5D6,#9EE0B9);
  numButtons[3] = new Button(160,200,80,60,"3",#C1F5D6,#9EE0B9);
  numButtons[4] = new Button(0,260,80,60,"4",#C1F5D6,#9EE0B9);
  numButtons[5] = new Button(80,260,80,60,"5",#C1F5D6,#9EE0B9);
  numButtons[6] = new Button(160,260,80,60,"6",#C1F5D6,#9EE0B9);
  numButtons[7] = new Button(0,320,80,60,"7",#C1F5D6,#9EE0B9);
  numButtons[8] = new Button(80,320,80,60,"8",#C1F5D6,#9EE0B9);
  numButtons[9] = new Button(160,320,80,60,"9",#C1F5D6,#9EE0B9);
  opButtons[0] = new Button(0,140,240,60,"CLEAR",#75C179,#5CA260);
  opButtons[1] = new Button(0,380,80,60,"±",#9871C1,#74519B);
  opButtons[2] = new Button(160,380,80,60,".",#9871C1,#74519B);
  opButtons[3] = new Button(240,380,100,60,"=",#357EE3,#1F64C1);
  opButtons[4] = new Button(240,320,100,60,"÷",#D2B8D6,#B292B7);
  opButtons[5] = new Button(240,260,100,60,"x",#D2B8D6,#B292B7);
  opButtons[6] = new Button(240,200,100,60,"-",#D2B8D6,#B292B7);
  opButtons[7] = new Button(240,140,100,60,"+",#D2B8D6,#B292B7);
  opButtons[8] = new Button(0,80,80,60,"tan",#66E0B4,#55C99F);
  opButtons[9] = new Button(80,80,80,60,"cos",#66E0B4,#55C99F);
  opButtons[10] = new Button(160,80,80,60,"sin",#66E0B4,#55C99F);
  opButtons[11] = new Button(240,80,100,60,"x²",#66E0B4,#55C99F);
  
}

void draw(){
  background(200);
  for(int i=0; i<numButtons.length; i++){
    numButtons[i].display();
    numButtons[i].hover();
  }
  for(int i=0; i<opButtons.length; i++){
    opButtons[i].display();
    opButtons[i].hover();
  }
  updateDisplay();
}

void mouseReleased(){
  for(int i=0; i<numButtons.length; i++){
    if(numButtons[i].hover && dVal.length() < 30){
      handleEvent(numButtons[i].val,true);
    }
  }
  for(int i=0; i<opButtons.length; i++){
    if(opButtons[i].hover){
      handleEvent(opButtons[i].val,false);
    }
  }
  println("L:" + l + " R:" + r + " Op:" + op);
  println("Result:" + result + " Left:" + left);
}

void updateDisplay(){
  fill(#F5F4F2);
  rect(0,0,340,80);
  fill(0);
  textAlign(RIGHT);
  if (dVal.length()<13) {
    textSize(32);
  } else if (dVal.length()<16) {
    textSize(28);
  } else if (dVal.length()<18) {
    textSize(26);
  } else if (dVal.length()<20) {
    textSize(24);
  } else if (dVal.length()<22) {
    textSize(22);
  } else if (dVal.length()<24) {
    textSize(20);
  } else if (dVal.length()<26) {
    textSize(18);
  } else if (dVal.length()<28) {
    textSize(16);
  } else {
    textSize(14);
  }
  text(dVal,300,50);
}

void keyPressed(){
  println("key:" + key + "keyCode:" + keyCode);
  if(key == '0'){
    handleEvent("0",true);
  } else if(key == '1'){
    handleEvent("1",true);
  } else if(key == '2'){
    handleEvent("2",true);
  } else if(key == '3'){
    handleEvent("3",true);
  } else if(key == '4'){
    handleEvent("4",true);
  } else if(key == '5'){
    handleEvent("5",true);
  } else if(key == '6'){
    handleEvent("6",true);
  } else if(key == '7'){
    handleEvent("7",true);
  } else if(key == '8'){
    handleEvent("8",true);
  } else if(key == '9'){
    handleEvent("9",true);
  } else if(key == '+'){
    handleEvent("+",false);
  } else if(key == '-'){
    handleEvent("-",false);
  } else if(key == 'x'){
    handleEvent("x",false);
  } else if(key == '÷'){
    handleEvent("÷",false);
  } else if (key == 'C') {
    handleEvent("CLEAR", false);
  } else if (key == 10) { //(key == CODED) {
    if (keyCode == ENTER || keyCode == RETURN) {
      handleEvent("=", false);
    }
  } else if(keyCode == 27)  {
    key = 0;
    if (key == 0) {
      handleEvent("CLEAR", false);
    }
  }
}

String handleEvent(String val, boolean num){
  if(left && num){
    if(dVal.equals("0") || result == l){
          dVal = (val);
          l = float(dVal);
        } else {
          dVal += val;
          l = float(dVal);
        }
  } else if (!left && num){
    if(dVal.equals("0") || result == l){
          dVal = (val);
          r = float(dVal);
        } else {
          dVal += val;
          r = float(dVal);
        }
  } else if (val.equals("CLEAR")){  //clear button
    dVal = "0";
    op = "";
    left = true;
    l = 0.0;
    r = 0.0;
    result = 0.0;
  } else if (val.equals("+")){
    if (!left){
      performCalc();
    } else {
      op = "+";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("-")){
    if (!left){
      performCalc();
    } else {
      op = "-";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("x")){
    if (!left){
      performCalc();
    } else {
      op = "x";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("÷")){
    if (!left){
      performCalc();
    } else {
      op = "÷";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("=")){
    performCalc();
  } else if (val.equals("±")) {
    if (left) {
      l *= -1;
      dVal = str(l);
    } else {
      r *= -1;
      dVal = str(r);
    }
  } else if (val.equals("x²")) {
    if (left) {
      l = sq(l);
      dVal = str(l);
    } else {
      r = sq(r);
      dVal = str(r);
    }
  } else if (val.equals("sin")) {
    if (left) {
      l = sin(radians(l));
      dVal = str(l);
    } else {
      r = sin(radians(r));
      dVal = str(r);
    }
  } else if (val.equals("cos")) {
    if (left) {
      l = cos(radians(l));
      dVal = str(l);
    } else {
      r = cos(radians(r));
      dVal = str(r);
    }
  } else if (val.equals(".") && !dVal.contains(".")) {
    dVal += (val);
  } else if (val.equals("tan")) {
    if (left) {
      l = tan(radians(l));
      dVal = str(l);
    } else {
      r = tan(radians(r));
      dVal = str(r);
    }
  }
  return val;
}

void performCalc(){
  if(op.equals("+")){
    result = l + r;
  } else if(op.equals("-")){
    result = l - r;
  } else if(op.equals("x")){
    result = l * r;
  } else if(op.equals("÷")){
    result = l / r;
  }
  l = result;
  dVal = str(result);
  left = true;
}

// To do different color for function keys, use multiple if statement to assign color to each type.
