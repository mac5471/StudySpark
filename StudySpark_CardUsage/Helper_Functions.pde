void loadDeck (String name) {
  String[] cardContent = loadStrings(name+".txt");
  Deck temp;
  temp = new Deck(name);
  for(int i = 0; i < cardContent.length; i++) { //open for-loop #1
    String content = cardContent[i];
    int comma = content.indexOf(",");
    String question = content.substring(0,comma);
    String answer = content.substring(comma + 1, content.length());
    temp.newCard(question, answer);
  } //close for-loop #1
  temp.switchCard(0);
  displayed = temp;
}
