class Card {

//FIELDS

//1) Card Details
String Title, Question, Answer; //The card's title, question, and answer
Boolean Front, Star; //If the card's front is showing, if the card has been starred

//2) Graphical Information

PVector Position;
int sideLength, sideHeight; //not currently used -- implemented in case different menus might alter the card's size
color cardColour, textColour; //the colour of the card, the colour of the card's text

//3) Relationship w/ Other Objects
Deck belongsTo;
int Index;

//constructor
Card(String q, String a) {//open constructor #1
  this.Question = q;
  this.Answer = a;
  this.Star = false;
  
  this.Position = new PVector((width/2 - this.sideLength)/2, (height/2 - this.sideHeight)/2); //these should changed depending on GUI design
  this.cardColour = (255);
  this.textColour = (0);
  this.sideLength = 400;
  this.sideHeight = 3*this.sideLength/5;
  
  this.Front = true;
}//close constructor #1

//methods

void drawMe(PApplet appc) { //draws a card.
  appc.fill(this.cardColour);
  appc.textSize(14);
  appc.rect(this.Position.x, this.Position.y, this.sideLength, 3*this.sideLength/5);
  appc.fill(this.textColour);
  appc.textAlign(CENTER);
  String content;
  if(this.Front) {content = this.Question;}
  else {content = this.Answer;}
  appc.text(content, this.Position.x + this.sideLength/2, this.Position.y + this.sideHeight/2);
  
}//close drawMe() method

}//close Card class
