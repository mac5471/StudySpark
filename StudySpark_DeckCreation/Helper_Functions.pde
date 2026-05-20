void resetProgram()
{
  Content = null;
  Title = null;
  New = true;
  Current = 0;
  
  newTitleText.setText("");
  OverwriteMenu.setVisible(false);
  
  DeckName.setText("");
  NewDeckMenu.setVisible(true);
  
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
    CorrAns.setSelected(int(Content.get(Current)[5]) - 1);
  }
}

void loadDeck (String name) { //loads a deck from its file

  String[] textFile = loadStrings(name+".txt");
  
  Content = new ArrayList();
  
  if(textFile[0].equals("D")) {
    println("deck!");
    Card = true;
    
    for(int i = 1; i < textFile.length; i += 2) {
      String[] temp = new String[2];
      temp[0] = textFile[i];
      temp[1] = textFile[i+1];
      Content.add(temp);
    }
    
    cardMenuVisible();
    
  }
  
  else if(textFile[0].equals("Q")) {
    println("quiz!");
    Card = false;
    
    for(int i = 1; i < textFile.length; i += 5) {
      String[] temp = new String[6];
      temp[0] = textFile[i];
      temp[1] = textFile[i+1];
      temp[2] = textFile[i+2];
      temp[3] = textFile[i+3];
      temp[4] = textFile[i+4];
      temp[5] = "1";
      
      Content.add(temp);
    }
    
    quizMenuVisible();
    
  }
  
}//close loadDeck() function

void cardMenuVisible() {
  
  NewDeckMenu.setVisible(false);
  
  CardAnswerText.setVisible(true);
  QuestionText.setVisible(true);
  NewButton.setVisible(true);
  Export.setVisible(true);
  PrevButton.setVisible(true);
  NextButton.setVisible(true);
  DeleteButton.setVisible(true);
  UpdateButton.setVisible(true);
  
}

void export() {
  
  exporter = createWriter(filename); //if you plan on changing the export folder, change "data" to the export folder's name.
  
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
  
}

void quizMenuVisible() {
  
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
  
}
