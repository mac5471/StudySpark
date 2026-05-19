import g4p_controls.*;

ArrayList<String[]> Content;
String filename, Title;
int Current;
boolean Card; //if creating card vs. quiz
boolean New; //if new or modifying prev.

PrintWriter exporter;

void setup() {
  size(500,405);
  createGUI();
  
  OverwriteMenu.setVisible(false);
  
  NewButton.setVisible(false);
  Export.setVisible(false);
  PrevButton.setVisible(false);
  NextButton.setVisible(false);
  DeleteButton.setVisible(false);
  UpdateButton.setVisible(false);
  
  CardAnswerText.setVisible(false);
  QuestionText.setVisible(false);
  
  
  CorrAns.setVisible(false);
  CorrAnsLabel.setVisible(false);
  QuizAnswer1.setVisible(false);
  QuizAnswer2.setVisible(false);
  QuizAnswer3.setVisible(false);
  QuizAnswer4.setVisible(false);
  
}

void draw() {
  background(0);
  
  if(Content != null) {
    textSize(30);
    fill(255);
    String Count = str(Current + 1) + "/" + str(Content.size());
    text(Count, 10, 380);
  }
}
