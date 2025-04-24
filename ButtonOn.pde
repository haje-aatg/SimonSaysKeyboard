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
}
