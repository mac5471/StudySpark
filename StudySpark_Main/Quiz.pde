class QuizQuestion {
  String questionText;
  String[] options;
  String correctText; //this stores the correct string
  boolean wasCorrect;

  QuizQuestion(String q, String[] ops) {
    this.questionText = q;
    this.options = ops;
    this.wasCorrect = true;
    
    // the first line in the text file is always right
    this.correctText = ops[0]; 
    
    // this basically shuffles the anwers using random
    for (int i = this.options.length - 1; i > 0; i--) {
      int index = int(random(i + 1));
      // swapping options
      String a = this.options[index];
      this.options[index] = this.options[i];
      this.options[i] = a;
    }
  }
}
