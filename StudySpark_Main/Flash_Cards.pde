class Card {

//FIELDS

//1) Card Details
String Title, Question, Answer; //The card's title, question, and answer
Boolean Front, Star; //If the card's front is showing; If the card has been starred

//2) Graphical Information
PVector Position; //The card's position on the screen
int sideLength, sideHeight; //The side length of a card; The height of a card
color cardColour, textColour; //The colour of the card; The colour of the card's text


//CONSTRUCTORS
Card(String q, String a) {//open constructor #1
  this.Question = q;
  this.Answer = a;
  this.Star = false;
  
  this.Position = new PVector((width/2 - this.sideLength)/2, (height/2 - this.sideHeight)/2); 
  this.cardColour = (255);
  this.textColour = (0);
  this.sideLength = 400;
  this.sideHeight = 3*this.sideLength/5;
  
  this.Front = true;
}//close constructor #1

//METHODS

void drawMe(PApplet appc) { //draws a card.
  appc.fill(this.cardColour);
  appc.textSize(20);
  appc.rect(this.Position.x, this.Position.y, this.sideLength, 3*this.sideLength/5, 10);
  appc.fill(this.textColour);
  appc.textAlign(CENTER, CENTER);
  String content;
  if(this.Front) {content = this.Question;}
  else {content = this.Answer;}
  appc.text(content, this.Position.x, this.Position.y, this.sideLength-15, this.sideHeight-15);
  
  if (this.Star == true){
    appc.image(sparkIcon, this.Position.x + this.sideLength/1.22, this.Position.y + this.sideHeight/15, 70, 70);
  }
  
}//close drawMe() method

}//close Card class
