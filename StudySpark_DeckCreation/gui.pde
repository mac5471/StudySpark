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

public void CardTextAnswer(GTextArea source, GEvent event) { //_CODE_:CardAnswerText:686908:
} //_CODE_:CardAnswerText:686908:

public void TextQuestion(GTextArea source, GEvent event) { //_CODE_:QuestionText:934927:
  
} //_CODE_:QuestionText:934927:

public void New(GButton source, GEvent event) { //_CODE_:NewButton:611985:
 String[] temp;
 if(Card) {temp = new String[2]; temp[0] = ""; temp[1] = "";}
 else {temp = new String[6]; temp[0] = ""; temp[1] = ""; temp[2] = ""; temp[3] = ""; temp[4] = ""; temp[5] = "1";}
 Content.add(temp);
 Current ++;
 resetText();
} //_CODE_:NewButton:611985:

public void ExportContent(GButton source, GEvent event) { //_CODE_:Export:759024:
  exporter = createWriter("data/"+ Title + ".txt"); //if you plan on changing the export folder, change "data" to the export folder's name.
  
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
  resetProgram();
} //_CODE_:Export:759024:

public void Previous(GButton source, GEvent event) { //_CODE_:PrevButton:238548:
  if(Current > 0) {
    Current --;
    resetText();
  }
} //_CODE_:PrevButton:238548:

public void Next(GButton source, GEvent event) { //_CODE_:NextButton:605521:
  if(Current < Content.size() - 1) {
    Current ++;
    resetText();
  }
} //_CODE_:NextButton:605521:

public void Delete(GButton source, GEvent event) { //_CODE_:DeleteButton:972669:
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
  
} //_CODE_:DeleteButton:972669:

public void Update(GButton source, GEvent event) { //_CODE_:UpdateButton:334758:

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
  
} //_CODE_:UpdateButton:334758:

public void Answer1Text(GTextArea source, GEvent event) { //_CODE_:QuizAnswer1:350943:
} //_CODE_:QuizAnswer1:350943:

public void Answer2Text(GTextArea source, GEvent event) { //_CODE_:QuizAnswer2:231031:
} //_CODE_:QuizAnswer2:231031:

public void Answer3Text(GTextArea source, GEvent event) { //_CODE_:QuizAnswer3:471171:
} //_CODE_:QuizAnswer3:471171:

public void Answer4Text(GTextArea source, GEvent event) { //_CODE_:QuizAnswer4:649919:
} //_CODE_:QuizAnswer4:649919:

public void chooseCorrAns(GDropList source, GEvent event) { //_CODE_:CorrAns:275555:
} //_CODE_:CorrAns:275555:

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:NewDeckMenu:766128:
  appc.background(230);
} //_CODE_:NewDeckMenu:766128:

public void NameEntry(GTextField source, GEvent event) { //_CODE_:DeckName:717840:
} //_CODE_:DeckName:717840:

public void createDeck(GButton source, GEvent event) { //_CODE_:deckButton:809714:
 Content = new ArrayList();
 Title = DeckName.getText();
 Current = 0;
  
 String[] temp = {"", ""};
 Content.add(temp);
 
 NewDeckMenu.setVisible(false);
  
 CardAnswerText.setVisible(true);
 QuestionText.setVisible(true);
 NewButton.setVisible(true);
 Export.setVisible(true);
 PrevButton.setVisible(true);
 NextButton.setVisible(true);
 DeleteButton.setVisible(true);
 UpdateButton.setVisible(true);
  
 Card = true;
  
} //_CODE_:deckButton:809714:

public void createQuiz(GButton source, GEvent event) { //_CODE_:quizButton:828290:
  Content = new ArrayList();
  Title = DeckName.getText();
  Current = 0;
  
  String[] temp = {"","","","","","1"};
  Content.add(temp);

  NewDeckMenu.setVisible(false);
  
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
  
} //_CODE_:quizButton:828290:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  CardAnswerText = new GTextArea(this, 200, 200, 200, 130, G4P.SCROLLBARS_NONE);
  CardAnswerText.setPromptText("Answer Text Here");
  CardAnswerText.setOpaque(true);
  CardAnswerText.addEventHandler(this, "CardTextAnswer");
  QuestionText = new GTextArea(this, 200, 20, 200, 130, G4P.SCROLLBARS_NONE);
  QuestionText.setPromptText("Question Text Here");
  QuestionText.setOpaque(true);
  QuestionText.addEventHandler(this, "TextQuestion");
  NewButton = new GButton(this, 10, 50, 80, 30);
  NewButton.setText("Add New");
  NewButton.addEventHandler(this, "New");
  Export = new GButton(this, 10, 300, 170, 30);
  Export.setText("Finish and Export");
  Export.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  Export.addEventHandler(this, "ExportContent");
  PrevButton = new GButton(this, 10, 120, 80, 30);
  PrevButton.setText("Previous");
  PrevButton.addEventHandler(this, "Previous");
  NextButton = new GButton(this, 100, 120, 80, 30);
  NextButton.setText("Next");
  NextButton.addEventHandler(this, "Next");
  DeleteButton = new GButton(this, 100, 50, 80, 30);
  DeleteButton.setText("Delete");
  DeleteButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  DeleteButton.addEventHandler(this, "Delete");
  UpdateButton = new GButton(this, 10, 10, 170, 30);
  UpdateButton.setText("Update Content");
  UpdateButton.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  UpdateButton.addEventHandler(this, "Update");
  QuizAnswer1 = new GTextArea(this, 10, 160, 180, 50, G4P.SCROLLBARS_NONE);
  QuizAnswer1.setPromptText("Answer 1");
  QuizAnswer1.setOpaque(true);
  QuizAnswer1.addEventHandler(this, "Answer1Text");
  QuizAnswer2 = new GTextArea(this, 10, 220, 180, 50, G4P.SCROLLBARS_NONE);
  QuizAnswer2.setPromptText("Answer 2");
  QuizAnswer2.setOpaque(true);
  QuizAnswer2.addEventHandler(this, "Answer2Text");
  QuizAnswer3 = new GTextArea(this, 200, 160, 200, 50, G4P.SCROLLBARS_NONE);
  QuizAnswer3.setPromptText("Answer 3");
  QuizAnswer3.setOpaque(true);
  QuizAnswer3.addEventHandler(this, "Answer3Text");
  QuizAnswer4 = new GTextArea(this, 200, 220, 200, 50, G4P.SCROLLBARS_NONE);
  QuizAnswer4.setPromptText("Answer 4");
  QuizAnswer4.setOpaque(true);
  QuizAnswer4.addEventHandler(this, "Answer4Text");
  CorrAns = new GDropList(this, 200, 310, 200, 100, 4, 10);
  CorrAns.setItems(loadStrings("list_275555"), 0);
  CorrAns.addEventHandler(this, "chooseCorrAns");
  CorrAnsLabel = new GLabel(this, 200, 290, 200, 20);
  CorrAnsLabel.setText("Choose Correct Answer");
  CorrAnsLabel.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  CorrAnsLabel.setOpaque(false);
  NewDeckMenu = GWindow.getWindow(this, "New Deck", 0, 0, 300, 120, JAVA2D);
  NewDeckMenu.noLoop();
  NewDeckMenu.setActionOnClose(G4P.KEEP_OPEN);
  NewDeckMenu.addDrawHandler(this, "win_draw1");
  label2 = new GLabel(NewDeckMenu, 10, 10, 150, 20);
  label2.setTextAlign(GAlign.LEFT, GAlign.BOTTOM);
  label2.setText("CREATE NEW CONTENT");
  label2.setOpaque(false);
  DeckName = new GTextField(NewDeckMenu, 10, 30, 120, 30, G4P.SCROLLBARS_NONE);
  DeckName.setPromptText("Enter Title");
  DeckName.setOpaque(true);
  DeckName.addEventHandler(this, "NameEntry");
  deckButton = new GButton(NewDeckMenu, 10, 80, 130, 30);
  deckButton.setText("Create New Deck");
  deckButton.addEventHandler(this, "createDeck");
  quizButton = new GButton(NewDeckMenu, 150, 80, 130, 30);
  quizButton.setText("Create New Quiz");
  quizButton.addEventHandler(this, "createQuiz");
  NewDeckMenu.loop();
}

// Variable declarations 
// autogenerated do not edit
GTextArea CardAnswerText; 
GTextArea QuestionText; 
GButton NewButton; 
GButton Export; 
GButton PrevButton; 
GButton NextButton; 
GButton DeleteButton; 
GButton UpdateButton; 
GTextArea QuizAnswer1; 
GTextArea QuizAnswer2; 
GTextArea QuizAnswer3; 
GTextArea QuizAnswer4; 
GDropList CorrAns; 
GLabel CorrAnsLabel; 
GWindow NewDeckMenu;
GLabel label2; 
GTextField DeckName; 
GButton deckButton; 
GButton quizButton; 
