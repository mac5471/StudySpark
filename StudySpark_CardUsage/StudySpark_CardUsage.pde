import g4p_controls.*;

Deck currDeck; //The deck currently being displayed
int[] Order;
boolean Set;

void setup() {
  size(500,400);
  createGUI();
}

void draw() {
  background(0);
  
  if (currDeck != null) { //if there is a deck to be drawn, draw it
  currDeck.drawCard();}
  
}
