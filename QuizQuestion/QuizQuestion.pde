class QuizQuestion {

  //fields
  String QuestionText, CorrectAnswer;
  String[] Options;
  int PointValue;
  boolean WasCorrect, IsFlagged;

  //constructor
  QuizQuestion(String q, String[] ops, int p) {
    this.QuestionText = q;
    this.Options = ops; // so index 0 will always correct
    this.CorrectAnswer = ops[0]; 
    this.PointValue = p;
    this.WasCorrect = true;
    this.IsFlagged = false;
  }

  //methods
  void toggleFlag() {
    this.IsFlagged = !this.IsFlagged;
  }

}
