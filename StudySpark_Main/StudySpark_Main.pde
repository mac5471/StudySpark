import g4p_controls.*;

Deck currDeck;

int screen = 1;
int prevScreen = 0;
int screenWidth = 800;
int screenHeight = 500;
color backgroundCol = color(255, 248, 230);
PImage logo, flashIcon, quizIcon;

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
  
  logo = loadImage("StudySparkLogo.PNG");
  flashIcon = loadImage("FlashcardIcon.PNG");
  quizIcon = loadImage("QuizIcon.PNG");
  
  GCScheme.changePaletteColor(7, 0, color(0, 0, 255));
  GCScheme.changePaletteColor(7, 0, color(0, 0, 255));
  GCScheme.changePaletteColor(7, 0, color(0, 0, 255));
  GCScheme.changePaletteColor(7, 0, color(0, 0, 255));
  GCScheme.changePaletteColor(7, 0, color(0, 0, 255));
  GCScheme.changePaletteColor(7, 0, color(0, 0, 255));
  GCScheme.changePaletteColor(7, 0, color(0, 0, 255));
  GCScheme.changePaletteColor(7, 0, color(0, 0, 255));
  GCScheme.changePaletteColor(7, 0, color(0, 0, 255));
  GCScheme.changePaletteColor(7, 0, color(0, 0, 255));
  GCScheme.changePaletteColor(7, 0, color(0, 0, 255));
  
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
