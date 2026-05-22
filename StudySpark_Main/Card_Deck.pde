class Deck {

//FIELDS

//1) Deck Details
String Name; //The deck's title

//2) Relationship w/ Other Objects
ArrayList<Card> Cards; //The list of cards in the deck
Card currCard; //The card currently being displayed 
int displayedIndex, qtCards; //The index of the current displayed card; The total number of cards

//CONSTRUCTOR

Deck(String n) { //open constructor #1
  this.Name = n;
  this.qtCards = 0;
  this.Cards = new ArrayList();
  this.displayedIndex = 0;
}//close constructor #1


//methods

void drawCard() { //draws the current card.
    if(this.currCard != null) {
      this.currCard.drawMe(flash_win);
    }  
}//close drawMe() method

void switchCard(int i) { //switches to the card at index i.
  if(this.currCard != null) { //if currently on a card,
    this.currCard.Front = true; //resets the state of the current card so that the front is displayed first if shown again.
  } 
    this.currCard = this.Cards.get(i); //then, switches to the card at index i.
}//close switchCard() method
  
void newCard(String q, String a) { //creates a new card and adds it to the deck.
  Card temp;
  temp = new Card(q, a); 
  this.Cards.add(temp); 
  this.qtCards++;
}//close newCard() method

void starCard() { //stars the curr. card.
  if(this.currCard != null) {
    this.currCard.Star = ! this.currCard.Star;
  }
}//close starCard() method

void flipCard() { //flips the curr. card
  this.currCard.Front = ! this.currCard.Front;
}//close flipCard() method
  
}//close Deck class
