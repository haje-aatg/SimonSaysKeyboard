ButtonOn turn = new ButtonOn();
ButtonOn[] simonArray;
boolean splahScreen = false, simonSays = true, memoryTest = false;

void setup() {
  size(333, 333);
  simonArray = new ButtonOn[60];
  for (int index = 0;index <simonArray.length; index++) {
    simonArray[index] = new ButtonOn((byte)floor(random(0,3.99999)));
  }
  printArray(simonArray[0]);
  //buttonOn[0] = true;
}

void draw() {
  background(255);
  if (simonSays) {
  }
  drawButton();
}

void drawButton() {
  if (turn.buttonOn[0]) {
    fill(0, 155, 0, 155);
    rect(0, 0, width/2, height/2);
  } else {
    fill(0, 155, 0);
    rect(0, 0, width/2, height/2);
  }

  if (turn.buttonOn[1]) {
    fill(155, 0, 0, 155);
    rect(width/2, 0, width/2, height/2);
  } else {
    fill(155, 0, 0);
    rect(width/2, 0, width/2, height/2);
  }
  if (turn.buttonOn[2]) {
    fill(155, 155, 0, 155);
    rect(0, height/2, width/2, height/2);
  } else {
    fill(155, 155, 0);
    rect(0, height/2, width/2, height/2);
  }
  if (turn.buttonOn[3]) {
    fill(0, 0, 155, 155);
    rect(width/2, height/2, width/2, height/2);
  } else {
    fill(0, 0, 155);
    rect(width/2, height/2, width/2, height/2);
  }
}
void keyReleased() {
  println(key);
  if (key >= '0' && key <= '3') {
    //println(byte(key));
    turn.ButtonSet(byte(key-48));
  }
}
