void screenControls(){
  
  if (prevScreen != screen){
    if (screen == 1){
      menu_win.setVisible(true);
    }
    else{
      menu_win.setVisible(false);
    }
    
    if (screen == 2){
      updateDropdowns();
      preFlash_win.setVisible(true);
    }
    else{
      preFlash_win.setVisible(false);
    }
    
    if (screen == 3){
      flash_win.setVisible(true);
    }
    else{
      flash_win.setVisible(false);
    }
    
    if (screen == 4){
      updateDropdowns();
      preQuiz_win.setVisible(true);
    }
    else{
      preQuiz_win.setVisible(false);
    }
    
    if (screen == 5){
      quiz_win.setVisible(true);
    }
    else{
      quiz_win.setVisible(false);
    }
    
    if (screen == 6){
      postQuiz_win.setVisible(true);
    }
    else{
      postQuiz_win.setVisible(false);
    }
   
    if (screen == 7){
      preCreate_win.setVisible(true);
    }
    else{
      preCreate_win.setVisible(false);
    }
    
    if (screen == 8){
      create_win.setVisible(true);
    }
    else{
      create_win.setVisible(false);
    }
    
    prevScreen = screen;
  }
  
}

void resetScreens(){
  menu_win.setVisible(true);
  preFlash_win.setVisible(false);
  flash_win.setVisible(false);
  preQuiz_win.setVisible(false);
  quiz_win.setVisible(false);
  postQuiz_win.setVisible(false);
  preCreate_win.setVisible(false);
  create_win.setVisible(false);
}
