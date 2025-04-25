class ButtonOn {
  boolean[] buttonOn = {false, false, false, false};//new boolean[4];//

  ButtonOn() {
  }
  ButtonOn(byte OnKnap) {
    if (OnKnap >=0 && OnKnap <=3) {
      buttonOn[OnKnap] = true;
    }
  }
  void ButtonSet(byte OnKnap) {
    if (OnKnap >=0 && OnKnap <=3) {
      buttonOn[OnKnap] = !buttonOn[OnKnap];
    }
  }
  void ButtonSetOn(byte OnKnap) {
    if (OnKnap >=0 && OnKnap <=3) {
      for (int index = 0; index < buttonOn.length; index++) {
        buttonOn[index] = (index == OnKnap)?true : false;
        /*if (index == OnKnap) {\\Same kode skrevet på en anden måde
         buttonOn[index] = true;
         } else {
         buttonOn[index] = false;
         }*/
      }
    }
  }
  void ButtonsSetOff() {
    for (int index = 0; index < buttonOn.length; index++) {
      buttonOn[index] = false;
    }
  }
}
