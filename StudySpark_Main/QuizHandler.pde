class QuizHandler {
  String title;
  int currentIndex, score;
  boolean isFinished;
  ArrayList<QuizQuestion> questions;
  QuizQuestion currentQ;

  QuizHandler(String t) {
    this.title = t;
    this.questions = new ArrayList<QuizQuestion>();
    this.currentIndex = 0;
    this.score = 0;
    this.isFinished = false;
  }

  void addQuestion(String q, String[] ops) {
    QuizQuestion temp = new QuizQuestion(q, ops);
    this.questions.add(temp);
    if (this.questions.size() == 1) {
      this.currentQ = temp;
    }
  }

  void checkAnswer(int selectedIndex) {
    if (this.currentQ.options[selectedIndex].equals(this.currentQ.correctAnsText)) {
      this.score++;
    } else {
      this.currentQ.wasCorrect = false;
    }
    this.moveNext();
  }

  void moveNext() {
    if (this.currentIndex + 1 < this.questions.size()) {
      this.currentIndex++;
      this.currentQ = this.questions.get(this.currentIndex);
    } else {
      this.isFinished = true;
    }
  }
}
