ButtonOn turn = new ButtonOn();
ButtonOn[] simonArray;
int score = 0;
boolean splashScreen = false, simonSays = true, memoryTest = false, keyP = false;
int frameDelay = 0;
int frameIndex = 0;

void setup() {
  size(333, 333);
  simonArray = new ButtonOn[60];
  for (int index = 0; index <simonArray.length; index++) {
    simonArray[index] = new ButtonOn((byte)floor(random(0, 3.99999)));
  }
  //printArray(simonArray);
  //buttonOn[0] = true;
  //frameDelay = frameCount;
  //println(frameDelay);
  textAlign(CENTER, CENTER);
  textSize(55);
}

void draw() {
  background(0);
  if (splashScreen) {
    fill(255);
    text("Last score:" + score, width/2, height/2);
  }
  if (simonSays) {
    if ((frameDelay > (frameCount-60)) && (frameDelay < frameCount) && frameIndex<=score+1) {
      turn = new ButtonOn();
    }
    //println(frameDelay + " : " + frameCount + " : " + frameIndex + " : " + score);
    if (frameDelay < frameCount-60 && frameIndex<=score+1) {
      println("Simon says rutine. Runde: " + frameIndex);
      turn = simonArray[frameIndex];
      println(turn.buttonOn[0] + " : " + turn.buttonOn[1] + " : " + turn.buttonOn[2] + " : " + turn.buttonOn[3]);
      frameDelay = frameCount+120;
      if (frameIndex==score+1) {
        frameIndex = 0;
        simonSays = false;
        memoryTest = true;
        turn = new ButtonOn();
        println("Memory test game: ");
      } else {
        frameIndex++;
      }
    }
  }
  if (memoryTest) {
    if (frameDelay < frameCount && frameIndex<=score) {
      //println("Memory test game: " + simonArray[frameIndex].buttonOn[0] + " : " + simonArray[frameIndex].buttonOn[1] + " : " + simonArray[frameIndex].buttonOn[2] + " : " + simonArray[frameIndex].buttonOn[3]);
      if (turn.buttonOn[0]==simonArray[frameIndex].buttonOn[0] &&
        turn.buttonOn[1]==simonArray[frameIndex].buttonOn[1] &&
        turn.buttonOn[2]==simonArray[frameIndex].buttonOn[2] &&
        turn.buttonOn[3]==simonArray[frameIndex].buttonOn[3]) {
        frameDelay = frameCount+60;
        if (frameIndex<score) {
          println("Correct");
          frameIndex++;
          println("Memory test game: " + simonArray[frameIndex].buttonOn[0] + " : " + simonArray[frameIndex].buttonOn[1] + " : " + simonArray[frameIndex].buttonOn[2] + " : " + simonArray[frameIndex].buttonOn[3]);
        } else {
          println("Ny Runde");
          frameIndex = 0;
          score++;
          simonSays = true;
          memoryTest = false;
        }
      } else if (keyP) {
        splashScreen = true;
        simonSays = false;
        memoryTest = false;
      }
    }
  }
  if (simonSays || memoryTest) {
    drawButton();
    drawScore();
    drawMode();
  }
}
void drawMode() {
  fill(0);
  rect(0, 0, width, 66);
  fill(255);
  if (simonSays) {
    text("Simon says", width/2, 33);
  } else if (memoryTest) {
    text("Your turn", width/2, 33);
  }
}
void drawScore() {
  fill(0);
  rect(width/2-50, height/2-50, 100, 100);
  fill(255);
  text(score, width/2, height/2);
}
void drawButton() {
  if (turn.buttonOn[0]) {
    fill(0, 155, 0, 255);
    rect(0, 0, width/2, height/2);
    fill(255);
    text("T", width/4, height/4);
  } else {
    fill(0, 155, 0, 155);
    rect(0, 0, width/2, height/2);
  }
  if (turn.buttonOn[1]) {
    fill(155, 0, 0, 255);
    rect(width/2, 0, width/2, height/2);
    fill(255);
    text("T", width/2+width/4, height/4);
  } else {
    fill(155, 0, 0, 155);
    rect(width/2, 0, width/2, height/2);
  }
  if (turn.buttonOn[2]) {
    fill(155, 155, 0, 255);
    rect(0, height/2, width/2, height/2);
    fill(255);
    text("T", width/4, height/2+height/4);
  } else {
    fill(155, 155, 0, 155);
    rect(0, height/2, width/2, height/2);
  }
  if (turn.buttonOn[3]) {
    fill(0, 0, 155, 255);
    rect(width/2, height/2, width/2, height/2);
    fill(255);
    text("T", width/2+width/4, height/2+height/4);
  } else {
    fill(0, 0, 155, 155);
    rect(width/2, height/2, width/2, height/2);
  }
}
void keyPressed() {
  //println(key + " on");
  keyP = true;
  frameDelay = frameCount+10;
  if (key >= '0' && key <= '3') {
    //println(byte(key));
    turn.ButtonSetOn(byte(key-48));
  }
}
void keyReleased() {
  //println(key + " off");
  keyP = false;
  if (key >= '0' && key <= '3') {
    //println(byte(key));
    turn.ButtonsSetOff();
  }
}
