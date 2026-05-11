class Card {

//FIELDS

//1) Card Details
String Title, Question, Answer; //the card's content
Boolean Front, Star;

//2) Graphical Information

PVector Position;
int sideLength; //not currently used -- implemented in case different menus might alter the card's size
color Colour;

//3) Relationship w/ Other Objects
Deck belongsTo;
int Index;

//constructor
Card(String q, String a) {
  this.Question = q;
  this.Answer = a;
  this.Star = false;
  this.Position = new PVector(100,100);
  this.Front = true;
}//close constructor #1

//methods

void drawMe() { //text only for testing

  fill(255);
  rect(this.Position.x, this.Position.y, 250,150);
  if(this.Star) {fill(255,255,0);}
  else{fill(0);}
  textAlign(CENTER);
  String content;
  if(this.Front) {content = this.Question;}
  else {content = this.Answer;}
  text(content, this.Position.x + 125, this.Position.y + 75);
  
}//close drawMe() method

void star() {
  this.Star = ! this.Star;
}//close star() method
 
}
