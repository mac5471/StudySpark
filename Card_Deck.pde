class Deck {

//fields

//1) Deck Details
String Name;

//2) Positional Information

//3) Relationship w/ Other Objects

Card displayedCard;
ArrayList<Card> Cards;
int displayed, qtCards;

//constructor

Deck(String n) {
  this.Name = n;
  this.qtCards = 0;
  this.Cards = new ArrayList();
}//close constructor #1


//methods

void drawCard() { //text only for testing
    if(this.displayedCard != null) {
    this.displayedCard.drawMe();}  
}//close drawMe() method

void switchCard(int i) {
  if(this.displayedCard != null) {
    this.displayed = i;
    this.displayedCard.Front = true;} //resets the state of the prev. card s that the fonot displays again next.
    this.displayedCard = this.Cards.get(i);
}
  
void newCard(String q, String a) {
  Card temp;
  temp = new Card(q, a);
  temp.belongsTo = this;
  temp.Index = this.qtCards;
  this.Cards.add(temp);
  this.qtCards++;
}//close addCard() method

void starCard() {
  if(this.displayedCard != null) {
    this.displayedCard.Star = ! this.displayedCard.Star;
  }
}//close starCard() method

void flipCard() {
  this.displayedCard.Front = ! this.displayedCard.Front;
}
  
}
