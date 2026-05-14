import g4p_controls.*;

Deck currDeck;

int screen = 1;
int prevScreen = 0;
int screenWidth = 800;
int screenHeight = 500;
color backgroundCol = color(250, 245, 229);
PImage logo;

ArrayList<String[]> Content;
String Title;
int Current;
boolean Card; //if creating card vs. quiz

PrintWriter exporter;

//int screenX = (displayWidth + screenWidth)/2;
//int screenY = (displayHeight + screenHeight)/2;

void setup() {
  size(800, 500);
  background(backgroundCol);
  surface.setLocation(0, 0);
  createGUI();
  resetScreens();
  
  logo = loadImage("StudySparkLogo.PNG");
  
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
  
  create_win.setVisible(false);
  
}

void draw() {
  screenControls();
  
}
