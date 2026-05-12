void resetProgram()
{
  deckContent = null;
  Title = null;
  currCard = 0;
  
  NewDeckMenu.setVisible(true);
  
  AnswerText.setVisible(false);
  QuestionText.setVisible(false);
  NewCard.setVisible(false);
  Export.setVisible(false);
  PrevButton.setVisible(false);
  NextButton.setVisible(false);
  DeleteButton.setVisible(false);
  UpdateButton.setVisible(false);
  
  DeckName.setText("");
}

void resetText () {
  QuestionText.setText("");
  AnswerText.setText("");
  QuestionText.setText(deckContent.get(currCard)[0]);
  AnswerText.setText(deckContent.get(currCard)[1]);
}
