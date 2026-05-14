class Card {

//FIELDS

//1) Card Details
String Title, Question, Answer; //The card's title, question, and answer
Boolean Front, Star; //If the card's front is showing, if the card has been starred

//2) Graphical Information

PVector Position;
int sideLength; //not currently used -- implemented in case different menus might alter the card's size
color cardColour, textColour; //the colour of the card, the colour of the card's text

//3) Relationship w/ Other Objects
Deck belongsTo;
int Index;

//constructor
Card(String q, String a) {//open constructor #1
  this.Question = q;
  this.Answer = a;
  this.Star = false;
  
  this.Position = new PVector(275, 150); //these should changed depending on GUI design
  this.cardColour = (255);
  this.textColour = (0);
  
  this.Front = true;
}//close constructor #1

//methods

void drawMe(PApplet appc) { //draws a card.
  appc.fill(this.cardColour);
  appc.rect(this.Position.x, this.Position.y, 250,150);
  appc.fill(this.textColour);
  appc.textAlign(CENTER);
  String content;
  if(this.Front) {content = this.Question;}
  else {content = this.Answer;}
  appc.text(content, this.Position.x + 125, this.Position.y + 75);
  
}//close drawMe() method

}//close Card class
