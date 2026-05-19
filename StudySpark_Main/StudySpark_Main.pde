import g4p_controls.*;
import java.io.File;

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
  customPalette();
  
  logo = loadImage("StudySparkLogo.PNG");
  flashIcon = loadImage("FlashcardIcon.PNG");
  quizIcon = loadImage("QuizIcon.PNG");
  
  String decksPath = sketchPath("decks");
  String flashPath = dataPath("list_298132");
  String quizPath = dataPath("list_840257");

  File decksFolder = new File(decksPath);
  File [] avaliableDecks = decksFolder.listFiles();
  String [] avaliableDecksStrings = new String[avaliableDecks.length];
  
  int i = 0;
  for (File f : avaliableDecks){
    avaliableDecksStrings[i] = f.getName().replace(".txt", "");
    i++;
  }
  
  saveStrings(flashPath, avaliableDecksStrings);
  saveStrings(quizPath, avaliableDecksStrings);
  
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
