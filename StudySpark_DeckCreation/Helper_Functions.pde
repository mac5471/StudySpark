void resetProgram()
{
  Content = null;
  Title = null;
  Current = 0;
  
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
  }
}
