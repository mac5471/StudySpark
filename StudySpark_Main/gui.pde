/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void menu_win_draw(PApplet appc, GWinData data) { //_CODE_:menu_win:336987:
  appc.background(backgroundCol);
  if (logo != null){
    appc.imageMode(CENTER);
    appc.image(logo, width/2, height/3.6, 541, 185);
  }
} //_CODE_:menu_win:336987:

public void menu_flash_clicked(GButton source, GEvent event) { //_CODE_:menu_flash:202775:
  screen = 2;
} //_CODE_:menu_flash:202775:

public void menu_quiz_clicked(GButton source, GEvent event) { //_CODE_:menu_quiz:424307:
  screen = 4;
} //_CODE_:menu_quiz:424307:

public void menu_create_clicked(GButton source, GEvent event) { //_CODE_:menu_create:825439:
  screen = 7;
} //_CODE_:menu_create:825439:

synchronized public void preFlash_win_draw(PApplet appc, GWinData data) { //_CODE_:preFlash_win:456238:
  appc.background(backgroundCol);
  if (flashIcon != null){
    appc.imageMode(CENTER);
    appc.image(flashIcon, width/2, height/3.5, 100, 100);
  }
} //_CODE_:preFlash_win:456238:

public void preFlash_confirm_clicked(GButton source, GEvent event) { //_CODE_:preFlash_confirm:832969:
  String temp = preFlash_selectPack.getSelectedText();
  loadDeck(temp);
  screen = 3;
} //_CODE_:preFlash_confirm:832969:

public void preFlash_back_clicked(GButton source, GEvent event) { //_CODE_:preFlash_back:924234:
  screen = 1;
} //_CODE_:preFlash_back:924234:

public void preFlash_selectPack_changed(GDropList source, GEvent event) { //_CODE_:preFlash_selectPack:298132:
} //_CODE_:preFlash_selectPack:298132:

public void preFlash_random_clicked(GCheckbox source, GEvent event) { //_CODE_:preFlash_random:927307:
  if (preFlash_random.isSelected()){
    Set = false;
    print(Set);
  }
  else{
    Set = true;
    print(Set);
  }
} //_CODE_:preFlash_random:927307:

synchronized public void flash_win_draw(PApplet appc, GWinData data) { //_CODE_:flash_win:506712:
  appc.background(backgroundCol);
  if (currDeck != null) { //if there is a deck to be drawn, draw it
  currDeck.drawCard();}

} //_CODE_:flash_win:506712:

synchronized public void flash_keyPressed(PApplet appc, GWinData data, KeyEvent kevent) { //_CODE_:flash_win:858458:
  if (frameCount - lastPressed > 20){ //Buffer time for key presses
    lastPressed = frameCount;
    if (appc.keyCode == LEFT){
      prevCard();
    }
    else if (appc.keyCode == RIGHT){
      nextCard();
    }
    else if (appc.key == ' '){
      currDeck.flipCard();
    }
    else if (appc.key == 's'){
      currDeck.starCard();
    }
  }
} //_CODE_:flash_win:636991:

public void flash_prevCard_clicked(GButton source, GEvent event) { //_CODE_:flash_prevCard:489971:
  prevCard();
} //_CODE_:flash_prevCard:489971:

public void flash_nextCardClicked(GButton source, GEvent event) { //_CODE_:flash_nextCard:861148:
  nextCard();
} //_CODE_:flash_nextCard:861148:

public void flash_flipCard_clicked(GButton source, GEvent event) { //_CODE_:flash_flipCard:517353:
  currDeck.flipCard();
} //_CODE_:flash_flipCard:517353:

public void flash_menu_clicked(GButton source, GEvent event) { //_CODE_:flash_menu:640215:
  screen = 1;
} //_CODE_:flash_menu:640215:

public void flash_star_clicked(GButton source, GEvent event) { //_CODE_:flash_star:650691:
  currDeck.starCard();
} //_CODE_:flash_star:650691:

public void flash_selectCard_clicked(GDropList source, GEvent event) { //_CODE_:flash_selectCard:378885:
  currDeck.displayedIndex = Order[int(flash_selectCard.getSelectedText().substring(0, 1)) - 1];
  currDeck.switchCard(currDeck.displayedIndex);
} //_CODE_:flash_selectCard:378885:

synchronized public void preQuiz_win_draw(PApplet appc, GWinData data) { //_CODE_:preQuiz_win:535086:
  appc.background(backgroundCol);
  if (quizIcon != null){
    appc.imageMode(CENTER);
    appc.image(quizIcon, width/2, height/3.5, 100, 100);
  }
} //_CODE_:preQuiz_win:535086:

public void preQuiz_back_clicked(GButton source, GEvent event) { //_CODE_:preQuiz_back:336593:
  screen = 1;
} //_CODE_:preQuiz_back:336593:

public void preQuiz_confirm_clicked(GButton source, GEvent event) { //_CODE_:preQuiz_confirm:206394:
  String temp = preQuiz_selectPack.getSelectedText();
  loadQuizData(temp); 
  if (activeQuiz != null){ // basically means make sure a quiz object actually exists in memory before we try to use it
    
    for (int i = activeQuiz.questions.size() - 1; i > 0; i--) {
      int index = int(random(i + 1));
      QuizQuestion tempQ = activeQuiz.questions.get(index);
      activeQuiz.questions.set(index, activeQuiz.questions.get(i));
      activeQuiz.questions.set(i, tempQ);
    }
    
    if (activeQuiz.questions.size() > 0) {
      activeQuiz.currentQ = activeQuiz.questions.get(0);
    }
    
    screen = 5;
  }
} //_CODE_:preQuiz_confirm:206394:

public void preQuiz_selectPack_changed(GDropList source, GEvent event) { //_CODE_:preQuiz_selectPack:840257:
  println("preQuiz_selectPack - GDropList >> GEvent." + event + " @ " + millis());
} //_CODE_:preQuiz_selectPack:840257:

public void preQuiz_random_clicked(GCheckbox source, GEvent event) { //_CODE_:preQuiz_random:534914:
  println("preQuiz_random - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:preQuiz_random:534914:

synchronized public void quiz_win_draw(PApplet appc, GWinData data) { //_CODE_:quiz_win:934516:
  appc.background(backgroundCol);
    if (activeQuiz != null) {
    if (!activeQuiz.isFinished) {
      QuizQuestion q = activeQuiz.currentQ;
      
      appc.fill(83, 54, 40);
      appc.textAlign(CENTER);
      appc.textSize(24);
      appc.text(q.questionText, width/2, 120);
      
      appc.textAlign(LEFT);
      appc.textSize(24);
      appc.text(q.options[0], 225, 220);
      appc.text(q.options[1], 225, 280);
      appc.text(q.options[2], 225, 340);
      appc.text(q.options[3], 225, 400);
      // added score
      //appc.textAlign(RIGHT);
      //appc.text("Score: " + activeQuiz.score + "/" + activeQuiz.questions.size(), width-20, 45);
    } else if (screen == 5) {
      screen = 6;
    }
  }
} //_CODE_:quiz_win:934516:

public void quiz_menu_clicked(GButton source, GEvent event) { //_CODE_:quiz_menu:254678:
  screen = 1;
} //_CODE_:quiz_menu:254678:

public void quiz_A_clicked(GButton source, GEvent event) { //_CODE_:quiz_A:662074:
  if (activeQuiz != null && !activeQuiz.isFinished) activeQuiz.checkAnswer(0); 
} //_CODE_:quiz_A:662074:

public void quiz_B_clicked(GButton source, GEvent event) { //_CODE_:quiz_B:953221:
  if (activeQuiz != null && !activeQuiz.isFinished) activeQuiz.checkAnswer(1); 
} //_CODE_:quiz_B:953221:

public void quiz_C_clicked(GButton source, GEvent event) { //_CODE_:quiz_C:357915:
  if (activeQuiz != null && !activeQuiz.isFinished) activeQuiz.checkAnswer(2); 
} //_CODE_:quiz_C:357915:

public void quiz_D_clicked(GButton source, GEvent event) { //_CODE_:quiz_D:670787:
  if (activeQuiz != null && !activeQuiz.isFinished) activeQuiz.checkAnswer(3); 
} //_CODE_:quiz_D:670787:

synchronized public void postQuiz_win_draw(PApplet appc, GWinData data) { //_CODE_:postQuiz_win:586133:
  appc.background(backgroundCol);
  appc.textAlign(CENTER);
  appc.textSize(24);
  appc.fill(0);
  //appc.text("Quiz Finished!", width/2, height/2);
  if (activeQuiz != null){
    appc.text("Score: " + activeQuiz.score + "/" + activeQuiz.questions.size(), 400, 120);
  }
} //_CODE_:postQuiz_win:586133:

public void postQuiz_menu_clicked(GButton source, GEvent event) { //_CODE_:postQuiz_menu:715899:
  screen = 1;
} //_CODE_:postQuiz_menu:715899:

public void postQuiz_retry_clicked(GButton source, GEvent event) { //_CODE_:postQuiz_retry:994259:
  String quiz = activeQuiz.title;
  resetProgram();
  screen = 5;
  loadQuizData(quiz);
} //_CODE_:postQuiz_retry:994259:

public void postQuiz_incorrect_changed(GDropList source, GEvent event) { //_CODE_:postQuiz_incorrect:929439:
  updateIncorrect();
} //_CODE_:postQuiz_incorrect:929439:

synchronized public void preCreate_win_draw(PApplet appc, GWinData data) { //_CODE_:preCreate_win:489050:
  appc.background(backgroundCol);
  if (flashIcon != null && quizIcon != null){
    appc.imageMode(CENTER);
    appc.image(flashIcon, 240, 230, 80, 80);
    appc.image(quizIcon, 245, 320, 80, 80);
  }
} //_CODE_:preCreate_win:489050:

public void preCreate_name_changed(GTextField source, GEvent event) { //_CODE_:preCreate_name:611747:
} //_CODE_:preCreate_name:611747:

public void preCreate_deck_clicked(GButton source, GEvent event) { //_CODE_:preCreate_deck:390849:
 screen = 8;
 Content = new ArrayList();
 Title = preCreate_name.getText();
 Current = 0;
  
 String[] temp = {"", ""};
 Content.add(temp);
 
 CardAnswerText.setVisible(true);
 QuestionText.setVisible(true);
 NewButton.setVisible(true);
 Export.setVisible(true);
 PrevButton.setVisible(true);
 NextButton.setVisible(true);
 DeleteButton.setVisible(true);
 UpdateButton.setVisible(true);
  
 Card = true;
} //_CODE_:preCreate_deck:390849:

public void preCreate_quiz_clicked(GButton source, GEvent event) { //_CODE_:preCreate_quiz:707934:
  screen = 8;
  Content = new ArrayList();
  Title = preCreate_name.getText();
  Current = 0;
  
  String[] temp = {"","","","","","1"};
  Content.add(temp);
  
  CardAnswerText.setVisible(false);
  NewButton.setVisible(true);
  Export.setVisible(true);
  PrevButton.setVisible(true);
  NextButton.setVisible(true);
  DeleteButton.setVisible(true);
  UpdateButton.setVisible(true);
  
  QuestionText.setVisible(true);
  CorrAns.setVisible(true);
  CorrAnsLabel.setVisible(true);
  QuizAnswer1.setVisible(true);
  QuizAnswer2.setVisible(true);
  QuizAnswer3.setVisible(true);
  QuizAnswer4.setVisible(true);
  
  Card = false;
} //_CODE_:preCreate_quiz:707934:

public void preCreate_back_clicked(GButton source, GEvent event) { //_CODE_:preCreate_back:670630:
  screen = 1;
} //_CODE_:preCreate_back:670630:

synchronized public void create_win_draw(PApplet appc, GWinData data) { //_CODE_:create_win:668682:
  appc.background(backgroundCol);
  if(Content != null) {
    textSize(30);
    fill(255);
    String Count = str(Current + 1) + "/" + str(Content.size());
    text(Count, 10, 380);
  }
} //_CODE_:create_win:668682:

public void create_menu_clicked(GButton source, GEvent event) { //_CODE_:create_menu:273282:
  screen = 1;
} //_CODE_:create_menu:273282:

public void textarea1_change1(GTextArea source, GEvent event) { //_CODE_:QuestionText:831268:
} //_CODE_:QuestionText:831268:

public void textarea2_change1(GTextArea source, GEvent event) { //_CODE_:CardAnswerText:480723:
} //_CODE_:CardAnswerText:480723:

public void ExportContent(GButton source, GEvent event) { //_CODE_:Export:388574:
  exporter = createWriter("decks/"+ Title + ".txt"); //if you plan on changing the export folder, change "data" to the export folder's name.
  
  if(Card) {
  
    exporter.println("D");
  
    for(int i = 0; i < Content.size(); i++) {
      exporter.println(Content.get(i)[0]);
      exporter.println(Content.get(i)[1]); 
  }
  }
  
  else {
    exporter.println("Q");
    
    for(int i = 0; i < Content.size(); i++) {
      
      String[] temp = Content.get(i);
      
      int Correct = int(temp[5]);
      String temp2 = temp[1];
    
      Content.get(i)[1] = temp[Correct];
      Content.get(i)[Correct] = temp2;
      
      if(! temp[0].equals(" ")) { //ask Sathvik about this later -- should blank answers be permitted?
       if(! temp[1].equals(" ")) { //prevents questions w/o correct answer from being added.
        exporter.println(temp[0]);
        exporter.println(temp[1]);
        exporter.println(temp[2]);
        exporter.println(temp[3]);
        exporter.println(temp[4]);
       }
    }
    
  }
  }
  
  exporter.flush();
  exporter.close();
  //resetProgram();
  screen = 8;
} //_CODE_:Export:388574:

public void Previous(GButton source, GEvent event) { //_CODE_:PrevButton:666614:
  if(Current > 0) {
    Current --;
    resetText();
  }
} //_CODE_:PrevButton:666614:

public void Next(GButton source, GEvent event) { //_CODE_:NextButton:908041:
  if(Current < Content.size() - 1) {
    Current ++;
    resetText();
  }
} //_CODE_:NextButton:908041:

public void Update(GButton source, GEvent event) { //_CODE_:UpdateButton:994854:
  if(Card) {
  Content.get(Current)[0] = QuestionText.getText();
  Content.get(Current)[1] = CardAnswerText.getText();}
  
  else {
    Content.get(Current)[0] = QuestionText.getText();
    print(Content.get(Current)[0]);
    Content.get(Current)[1] = QuizAnswer1.getText();
    Content.get(Current)[2] = QuizAnswer2.getText();
    Content.get(Current)[3] = QuizAnswer3.getText();
    Content.get(Current)[4] = QuizAnswer4.getText();
    Content.get(Current)[5] = str(CorrAns.getSelectedIndex() + 1);
   }
} //_CODE_:UpdateButton:994854:

public void New(GButton source, GEvent event) { //_CODE_:NewButton:814028:
 String[] temp;
 if(Card) {temp = new String[2]; temp[0] = ""; temp[1] = "";}
 else {temp = new String[6]; temp[0] = ""; temp[1] = ""; temp[2] = ""; temp[3] = ""; temp[4] = ""; temp[5] = "1";}
 Content.add(temp);
 Current ++;
 resetText();
} //_CODE_:NewButton:814028:

public void Delete(GButton source, GEvent event) { //_CODE_:DeleteButton:881527:
 if(Content.size() > 1) {
  Content.remove(Content.get(Current));
  
  if(Current == Content.size()) {
  Current --;}
  }
  
  else {
  Content.get(0)[0] = "";
  Content.get(0)[1] = "";
  }
  
 resetText();
} //_CODE_:DeleteButton:881527:

public void Answer1Text(GTextField source, GEvent event) { //_CODE_:QuizAnswer1:956421:

} //_CODE_:QuizAnswer1:956421:

public void Answer3Text(GTextField source, GEvent event) { //_CODE_:QuizAnswer3:622762:

} //_CODE_:QuizAnswer3:622762:

public void Answer2Text(GTextField source, GEvent event) { //_CODE_:QuizAnswer2:223121:

} //_CODE_:QuizAnswer2:223121:

public void Answer4Text(GTextField source, GEvent event) { //_CODE_:QuizAnswer4:550817:

} //_CODE_:QuizAnswer4:550817:

public void dropList1_click1(GDropList source, GEvent event) { //_CODE_:CorrAns:937843:

} //_CODE_:CorrAns:937843:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.ORANGE_SCHEME);
  G4P.setMouseOverEnabled(false);
  G4P.setDisplayFont("Microsoft Sans Serif", G4P.PLAIN, 22);
  G4P.setInputFont("Microsoft Sans Serif", G4P.PLAIN, 14);
  G4P.setSliderFont("Arial", G4P.PLAIN, 11);
  surface.setTitle("Sketch Window");
  menu_win = GWindow.getWindow(this, "StudySpark", 0, 0, 800, 500, JAVA2D);
  menu_win.noLoop();
  menu_win.setActionOnClose(G4P.EXIT_APP);
  menu_win.addDrawHandler(this, "menu_win_draw");
  menu_flash = new GButton(menu_win, 270, 230, 270, 40);
  menu_flash.setText("Flashcards");
  menu_flash.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  menu_flash.addEventHandler(this, "menu_flash_clicked");
  menu_quiz = new GButton(menu_win, 270, 290, 270, 40);
  menu_quiz.setText("Quizzes");
  menu_quiz.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  menu_quiz.addEventHandler(this, "menu_quiz_clicked");
  menu_create = new GButton(menu_win, 270, 350, 270, 40);
  menu_create.setText("Create New Deck");
  menu_create.addEventHandler(this, "menu_create_clicked");
  preFlash_win = GWindow.getWindow(this, "Flashcards", 0, 0, 800, 500, JAVA2D);
  preFlash_win.noLoop();
  preFlash_win.setActionOnClose(G4P.EXIT_APP);
  preFlash_win.addDrawHandler(this, "preFlash_win_draw");
  preFlash_confirm = new GButton(preFlash_win, 350, 350, 100, 30);
  preFlash_confirm.setText("Confirm");
  preFlash_confirm.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  preFlash_confirm.addEventHandler(this, "preFlash_confirm_clicked");
  preFlash_back = new GButton(preFlash_win, 20, 20, 90, 30);
  preFlash_back.setText("Back");
  preFlash_back.addEventHandler(this, "preFlash_back_clicked");
  label_deck = new GLabel(preFlash_win, 220, 190, 70, 30);
  label_deck.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label_deck.setText("Deck: ");
  label_deck.setOpaque(false);
  preFlash_selectPack = new GDropList(preFlash_win, 290, 190, 270, 120, 3, 20);
  preFlash_selectPack.setItems(loadStrings("list_298132"), 0);
  preFlash_selectPack.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  preFlash_selectPack.addEventHandler(this, "preFlash_selectPack_changed");
  preFlash_random = new GCheckbox(preFlash_win, 300, 320, 210, 20);
  preFlash_random.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  preFlash_random.setText("Randomized Order");
  preFlash_random.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  preFlash_random.setOpaque(false);
  preFlash_random.addEventHandler(this, "preFlash_random_clicked");
  flash_win = GWindow.getWindow(this, "Flashcards", 0, 0, 800, 500, JAVA2D);
  flash_win.noLoop();
  flash_win.setActionOnClose(G4P.EXIT_APP);
  flash_win.addDrawHandler(this, "flash_win_draw");
  flash_win.addKeyHandler(this, "flash_keyPressed");
  flash_prevCard = new GButton(flash_win, 20, 260, 130, 40);
  flash_prevCard.setText("Prev Card");
  flash_prevCard.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  flash_prevCard.addEventHandler(this, "flash_prevCard_clicked");
  flash_nextCard = new GButton(flash_win, 650, 260, 130, 40);
  flash_nextCard.setText("Next Card");
  flash_nextCard.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  flash_nextCard.addEventHandler(this, "flash_nextCardClicked");
  flash_flipCard = new GButton(flash_win, 340, 440, 120, 40);
  flash_flipCard.setText("Flip Card");
  flash_flipCard.addEventHandler(this, "flash_flipCard_clicked");
  flash_menu = new GButton(flash_win, 20, 20, 90, 30);
  flash_menu.setText("Menu");
  flash_menu.addEventHandler(this, "flash_menu_clicked");
  flash_star = new GButton(flash_win, 670, 40, 80, 70);
  flash_star.setText("Star Card");
  flash_star.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  flash_star.addEventHandler(this, "flash_star_clicked");
  flash_selectCard = new GDropList(flash_win, 280, 30, 240, 120, 3, 20);
  flash_selectCard.setItems(loadStrings("list_378885"), 0);
  flash_selectCard.addEventHandler(this, "flash_selectCard_clicked");
  preQuiz_win = GWindow.getWindow(this, "Quiz", 0, 0, 800, 500, JAVA2D);
  preQuiz_win.noLoop();
  preQuiz_win.setActionOnClose(G4P.EXIT_APP);
  preQuiz_win.addDrawHandler(this, "preQuiz_win_draw");
  preQuiz_back = new GButton(preQuiz_win, 20, 20, 90, 30);
  preQuiz_back.setText("Back");
  preQuiz_back.addEventHandler(this, "preQuiz_back_clicked");
  preQuiz_confirm = new GButton(preQuiz_win, 350, 350, 100, 30);
  preQuiz_confirm.setText("Confirm");
  preQuiz_confirm.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  preQuiz_confirm.addEventHandler(this, "preQuiz_confirm_clicked");
  label_deck_1 = new GLabel(preQuiz_win, 220, 190, 70, 30);
  label_deck_1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label_deck_1.setText("Deck:");
  label_deck_1.setOpaque(false);
  preQuiz_selectPack = new GDropList(preQuiz_win, 290, 190, 280, 120, 3, 20);
  preQuiz_selectPack.setItems(loadStrings("list_840257"), 0);
  preQuiz_selectPack.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  preQuiz_selectPack.addEventHandler(this, "preQuiz_selectPack_changed");
  preQuiz_random = new GCheckbox(preQuiz_win, 300, 320, 210, 20);
  preQuiz_random.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  preQuiz_random.setText("Randomized Order");
  preQuiz_random.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  preQuiz_random.setOpaque(false);
  preQuiz_random.addEventHandler(this, "preQuiz_random_clicked");
  quiz_win = GWindow.getWindow(this, "Quiz", 0, 0, 800, 500, JAVA2D);
  quiz_win.noLoop();
  quiz_win.setActionOnClose(G4P.EXIT_APP);
  quiz_win.addDrawHandler(this, "quiz_win_draw");
  quiz_menu = new GButton(quiz_win, 20, 20, 90, 30);
  quiz_menu.setText("Menu");
  quiz_menu.addEventHandler(this, "quiz_menu_clicked");
  quiz_A = new GButton(quiz_win, 150, 200, 50, 30);
  quiz_A.setText("A");
  quiz_A.addEventHandler(this, "quiz_A_clicked");
  quiz_B = new GButton(quiz_win, 150, 260, 50, 30);
  quiz_B.setText("B");
  quiz_B.addEventHandler(this, "quiz_B_clicked");
  quiz_C = new GButton(quiz_win, 150, 320, 50, 30);
  quiz_C.setText("C");
  quiz_C.addEventHandler(this, "quiz_C_clicked");
  quiz_D = new GButton(quiz_win, 150, 380, 50, 30);
  quiz_D.setText("D");
  quiz_D.addEventHandler(this, "quiz_D_clicked");
  postQuiz_win = GWindow.getWindow(this, "Quiz", 0, 0, 800, 500, JAVA2D);
  postQuiz_win.noLoop();
  postQuiz_win.setActionOnClose(G4P.EXIT_APP);
  postQuiz_win.addDrawHandler(this, "postQuiz_win_draw");
  postQuiz_menu = new GButton(postQuiz_win, 180, 390, 170, 40);
  postQuiz_menu.setText("Back to Menu");
  postQuiz_menu.addEventHandler(this, "postQuiz_menu_clicked");
  label_incorrect = new GLabel(postQuiz_win, 300, 130, 204, 40);
  label_incorrect.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label_incorrect.setText("Incorrect Answers: ");
  label_incorrect.setOpaque(false);
  postQuiz_retry = new GButton(postQuiz_win, 440, 390, 170, 40);
  postQuiz_retry.setText("Retry Quiz");
  postQuiz_retry.addEventHandler(this, "postQuiz_retry_clicked");
  label2 = new GLabel(postQuiz_win, 317, 58, 164, 39);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Quiz Finished!");
  label2.setOpaque(false);
  postQuiz_incorrect = new GDropList(postQuiz_win, 260, 180, 280, 120, 3, 20);
  postQuiz_incorrect.setItems(loadStrings("list_929439"), 0);
  postQuiz_incorrect.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  postQuiz_incorrect.addEventHandler(this, "postQuiz_incorrect_changed");
  label_question = new GLabel(postQuiz_win, 160, 220, 100, 50);
  label_question.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label_question.setText("Question:");
  label_question.setOpaque(false);
  question_display = new GLabel(postQuiz_win, 270, 220, 370, 50);
  question_display.setText("Incorrect Question...");
  question_display.setOpaque(true);
  label_yourAnswer = new GLabel(postQuiz_win, 120, 270, 140, 40);
  label_yourAnswer.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label_yourAnswer.setText("Your Answer:");
  label_yourAnswer.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  label_yourAnswer.setOpaque(false);
  label_corrAnswer = new GLabel(postQuiz_win, 90, 310, 170, 40);
  label_corrAnswer.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label_corrAnswer.setText("Correct Answer:");
  label_corrAnswer.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  label_corrAnswer.setOpaque(false);
  yourAnswer_display = new GLabel(postQuiz_win, 270, 270, 370, 40);
  yourAnswer_display.setText("Your Answer...");
  yourAnswer_display.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  yourAnswer_display.setOpaque(true);
  corrAnswer_display = new GLabel(postQuiz_win, 270, 310, 370, 40);
  corrAnswer_display.setText("Correct Answer...");
  corrAnswer_display.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  corrAnswer_display.setOpaque(true);
  preCreate_win = GWindow.getWindow(this, "Create", 0, 0, 800, 500, JAVA2D);
  preCreate_win.noLoop();
  preCreate_win.setActionOnClose(G4P.EXIT_APP);
  preCreate_win.addDrawHandler(this, "preCreate_win_draw");
  preCreate_name = new GTextField(preCreate_win, 330, 140, 230, 30, G4P.SCROLLBARS_NONE);
  preCreate_name.setPromptText("Enter the name of the pack");
  preCreate_name.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  preCreate_name.setOpaque(true);
  preCreate_name.addEventHandler(this, "preCreate_name_changed");
  label_name = new GLabel(preCreate_win, 240, 140, 90, 30);
  label_name.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label_name.setText("Name: ");
  label_name.setOpaque(false);
  preCreate_deck = new GButton(preCreate_win, 290, 200, 310, 60);
  preCreate_deck.setText("New Flashcards");
  preCreate_deck.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  preCreate_deck.addEventHandler(this, "preCreate_deck_clicked");
  preCreate_quiz = new GButton(preCreate_win, 290, 290, 310, 60);
  preCreate_quiz.setText("New Quiz");
  preCreate_quiz.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  preCreate_quiz.addEventHandler(this, "preCreate_quiz_clicked");
  preCreate_back = new GButton(preCreate_win, 20, 20, 90, 30);
  preCreate_back.setText("Back");
  preCreate_back.addEventHandler(this, "preCreate_back_clicked");
  create_win = GWindow.getWindow(this, "Create", 0, 0, 800, 500, JAVA2D);
  create_win.noLoop();
  create_win.setActionOnClose(G4P.EXIT_APP);
  create_win.addDrawHandler(this, "create_win_draw");
  create_menu = new GButton(create_win, 20, 20, 90, 30);
  create_menu.setText("Menu");
  create_menu.addEventHandler(this, "create_menu_clicked");
  QuestionText = new GTextArea(create_win, 360, 20, 400, 210, G4P.SCROLLBARS_NONE);
  QuestionText.setPromptText("Question Text Here");
  QuestionText.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  QuestionText.setOpaque(true);
  QuestionText.addEventHandler(this, "textarea1_change1");
  CardAnswerText = new GTextArea(create_win, 360, 260, 400, 220, G4P.SCROLLBARS_NONE);
  CardAnswerText.setPromptText("Answer Text Here");
  CardAnswerText.setOpaque(true);
  CardAnswerText.addEventHandler(this, "textarea2_change1");
  Export = new GButton(create_win, 60, 440, 240, 40);
  Export.setText("Finish and Export");
  Export.addEventHandler(this, "ExportContent");
  PrevButton = new GButton(create_win, 40, 200, 130, 40);
  PrevButton.setText("Previous");
  PrevButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  PrevButton.addEventHandler(this, "Previous");
  NextButton = new GButton(create_win, 190, 200, 130, 40);
  NextButton.setText("Next");
  NextButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  NextButton.addEventHandler(this, "Next");
  UpdateButton = new GButton(create_win, 40, 70, 280, 30);
  UpdateButton.setText("Update Content");
  UpdateButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  UpdateButton.addEventHandler(this, "Update");
  NewButton = new GButton(create_win, 40, 120, 130, 40);
  NewButton.setText("Add New");
  NewButton.addEventHandler(this, "New");
  DeleteButton = new GButton(create_win, 190, 120, 130, 40);
  DeleteButton.setText("Delete");
  DeleteButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  DeleteButton.addEventHandler(this, "Delete");
  QuizAnswer1 = new GTextField(create_win, 40, 270, 350, 60, G4P.SCROLLBARS_NONE);
  QuizAnswer1.setPromptText("Answer A");
  QuizAnswer1.setOpaque(true);
  QuizAnswer1.addEventHandler(this, "Answer1Text");
  QuizAnswer3 = new GTextField(create_win, 410, 270, 350, 60, G4P.SCROLLBARS_NONE);
  QuizAnswer3.setPromptText("Answer C");
  QuizAnswer3.setOpaque(true);
  QuizAnswer3.addEventHandler(this, "Answer3Text");
  QuizAnswer2 = new GTextField(create_win, 40, 350, 350, 60, G4P.SCROLLBARS_NONE);
  QuizAnswer2.setPromptText("Answer B");
  QuizAnswer2.setOpaque(true);
  QuizAnswer2.addEventHandler(this, "Answer2Text");
  QuizAnswer4 = new GTextField(create_win, 410, 350, 350, 60, G4P.SCROLLBARS_NONE);
  QuizAnswer4.setPromptText("Answer D");
  QuizAnswer4.setOpaque(true);
  QuizAnswer4.addEventHandler(this, "Answer4Text");
  CorrAns = new GDropList(create_win, 560, 430, 200, 60, 2, 10);
  CorrAns.setItems(loadStrings("list_937843"), 0);
  CorrAns.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  CorrAns.addEventHandler(this, "dropList1_click1");
  CorrAnsLabel = new GLabel(create_win, 370, 430, 190, 20);
  CorrAnsLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  CorrAnsLabel.setText("Correct Answer:");
  CorrAnsLabel.setOpaque(false);
  menu_win.loop();
  preFlash_win.loop();
  flash_win.loop();
  preQuiz_win.loop();
  quiz_win.loop();
  postQuiz_win.loop();
  preCreate_win.loop();
  create_win.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow menu_win;
GButton menu_flash; 
GButton menu_quiz; 
GButton menu_create; 
GWindow preFlash_win;
GButton preFlash_confirm; 
GButton preFlash_back; 
GLabel label_deck; 
GDropList preFlash_selectPack; 
GCheckbox preFlash_random; 
GWindow flash_win;
GButton flash_prevCard; 
GButton flash_nextCard; 
GButton flash_flipCard; 
GButton flash_menu; 
GButton flash_star; 
GDropList flash_selectCard; 
GWindow preQuiz_win;
GButton preQuiz_back; 
GButton preQuiz_confirm; 
GLabel label_deck_1; 
GDropList preQuiz_selectPack; 
GCheckbox preQuiz_random; 
GWindow quiz_win;
GButton quiz_menu; 
GButton quiz_A; 
GButton quiz_B; 
GButton quiz_C; 
GButton quiz_D; 
GWindow postQuiz_win;
GButton postQuiz_menu; 
GLabel label_incorrect; 
GButton postQuiz_retry; 
GLabel label2; 
GDropList postQuiz_incorrect; 
GLabel label_question; 
GLabel question_display; 
GLabel label_yourAnswer; 
GLabel label_corrAnswer; 
GLabel yourAnswer_display; 
GLabel corrAnswer_display; 
GWindow preCreate_win;
GTextField preCreate_name; 
GLabel label_name; 
GButton preCreate_deck; 
GButton preCreate_quiz; 
GButton preCreate_back; 
GWindow create_win;
GButton create_menu; 
GTextArea QuestionText; 
GTextArea CardAnswerText; 
GButton Export; 
GButton PrevButton; 
GButton NextButton; 
GButton UpdateButton; 
GButton NewButton; 
GButton DeleteButton; 
GTextField QuizAnswer1; 
GTextField QuizAnswer3; 
GTextField QuizAnswer2; 
GTextField QuizAnswer4; 
GDropList CorrAns; 
GLabel CorrAnsLabel; 
