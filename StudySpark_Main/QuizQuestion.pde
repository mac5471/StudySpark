class QuizQuestion {
  String questionText;
  String[] options;
  String correctAnsText;
  boolean wasCorrect;

  QuizQuestion(String q, String[] ops) {
    this.questionText = q;
    this.correctAnsText = ops[0];
    
    this.options = new String[ops.length];
    for (int i = 0; i < ops.length; i++) {
      this.options[i] = ops[i];
    }
    
    for (int i = this.options.length - 1; i > 0; i--) {
      int index = int(random(i + 1));
      String temp = this.options[index];
      this.options[index] = this.options[i];
      this.options[i] = temp;
    }
    
    this.wasCorrect = true;
  }
}
