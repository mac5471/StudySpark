void loadDeck (String name) { //loads a deck from its file

  String[] cardContent = loadStrings(name+".txt");
  Deck temp;
  temp = new Deck(name); //creates temporary deck 'temp'
  
  if(cardContent[0].equals("D")) { //code if the file is determined to be for flashcard decks
    for(int i = 1; i < cardContent.length; i += 2) {
      String question = cardContent[i];
      String answer = cardContent[i+1];
      temp.newCard(question, answer);
    }
  }
  
  else if(cardContent[0].equals("q")) { //code if the file is determined to be for quizzes
    for(int i = 1; i < cardContent.length - 2; i += 5) {
      String question = cardContent[i];
      String answer = cardContent[i+1];
      temp.newCard(question, answer);
    }
  }
    
  currDeck = temp;
  orderCards();
  currDeck.switchCard(Order[0]);
}//close loadDeck() function

void orderCards() {//randomises the order of the current deck
  int size = currDeck.Cards.size();
  
  Order = new int[size];
    
    for(int i = 0; i < size; i++) {
    Order[i] = i;
    }
 
  if(! Set) {
  IntList newOrder;
  newOrder = new IntList();
    
  for(int i = 0; i < size; i++) {
    newOrder.append(i);
  }
  
  newOrder.shuffle();
  
  for(int i = 0; i < size; i++) {
    Order[i] = newOrder.get(i);
  }
  
  }// close not-set case

}//close orderCards() function
