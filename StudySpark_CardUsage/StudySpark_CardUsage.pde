import g4p_controls.*;

Deck test, displayed;

void setup() {
  size(500,400);
  createGUI();
  //loadDeck("testdeck");
  test = new Deck("wow!");
  test.newCard("1+1", "2");
  test.newCard("2+2", "fish");
}

void draw() {
  background(0);
  
  if (displayed != null) {
  displayed.drawCard();}
  
}
