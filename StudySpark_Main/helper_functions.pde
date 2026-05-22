void loadDeck (String name) { //loads a deck from its file

  String path = sketchPath("/decks/"+name+".txt");  //locates a deck from the 'decks' folder from its name,
  String[] cardContent = loadStrings(path);         //and loads its content into an array.

  currDeck = new Deck(name);
  
  selectCards = new ArrayList<String>(); //saves the deck's questions for the table of contents drop-down menu.
  
  if(cardContent[0].equals("D")) { //for-loop if a text file is determined to be a flashcard deck, determined by its content identifier.
    for(int i = 1; i < cardContent.length; i += 2) {
      String question = cardContent[i];
      String answer = cardContent[i+1];
      currDeck.newCard(question, answer);
      selectCards.add(question);
    }
  }
  
  else if(cardContent[0].equals("Q")) { //same, for if a text file is determined to be for a quiz.
    for(int i = 1; i < cardContent.length - 2; i += 5) {
      String question = cardContent[i];
      String answer = cardContent[i+1];
      currDeck.newCard(question, answer);
      selectCards.add(question);
    }
  }
  
  orderCards();                     //orders the cards,
  currDeck.switchCard(Order[0]);    //and switches to the first card in the set order.
  
  updateCardOptions(selectCards);   //creates the information needed for the table of contents drop-down.
  
}//close loadDeck() function

void updateCardOptions(ArrayList<String> selectCards){ //update avaliable cards for flashcard dropdown
  String[] selectCardsArray = selectCards.toArray(new String[selectCards.size()]);
  orderedSelectCardsArray = new String[selectCards.size()];
  
  int j = 0;
  for (int i = 0; i < selectCardsArray.length; i++){
    j = Order[i];
    orderedSelectCardsArray[i] = i+1 + ". " + selectCardsArray[j];
  }
  flash_selectCard.setItems(orderedSelectCardsArray, 0);
}

void orderCards() {//creates the order of the current deck
  int size = currDeck.Cards.size();
  
  Order = new int[size]; //creates the non-randomized order -- or, as it is from the text file.
  for(int i = 0; i < size; i++) {Order[i] = i;}
 
  if(! Set) { //shuffles the order if selected from GUI.
    IntList newOrder;
    newOrder = new IntList();
      
    for(int i = 0; i < size; i++) {newOrder.append(i);}
    
    newOrder.shuffle();
    
    for(int i = 0; i < size; i++) {Order[i] = newOrder.get(i);}
  }// close not-set case

}//close orderCards() function

QuizHandler activeQuiz;

void loadQuizData(String filename) {
  // for now it will try finding biology.txt, after I will add feature where they can select which one they want
  String path = sketchPath("/decks/"+filename+".txt");
  String[] lines = loadStrings(path);
  
  if (lines != null && lines.length > 0 && lines[0].trim().equals("Q")) {
    activeQuiz = new QuizHandler(filename);
    
    // jump 5 lines at a time since 1 for question and 4 for answers
    for (int i = 1; i + 4 < lines.length; i += 5) {
      String qText = lines[i];
      String[] ops = { lines[i+1], lines[i+2], lines[i+3], lines[i+4] };
      activeQuiz.addQuestion(qText, ops);
    }
    //println("Quiz loaded with " + activeQuiz.questions.size() + " questions.");
  }
}

void resetProgram() { //resets the text and visbility of a variety of deck/quiz GUI elements to their original state.
  Content = null;
  Title = null;
  Current = 0;
  
  preCreate_name.setText("");
  
  NewButton.setVisible(false);
  Export.setVisible(false);
  PrevButton.setVisible(false);
  NextButton.setVisible(false);
  DeleteButton.setVisible(false);
  UpdateButton.setVisible(false);
  
  QuestionText.setVisible(false);
  QuestionText.setText("");
  CardAnswerText.setVisible(false);
  CardAnswerText.setText("");
  
  CorrAns.setVisible(false);
  CorrAnsLabel.setVisible(false);
  QuizAnswer1.setVisible(false);
  QuizAnswer1.setText("");
  QuizAnswer2.setVisible(false);
  QuizAnswer2.setText("");
  QuizAnswer3.setVisible(false);
  QuizAnswer3.setText("");
  QuizAnswer4.setVisible(false);
  QuizAnswer4.setText("");
} //close resetProgram() function

void resetText() { //in deck/quiz creation, updates the text to the currently displayed content.
  QuestionText.setText(Content.get(Current)[0]);
  
  if(Card) {
    CardAnswerText.setText(Content.get(Current)[1]);
  }
  
  else {
    QuizAnswer1.setText(Content.get(Current)[1]);
    QuizAnswer2.setText(Content.get(Current)[2]);
    QuizAnswer3.setText(Content.get(Current)[3]);
    QuizAnswer4.setText(Content.get(Current)[4]);
  }
} //close resetText() function

void clearText () { //clear textboxes in creation tabs
  QuestionText.setText("");
  
  if(Card) {
    CardAnswerText.setText("");
  }
  else {
    QuizAnswer1.setText("");
    QuizAnswer2.setText("");
    QuizAnswer3.setText("");
    QuizAnswer4.setText("");
  }
}

void prevCard() { //in the flashcard deck interface, switches to the previous card in order.

  if(currDeck.displayedIndex - 1 >= 0) { //if-check to check that the current card isn't the first card (i.e. no prev. card).
    currDeck.currCard.Front = true;
    currDeck.displayedIndex -= 1;
    currDeck.switchCard(Order[currDeck.displayedIndex]);
    flash_selectCard.setSelected(currDeck.displayedIndex);
  }
  else {println("you're at the beginning of the deck!");}
  
}

void nextCard() {  //in the flashcard deck interface, switches to the next card in order.

  if(currDeck.displayedIndex + 1 < currDeck.qtCards) {  //if-check to check that the current isn't the last card (i.e. no next card).
    currDeck.currCard.Front = true;
    currDeck.displayedIndex += 1;
    currDeck.switchCard(Order[currDeck.displayedIndex]);
    flash_selectCard.setSelected(currDeck.displayedIndex);
  }
  else {println("you're at the end of the deck!");}
  
}

void customPalette(){ //overrides existing colours with custom ones
  GCScheme.changePaletteColor(7, 0, color(214, 182, 152));
  GCScheme.changePaletteColor(7, 1, color(182, 147, 118));
  GCScheme.changePaletteColor(7, 2, color(151, 114, 86));
  GCScheme.changePaletteColor(7, 3, color(231, 199, 169));
  GCScheme.changePaletteColor(7, 4, color(244, 212, 182));
  GCScheme.changePaletteColor(7, 5, color(255, 225, 198));
  GCScheme.changePaletteColor(7, 6, color(255, 238, 223));
  GCScheme.changePaletteColor(7, 11, color(214, 182, 152));
  GCScheme.changePaletteColor(7, 12, color(55, 27, 0));
  GCScheme.changePaletteColor(7, 15, color(153, 121, 91));
  GCScheme.changePaletteColor(7, 16, color(37, 18, 0));
  
  GCScheme.changePaletteColor(4, 0, color(172, 129, 101));
  GCScheme.changePaletteColor(4, 1, color(128, 90, 69));
  GCScheme.changePaletteColor(4, 2, color(83, 54, 40));
  GCScheme.changePaletteColor(4, 3, color(198, 152, 119));
  GCScheme.changePaletteColor(4, 4, color(217, 171, 135));
  GCScheme.changePaletteColor(4, 5, color(230, 192, 157));
  GCScheme.changePaletteColor(4, 6, color(243, 213, 192));
  GCScheme.changePaletteColor(4, 11, color(172, 129, 101));
  GCScheme.changePaletteColor(4, 12, color(25, 14, 5));
  GCScheme.changePaletteColor(4, 15, color(87, 61, 45));
  GCScheme.changePaletteColor(4, 16, color(17, 8, 3));

}

void updateDropdowns(){
  String decksPath = sketchPath("decks"); //make a path to decks folder

  File decksFolder = new File(decksPath);
  File [] avaliableDecks = decksFolder.listFiles(); //read files in decks
  
  ArrayList<String> flashOptionsList = new ArrayList<String>();
  ArrayList<String> quizOptionsList = new ArrayList<String>();
  
  String deckName;
  
  for (File f : avaliableDecks){ //for each file in decks, read if file is a quiz or flashcard and add to appropriate array
    String[] currDeck = loadStrings("decks/" + f.getName());
    deckName = f.getName();
    flashOptionsList.add(deckName.replace(".txt", ""));
    if (currDeck[0].equals("Q")){
      quizOptionsList.add(deckName.replace(".txt", ""));
    }
  }
  
  String[] flashOptions = flashOptionsList.toArray(new String[flashOptionsList.size()]);
  String[] quizOptions = quizOptionsList.toArray(new String[quizOptionsList.size()]);
  
  //update dropdown items
  preFlash_selectPack.setItems(flashOptions, 0);
  preQuiz_selectPack.setItems(quizOptions, 0);
}

void loadIncorrectQuestions(){
  if (activeQuiz.incorrectQuestions != null){
    if (activeQuiz.incorrectQuestions.isEmpty()){ // if no answers are incorrect, do not display incorrect GUI
      String[] incorrectQuestionsArray = new String[1];
      incorrectQuestionsArray[0] = "N/A";
      postQuiz_incorrect.setItems(incorrectQuestionsArray, 0);
      
      label_incorrect.setVisible(false);
      label_question.setVisible(false);
      label_yourAnswer.setVisible(false);
      label_corrAnswer.setVisible(false);
      postQuiz_incorrect.setVisible(false);
      question_display.setVisible(false);
      yourAnswer_display.setVisible(false);
      corrAnswer_display.setVisible(false);
    }
    else{
      String[] incorrectQuestionsArray = new String[activeQuiz.incorrectQuestions.size()];
      
      int i = 0;
      for (QuizQuestion q: activeQuiz.incorrectQuestions){
        incorrectQuestionsArray[i] = i+1 + ". " + q.questionText;
        i++;
      }
      
      postQuiz_incorrect.setItems(incorrectQuestionsArray, 0); //update dropdown
      
      //display GUI
      label_incorrect.setVisible(true);
      label_question.setVisible(true);
      label_yourAnswer.setVisible(true);
      label_corrAnswer.setVisible(true);
      postQuiz_incorrect.setVisible(true);
      question_display.setVisible(true);
      yourAnswer_display.setVisible(true);
      corrAnswer_display.setVisible(true);
    }
  }
}

void updateIncorrect(){
  if (!activeQuiz.incorrectQuestions.isEmpty()){ //update GUI to reflect question selected
    int selectedIndex = postQuiz_incorrect.getSelectedIndex();
    QuizQuestion[] questions = activeQuiz.incorrectQuestions.toArray(new QuizQuestion[activeQuiz.incorrectQuestions.size()]);
    question_display.setText(postQuiz_incorrect.getSelectedText());
    yourAnswer_display.setText(activeQuiz.incorrectAnswers.get(selectedIndex));
    corrAnswer_display.setText(questions[selectedIndex].correctAnsText);
  }
}
