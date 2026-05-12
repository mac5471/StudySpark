import g4p_controls.*;

ArrayList<String[]> deckContent;
String Title;
int currCard;

PrintWriter exporter;

void setup() {
  size(500,400);
  createGUI();
  
  resetProgram();
  
  //AnswerText.setVisible(false);
  //QuestionText.setVisible(false);
  //NewCard.setVisible(false);
  //Export.setVisible(false);
  //PrevButton.setVisible(false);
  //NextButton.setVisible(false);
  //DeleteButton.setVisible(false);
  //UpdateButton.setVisible(false);
  
}

void draw() {
  background(0);
  
  if(deckContent != null) {
    textSize(30);
    fill(255);
    String cardCount = str(currCard + 1) + "/" + str(deckContent.size());
    text(cardCount, 10, 380);
  }
}
