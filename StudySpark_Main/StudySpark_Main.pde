import g4p_controls.*;
import java.io.File; //to later read the files within a folder for dropdown menus (see "updateDropdowns" helper function)

//Flashcard variables
Deck currDeck;
int[] Order;
boolean Set;

//Display and GUI variables
int screen = 1;
int prevScreen = 0;
int screenWidth = 800;
int screenHeight = 500;
color backgroundCol = color(255, 248, 230);
PImage logo, flashIcon, quizIcon, sparkIcon;

int lastPressed = 0; //For key press buffer

GWindow [] screens = new GWindow[7];
GWindow currScreen;
PVector currLocation = new PVector(0, 0);
PVector lastLocation = new PVector(0, 0);
int currX, currY;

//Creation variables
ArrayList<String[]> Content;
String Title;
int Current;
boolean Card; //if creating card vs. quiz

//Droplist variables
ArrayList<String> selectCards = new ArrayList<String>();
String[] orderedSelectCardsArray = new String[selectCards.size()];

PrintWriter exporter;

void setup() {
  size(800, 500);
  background(backgroundCol);
  surface.setLocation(0, 0);
  
  //GUI
  createGUI();
  customPalette();
  
  screens = new GWindow[] {menu_win, preFlash_win, flash_win, preQuiz_win, quiz_win, postQuiz_win, preCreate_win, create_win};
  resetScreens();
  updateDropdowns();
  
  imageMode(CENTER);
  
  //Load images
  logo = loadImage("StudySparkLogo.PNG");
  flashIcon = loadImage("FlashcardIcon.PNG");
  quizIcon = loadImage("QuizIcon.PNG");
  sparkIcon = loadImage("Spark.PNG");
  
}

void draw() {
  screenControls();
}
