void loadDeck (String name) { //loads a deck from its file
  String path = sketchPath("/decks/"+name+".txt");
  String[] cardContent = loadStrings(path);
  Deck temp;
  temp = new Deck(name); //creates temporary deck 'temp'
  
  ArrayList<String> selectCards = new ArrayList<String>();
  
  if(cardContent[0].equals("D")) { //code if the file is determined to be for flashcard decks
    for(int i = 1; i < cardContent.length; i += 2) {
      String question = cardContent[i];
      String answer = cardContent[i+1];
      //println(question, answer);
      temp.newCard(question, answer);
      selectCards.add(i + ". " + question);
    }
  }
  else if(cardContent[0].equals("Q")) { //code if the file is determined to be for quizzes
    int j = 1;
    for(int i = 1; i < cardContent.length - 2; i += 5) {
      String question = cardContent[i];
      String answer = cardContent[i+1];
      //println(question, answer);
      temp.newCard(question, answer);
      selectCards.add(j + ". " + question);
      j++;
    }
  }
  temp.switchCard(0);
  currDeck = temp;
  String[] selectCardsArray = selectCards.toArray(new String[selectCards.size()]);
  flash_selectCard.setItems(selectCardsArray, 0);
}//close loadDeck() function

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

void resetProgram()
{
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
}

void resetText () {
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
}

void prevCard(){
  if(currDeck.displayedIndex - 1 >= 0) {
  currDeck.currCard.Front = true;
  currDeck.displayedIndex -= 1;
  currDeck.switchCard(currDeck.displayedIndex);
  flash_selectCard.setSelected(currDeck.displayedIndex);
  }
  else {println("you're at the beginning of the deck!");}
}

void nextCard(){
  if(currDeck.displayedIndex + 1 < currDeck.qtCards) {
  currDeck.currCard.Front = true;
  currDeck.displayedIndex += 1;
  currDeck.switchCard(currDeck.displayedIndex);
  flash_selectCard.setSelected(currDeck.displayedIndex);
  }
  else {println("you're at the end of the deck!");}
}

void customPalette(){
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
  String decksPath = sketchPath("decks");

  File decksFolder = new File(decksPath);
  File [] avaliableDecks = decksFolder.listFiles();
  ArrayList<String> flashOptionsList = new ArrayList<String>();
  ArrayList<String> quizOptionsList = new ArrayList<String>();
  
  String deckName;
  
  for (File f : avaliableDecks){
    String[] currDeck = loadStrings("decks/" + f.getName());
    deckName = f.getName();
    flashOptionsList.add(deckName.replace(".txt", ""));
    if (currDeck[0].equals("Q")){
      quizOptionsList.add(deckName.replace(".txt", ""));
    }
  }
  String[] flashOptions = flashOptionsList.toArray(new String[flashOptionsList.size()]);
  String[] quizOptions = quizOptionsList.toArray(new String[quizOptionsList.size()]);
  
  preFlash_selectPack.setItems(flashOptions, 0);
  preQuiz_selectPack.setItems(quizOptions, 0);
}

void loadIncorrectQuestions(){
  if (activeQuiz.incorrectQuestions != null){
    if (activeQuiz.incorrectQuestions.isEmpty()){
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
      postQuiz_incorrect.setItems(incorrectQuestionsArray, 0);
      
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
  if (!activeQuiz.incorrectQuestions.isEmpty()){
    int selectedIndex = postQuiz_incorrect.getSelectedIndex();
    QuizQuestion[] questions = activeQuiz.incorrectQuestions.toArray(new QuizQuestion[activeQuiz.incorrectQuestions.size()]);
    question_display.setText(postQuiz_incorrect.getSelectedText());
    yourAnswer_display.setText(activeQuiz.incorrectAnswers.get(selectedIndex));
    corrAnswer_display.setText(questions[selectedIndex].correctAnsText);
  }
}
