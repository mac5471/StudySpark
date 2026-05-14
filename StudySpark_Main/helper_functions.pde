void loadDeck (String name) { //loads a deck from its file

  String[] cardContent = loadStrings(name+".txt");
  Deck temp;
  temp = new Deck(name); //creates temporary deck 'temp'
  
  if(cardContent[0].equals("D")) { //code if the file is determined to be for flashcard decks
    for(int i = 1; i < cardContent.length; i += 2) {
      String question = cardContent[i];
      String answer = cardContent[i+1];
      println(question, answer);
      temp.newCard(question, answer);
    }
  }
  
  else if(cardContent[0].equals("q")) { //code if the file is determined to be for quizzes
    for(int i = 1; i < cardContent.length - 2; i += 4) {
      String question = cardContent[i];
      String answer = cardContent[i+1];
      println(question, answer);
      temp.newCard(question, answer);
    }
  }
  
  temp.switchCard(0);
  currDeck = temp;
}//close loadDeck() function

QuizHandler activeQuiz;

void loadQuizData(String filename) {
  // for now it will try finding biology.txt, after I will add feature where they can select which one they want
  String[] lines = loadStrings(filename + ".txt.txt");
  
  if (lines != null && lines.length > 0 && lines[0].trim().equals("q")) {
    activeQuiz = new QuizHandler(filename);
    
    // jump 5 lines at a time since 1 for question and 4 for answers
    for (int i = 1; i + 4 < lines.length; i += 5) {
      String qText = lines[i];
      String[] ops = { lines[i+1], lines[i+2], lines[i+3], lines[i+4] };
      activeQuiz.addQuestion(qText, ops);
    }
    println("Quiz loaded with " + activeQuiz.questions.size() + " questions.");
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
