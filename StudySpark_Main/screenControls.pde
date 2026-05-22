void screenControls(){
  
  if (prevScreen != screen){ //If the screen has changed
    int i = 1;
    
    for (GWindow w : screens){ //Hide or show screens depending on which one the user is currently on
      if (i == screen){
        w.setVisible(true);
      }
      else{
        w.setVisible(false);
      }
      i++;
    }
    
    updateDeckDropdowns();
    prevScreen = screen;
  }
  
  //For updating the location of each window if the user drags the window around
  currScreen = screens[screen-1];
  currScreen.getPosition(currLocation);
  currX = int(currLocation.x);
  currY = int(currLocation.y);
  
  if (currLocation.x != lastLocation.x || currLocation.y != lastLocation.y){ //only update if the location of the window has changed
    for (GWindow w : screens){
      if (w != currScreen){ //Update locations of all windows
        w.setLocation(currX, currY);
      }
    }
    surface.setLocation(currX, currY); //for main sketch menu
    lastLocation = currLocation.copy();
  }
  
}

void resetScreens(){

  for (GWindow w : screens){
    if (w != menu_win){ //If the window is not the menu, hide it
      w.setVisible(false);
    }
    else{
      w.setVisible(true);
      updateDeckDropdowns();
    }
  }
  
  //hiding GUI that differs between each creation tab (they share a window)
  CardAnswerText.setVisible(false);
  CorrAns.setVisible(false);
  CorrAnsLabel.setVisible(false);
  QuizAnswer1.setVisible(false);
  QuizAnswer2.setVisible(false);
  QuizAnswer3.setVisible(false);
  QuizAnswer4.setVisible(false);
}
