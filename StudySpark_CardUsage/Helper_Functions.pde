void loadDeck (String name) {
  String[] cardContent = loadStrings(name+".txt");
  Deck temp;
  temp = new Deck(name);
  
  if(cardContent[0].equals("D")) { //code if the file is determined to be for flashcard decks
    for(int i = 1; i < cardContent.length; i += 2) {
      String question = cardContent[i];
      String answer = cardContent[i+1];
      println(question, answer);
      temp.newCard(question, answer);
    }
  }
  
  else if(cardContent[0].equals("Q")) { //code if the file is determined to be for quizzes
    
  }
  
  temp.switchCard(0);
  displayed = temp;
}
