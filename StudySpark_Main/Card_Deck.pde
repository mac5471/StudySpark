class Deck {

//fields

//1) Deck Details
String Name; //The deck's title -- Not currently used for anything

//2) Positional Information -- Not currently used since all positional information in FlashCard class

//3) Relationship w/ Other Objects

ArrayList<Card> Cards; //The list of cards in the deck
Card currCard; //The current displayed card 
int displayedIndex, qtCards; //The index of the current displayed card, the total number of cards

//constructor

Deck(String n) { //open constructor #1
  this.Name = n;
  this.qtCards = 0;
  this.Cards = new ArrayList();
}//close constructor #1


//methods

void drawCard() { //draws the current card.
    if(this.currCard != null) {
      this.currCard.drawMe(flash_win);
    }  
}//close drawMe() method

void switchCard(int i) { //switches to the card at index i.
  if(this.currCard != null) { //if curr. on a card, resets the state of the curr. card so that the front displays when shown again.
    this.displayedIndex = i;
    this.currCard.Front = true;
  } 
    this.currCard = this.Cards.get(i);
}//close switchCard() method
  
void newCard(String q, String a) { //creates a new card and adds it to the deck.
  Card temp;
  temp = new Card(q, a);
  temp.belongsTo = this;
  temp.Index = this.qtCards;
  this.Cards.add(temp);
  this.qtCards++;
}//close newCard() method

void starCard() { //stars the curr. card.
  if(this.currCard != null) {
    this.currCard.Star = ! this.currCard.Star;
    
    if (this.currCard.Star == true){
      this.currCard.cardColour = color(255,255,0); //these should change based on GUI design
      this.currCard.textColour = color(0);
    }
    else{
      this.currCard.cardColour = color(255);
      this.currCard.textColour = color(0);
      print("hi");
    }
    
  }
}//close starCard() method

void flipCard() { //flips the curr. card
  this.currCard.Front = ! this.currCard.Front;
}//close flipCard() method
  
}//close Deck class
