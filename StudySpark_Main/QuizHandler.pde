class QuizHandler {
  String title;
  int currentIndex, score;
  boolean isFinished;
  ArrayList<QuizQuestion> questions;
  ArrayList<QuizQuestion> incorrectQuestions;
  ArrayList<String> incorrectAnswers;
  QuizQuestion currentQ;

  QuizHandler(String t) {
    this.title = t;
    this.questions = new ArrayList<QuizQuestion>();
    this.incorrectQuestions = new ArrayList<QuizQuestion>();
    this.incorrectAnswers = new ArrayList<String>();
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
      this.incorrectQuestions.add(this.currentQ);
      this.incorrectAnswers.add(this.currentQ.options[selectedIndex]);
  }
    this.moveNext();
  }

  void moveNext() {
    if (this.currentIndex + 1 < this.questions.size()) {
      this.currentIndex++;
      this.currentQ = this.questions.get(this.currentIndex);
    } else {
      loadIncorrectQuestions();
      updateIncorrect();
      this.isFinished = true;
    }
  }
}
