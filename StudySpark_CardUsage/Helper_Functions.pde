void loadDeck (String name) { //loads a deck from its file

  String[] cardContent = loadStrings(name+".txt");
  Deck temp;
  temp = new Deck(name); //creates temporary deck 'temp'
  
  if(cardContent[0].equals("D")) { //code if the file is determined to be for flashcard decks
    for(int i = 1; i < cardContent.length; i += 2) {
      String question = cardContent[i];
      String answer = cardContent[i+1];
      println(question, answer);
      temp.newCard(question, answer);
    }
  }
  
  else if(cardContent[0].equals("q")) { //code if the file is determined to be for quizzes
    for(int i = 1; i < cardContent.length - 2; i += 5) {
      String question = cardContent[i];
      String answer = cardContent[i+1];
      println(question, answer);
      temp.newCard(question, answer);
    }
  }
  
  temp.switchCard(0);
  currDeck = temp;
}//close loadDeck() function
